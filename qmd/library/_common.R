# Shared Utility Functions for Demonax Library
# This file contains reusable functions for database access, data processing,
# and table generation across weapons.qmd, equipment.qmd, and other library files.

library(DBI)
library(RSQLite)
library(dplyr)
library(jsonlite)
library(DT)

# ==============================================================================
# Database Functions
# ==============================================================================

#' Get database connection
#'
#' @param db_path Path to SQLite database file
#' @return DBI connection object
get_db_connection <- function(db_path = "../../asset/demonax-test.sqlite") {
  DBI::dbConnect(RSQLite::SQLite(), db_path)
}

#' Load item-related tables from database
#'
#' @param con Database connection object
#' @return Named list containing items, item_loot_sources, item_prices, creatures, npc_locations
load_item_tables <- function(con) {
  list(
    items = dbReadTable(con, "items"),
    item_loot_sources = dbReadTable(con, "item_loot_sources"),
    item_prices = dbReadTable(con, "item_prices"),
    creatures = dbReadTable(con, "creatures"),
    npc_locations = dbReadTable(con, "npc_locations")
  )
}

# ==============================================================================
# Helper Functions
# ==============================================================================

#' Generate NPC map links (vectorized)
#'
#' Creates HTML links to the map with crosshair centered on NPC location
#'
#' @param npc_name Character vector of NPC names
#' @param x Numeric vector of x coordinates
#' @param y Numeric vector of y coordinates
#' @param z Numeric vector of z coordinates
#' @return Character vector of HTML anchor tags
generate_npc_map_link <- function(npc_name, x, y, z) {
  mapply(function(name, x_coord, y_coord, z_coord) {
    if (is.na(name) || is.na(x_coord) || is.na(y_coord) || is.na(z_coord)) {
      return(name)
    }
    zoom <- 5
    hash <- sprintf("#%d,%d,%d,%d?crosshair=1&npcs=1", x_coord, y_coord, z_coord, zoom)
    url <- sprintf("/map/index.html%s", hash)
    return(sprintf('<a href="%s" style="color: #004294; text-decoration: none; font-weight: 500;">%s</a>',
                   url, name))
  }, npc_name, x, y, z, USE.NAMES = FALSE)
}

#' Generate quest map link from chest location string
#'
#' Parses coordinate string and creates clickable map link
#'
#' @param chest_location String in format "x,y,z" or "x,y,z (notes)"
#' @return HTML anchor tag with "Show on map" text
generate_quest_map_link <- function(chest_location) {
  if (is.na(chest_location) || chest_location == "" || chest_location == "NA") {
    return("")
  }

  # Parse format: "32605,31908,3 (1018-0997-03)" or just "32605,31908,3"
  # Extract just the coordinate part before any parenthesis
  coords_part <- trimws(strsplit(chest_location, "\\(")[[1]][1])
  parts <- strsplit(coords_part, ",")[[1]]

  if (length(parts) != 3) {
    # Return original string if parsing fails
    return(chest_location)
  }

  x <- trimws(parts[1])
  y <- trimws(parts[2])
  z <- trimws(parts[3])

  # Validate numeric
  if (is.na(as.numeric(x)) || is.na(as.numeric(y)) || is.na(as.numeric(z))) {
    return(chest_location)
  }

  # Default zoom level 5 (detailed view for quest chests)
  zoom <- 5

  # Generate hash for map navigation
  hash <- sprintf("#%s,%s,%s,%d?crosshair=1&quests=1", x, y, z, zoom)
  url <- sprintf("/map/index.html%s", hash)

  # Return HTML link with "Show on map" text
  return(sprintf('<a href="%s" style="color: #004294; text-decoration: none; font-weight: 500;">Show on map</a>',
                 url))
}

#' Parse JSON attributes safely
#'
#' @param attr_json JSON string containing item attributes
#' @return List of parsed attributes, or empty list if parsing fails
parse_attrs <- function(attr_json) {
  tryCatch({
    if(is.na(attr_json) || attr_json == "") return(list())
    fromJSON(attr_json)
  }, error = function(e) list())
}

#' Add parsed attributes column to items data frame
#'
#' @param items Data frame containing an 'attributes' column with JSON strings
#' @return Data frame with added 'parsed_attrs' column
add_parsed_attrs <- function(items) {
  items$parsed_attrs <- lapply(items$attributes, parse_attrs)
  items
}

#' Extract attributes from parsed JSON based on configuration
#'
#' Flexible attribute extraction that handles both exact and case-insensitive matching
#'
#' @param parsed_attrs_list List of parsed attribute lists
#' @param attr_config Named list where each element has output_name, type, and default
#' @return Named list of extracted attribute vectors
extract_attributes <- function(parsed_attrs_list, attr_config) {
  result <- list()

  for(attr_name in names(attr_config)) {
    config <- attr_config[[attr_name]]

    result[[config$output_name]] <- sapply(parsed_attrs_list, function(x) {
      # Check both exact match and case-insensitive match
      value <- NULL
      if(attr_name %in% names(x)) {
        value <- x[[attr_name]]
      } else {
        matching_names <- names(x)[tolower(names(x)) == tolower(attr_name)]
        if(length(matching_names) > 0) {
          value <- x[[matching_names[1]]]
        }
      }

      if(is.null(value)) return(config$default)

      switch(config$type,
        "integer" = as.integer(value),
        "numeric" = as.numeric(value),
        "character" = as.character(value),
        value
      )
    })
  }

  return(result)
}

#' Extract attributes and add as columns to items data frame
#'
#' @param items Data frame with 'parsed_attrs' column
#' @param attr_config Attribute configuration list
#' @return Data frame with added attribute columns
add_extracted_attrs <- function(items, attr_config) {
  extracted_attrs <- extract_attributes(items$parsed_attrs, attr_config)

  for(col_name in names(extracted_attrs)) {
    items[[col_name]] <- extracted_attrs[[col_name]]
  }

  items
}

#' Get list of available item images
#'
#' @param relative_path Path to item image directory
#' @return Integer vector of item IDs that have images
get_available_item_images <- function(relative_path = "../../asset/img/item") {
  item_files <- list.files(relative_path, pattern = "^[0-9]+\\.png$")
  as.integer(gsub("\\.png$", "", item_files))
}

#' Decode damage type bitfields (vectorized)
#'
#' @param bitfield Integer vector of damage type bitfields
#' @return Character vector of comma-separated damage type names
decode_damage_types <- function(bitfield) {
  sapply(bitfield, function(bf) {
    if(is.na(bf) || bf == 0) return("")

    damage_types <- c(
      "Physical" = 1,
      "Poison" = 2,
      "Fire" = 4,
      "Energy" = 8,
      "Poison (periodic)" = 32,
      "Fire (periodic)" = 64,
      "Energy (periodic)" = 128,
      "Lifedrain" = 256,
      "Manadrain" = 512
    )

    active_types <- names(damage_types)[bitwAnd(bf, damage_types) > 0]
    paste(active_types, collapse = ", ")
  })
}

#' Decode profession bitfields (vectorized)
#'
#' @param bitfield Integer vector of profession bitfields
#' @return Character vector of comma-separated profession names
decode_professions <- function(bitfield) {
  sapply(bitfield, function(bf) {
    if(is.na(bf) || bf == 1) return("")

    profession_types <- c(
      "Knight" = 2,
      "Paladin" = 4,
      "Sorcerer" = 8,
      "Druid" = 16
    )

    active_professions <- names(profession_types)[bitwAnd(bf, profession_types) > 0]
    paste(active_professions, collapse = ", ")
  })
}

# ==============================================================================
# Lookup Table Functions
# ==============================================================================

#' Create creature profile link
#'
#' Generates a link to a creature's profile page
#'
#' @param creature_name Name of the creature
#' @return HTML anchor tag linking to creature profile
generate_creature_link <- function(creature_name) {
  if (is.na(creature_name) || creature_name == "") {
    return("")
  }

  # Convert to title case
  display_name <- tools::toTitleCase(creature_name)

  # Create slug: lowercase, replace non-alphanumeric with underscore, trim leading/trailing underscores
  creature_slug <- gsub("^_|_$", "", gsub("[^a-z0-9]+", "_", tolower(creature_name)))

  sprintf('<a href="/qmd/creatures/%s.html" style="color: #004294; text-decoration: none; font-weight: 500;">%s</a>',
          creature_slug, display_name)
}

#' Create loot source lookup table
#'
#' @param item_loot_sources Data frame from item_loot_sources table
#' @param creatures Data frame from creatures table
#' @return Data frame with item_id and lootable_from (with links and drop chances) columns
create_loot_lookup <- function(item_loot_sources, creatures) {
  item_loot_sources |>
    left_join(creatures, by = c("creature_id" = "id")) |>
    group_by(item_id) |>
    summarize(
      creature_data = list(data.frame(name = name, drop_chance = drop_chance)),
      .groups = "drop"
    ) |>
    mutate(
      lootable_from = sapply(creature_data, function(data) {
        if (nrow(data) == 0) return("")
        links_with_chance <- mapply(function(n, chance) {
          link <- generate_creature_link(n)
          paste0(link, " (", chance, "%)")
        }, data$name, data$drop_chance, SIMPLIFY = TRUE)
        paste(links_with_chance, collapse = ", ")
      })
    ) |>
    select(item_id, lootable_from)
}

#' Create sell price lookup table
#'
#' @param item_prices Data frame from item_prices table
#' @param npc_locations Data frame from npc_locations table
#' @return Data frame with item_id, sell_npc, sell_price, and sell_npc_html columns
create_sell_lookup <- function(item_prices, npc_locations) {
  item_prices |>
    filter(mode == "sell") |>
    left_join(npc_locations, by = "npc_name") |>
    group_by(item_id) |>
    summarize(
      sell_npc = first(npc_name),
      sell_price = max(price),
      sell_npc_html = ifelse(
        !is.na(first(x)),
        generate_npc_map_link(first(npc_name), first(x), first(y), first(z)),
        first(npc_name)
      ),
      .groups = "drop"
    )
}

#' Create buy price lookup table
#'
#' @param item_prices Data frame from item_prices table
#' @param npc_locations Data frame from npc_locations table
#' @return Data frame with item_id, buy_npc, buy_price, and buy_npc_html columns
create_buy_lookup <- function(item_prices, npc_locations) {
  item_prices |>
    filter(mode == "buy") |>
    left_join(npc_locations, by = "npc_name") |>
    group_by(item_id) |>
    summarize(
      buy_npc = first(npc_name),
      buy_price = max(price),
      buy_npc_html = ifelse(
        !is.na(first(x)),
        generate_npc_map_link(first(npc_name), first(x), first(y), first(z)),
        first(npc_name)
      ),
      .groups = "drop"
    )
}

#' Create quest reward lookup table
#'
#' Creates a lookup that maps quest names to their chest locations
#'
#' @param quests Data frame from quests table
#' @return Data frame with quest name and chest_location columns
create_quest_lookup <- function(quests) {
  quests |>
    group_by(name) |>
    summarize(
      chest_location = first(chest_location),
      .groups = "drop"
    )
}

#' Convert quest names to map links
#'
#' Takes a comma-separated list of quest names and converts them to map links
#'
#' @param quest_names String containing comma-separated quest names
#' @param quest_lookup Data frame with quest name and chest_location
#' @return HTML string with quest names as clickable links to map locations
convert_quest_rewards_to_links <- function(quest_names, quest_lookup) {
  if (is.na(quest_names) || quest_names == "") {
    return("")
  }

  # Split by comma and trim whitespace
  quests <- trimws(strsplit(quest_names, ",")[[1]])

  # Look up each quest and create link
  links <- sapply(quests, function(quest) {
    match <- quest_lookup[quest_lookup$name == quest, ]
    if (nrow(match) > 0 && !is.na(match$chest_location) && match$chest_location != "") {
      # Parse coordinates and create clickable quest name
      chest_location <- match$chest_location
      coords_part <- trimws(strsplit(chest_location, "\\(")[[1]][1])
      parts <- strsplit(coords_part, ",")[[1]]

      if (length(parts) == 3) {
        x <- trimws(parts[1])
        y <- trimws(parts[2])
        z <- trimws(parts[3])

        # Validate numeric
        if (!is.na(as.numeric(x)) && !is.na(as.numeric(y)) && !is.na(as.numeric(z))) {
          zoom <- 5
          hash <- sprintf("#%s,%s,%s,%d?crosshair=1&quests=1", x, y, z, zoom)
          url <- sprintf("/map/index.html%s", hash)
          return(sprintf('<a href="%s" style="color: #004294; text-decoration: none; font-weight: 500;">%s</a>',
                         url, quest))
        }
      }
    }
    # Just quest name if no location found or parsing failed
    quest
  })

  paste(links, collapse = ", ")
}

# ==============================================================================
# DT Configuration
# ==============================================================================

#' Get standard DataTable options
#'
#' @param image_col_width Width for the image column (CSS value like "32px" or "50px")
#' @return List of DT options
get_dt_options <- function(image_col_width = "32px") {
  list(
    pageLength = 25,
    searching = TRUE,
    ordering = TRUE,
    columnDefs = list(
      list(width = image_col_width, targets = 0)
    )
  )
}

#' Create standardized DataTable
#'
#' @param data Data frame to display
#' @param image_col_width Width for the image column
#' @param ... Additional arguments passed to DT::datatable
#' @return DT datatable object
create_datatable <- function(data, image_col_width = "32px", ...) {
  DT::datatable(
    data,
    options = get_dt_options(image_col_width),
    rownames = FALSE,
    escape = FALSE,
    filter = 'top',
    ...
  )
}
