#!/usr/bin/env Rscript
# Generate Creature Profile Pages Script
# Reads creature data from database and generates individual profile pages

library(DBI)
library(RSQLite)
library(dplyr)
library(glue)

timestamp <- format(Sys.time(), "[%Y-%m-%d %H:%M:%S]")
cat(timestamp, "Generating creature profile pages\n")

# Read template
template <- readLines("asset/template/creature_profile.qmd")
template_text <- paste(template, collapse = "\n")

# Connect to DB
con <- dbConnect(RSQLite::SQLite(), "asset/demonax-test.sqlite")
creatures_tbl <- dbReadTable(con, "creatures")
dbDisconnect(con)

# Process with tidyverse
creatures <- creatures_tbl |>
  arrange(name)

cat(timestamp, "Found", nrow(creatures), "creatures in database\n")

# Create directory
dir.create("qmd/creatures", showWarnings = FALSE, recursive = TRUE)

# Generate profile for each creature
for (i in 1:nrow(creatures)) {
  creature <- creatures[i, ]

  # Create slug for filename (lowercase, replace spaces/special chars with underscore)
  slug <- gsub("[^a-z0-9]+", "_", tolower(creature$name))
  slug <- gsub("^_|_$", "", slug) # Remove leading/trailing underscores

  # Create sentence case name for display
  display_name <- tools::toTitleCase(creature$name)

  # Replace placeholders with creature data
  profile_content <- glue(
    template_text,
    creature_id = creature$id,
    creature_name = display_name,
    creature_race = creature$race,
    .open = "{{",
    .close = "}}"
  )

  # Write file
  output_file <- paste0("qmd/creatures/", slug, ".qmd")
  writeLines(profile_content, output_file)

  cat(timestamp, "Generated profile:", creature$name, "\n")
}

cat(
  timestamp,
  "Successfully generated",
  nrow(creatures),
  "creature profile pages\n"
)
cat(timestamp, "Profile pages saved to: qmd/creatures/\n")
