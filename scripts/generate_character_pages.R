#!/usr/bin/env Rscript
# Generate Character Profile Pages Script
# Reads player data from database and generates individual character profile pages

library(DBI)
library(RSQLite)
library(dplyr)
library(glue)

timestamp <- format(Sys.time(), "[%Y-%m-%d %H:%M:%S]")
cat(timestamp, "Generating character profile pages\n")

# Read template
template <- readLines("asset/template/character_profile.qmd")
template_text <- paste(template, collapse = "\n")

# Connect to DB
con <- dbConnect(RSQLite::SQLite(), "asset/demonax-test.sqlite")
players_tbl <- dbReadTable(con, "players")
dbDisconnect(con)

# Process with tidyverse
players <- players_tbl |>
  filter(!id %in% c(100001, 100004)) |>
  arrange(id)

cat(timestamp, "Found", nrow(players), "characters in database\n")

# Create directory
dir.create("qmd/characters", showWarnings = FALSE, recursive = TRUE)

# Generate profile for each character
for (i in 1:nrow(players)) {
  player <- players[i, ]

  # Replace placeholders with character data
  profile_content <- glue(
    template_text,
    character_id = player$id,
    name = player$name,
    .open = "{{",
    .close = "}}"
  )

  # Write file
  output_file <- paste0("qmd/characters/", player$id, ".qmd")
  writeLines(profile_content, output_file)

  cat(timestamp, "Generated profile:", player$name, "as", player$id, "\n")
}

cat(
  timestamp,
  "Successfully generated",
  nrow(players),
  "character profile pages\n"
)
cat(timestamp, "Profile pages saved to: qmd/characters/\n")
