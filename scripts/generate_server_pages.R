#!/usr/bin/env Rscript
# Generate Server Profile Pages Script
# Reads server data from database and generates individual profile pages

library(DBI)
library(RSQLite)
library(glue)

timestamp <- format(Sys.time(), "[%Y-%m-%d %H:%M:%S]")
cat(timestamp, "Generating server profile pages\n")

# Read template
template <- readLines("assets/template/hardware_profile.qmd")
template_text <- paste(template, collapse = "\n")

# Connect to DB
con <- dbConnect(RSQLite::SQLite(), "assets/data/site_data.db")
servers <- dbGetQuery(con, "SELECT * FROM servers ORDER BY server_name")
dbDisconnect(con)

cat(timestamp, "Found", nrow(servers), "servers in database\n")

# Create directory
dir.create("qmd/servers", showWarnings = FALSE, recursive = TRUE)

# Generate profile for each server
for (i in 1:nrow(servers)) {
  srv <- servers[i, ]

  # Convert server name to lowercase with underscores for image filename
  image_filename <- tolower(gsub("-", "_", srv$server_name))

  # Replace placeholders with server data
  profile_content <- glue(template_text,
    server_name = srv$server_name,
    image_filename = image_filename,
    environment = srv$environment,
    cpu_cores = srv$cpu_cores,
    ram_gb = srv$ram_gb,
    storage_tb = srv$storage_tb,
    uptime_pct = srv$uptime_pct,
    current_load_pct = srv$current_load_pct,
    location = srv$location,
    status = srv$status,
    health = srv$health,
    total_capacity_score = srv$total_capacity_score,
    description = srv$description,
    .open = "{{", .close = "}}"
  )

  # Write file with lowercase filename
  output_filename <- tolower(gsub("-", "_", srv$server_name))
  output_file <- paste0("qmd/servers/", output_filename, ".qmd")
  writeLines(profile_content, output_file)

  cat(timestamp, "Generated profile:", srv$server_name, "->", paste0(output_filename, ".qmd\n"))
}

cat(timestamp, "Successfully generated", nrow(servers), "server profile pages\n")
cat(timestamp, "Profile pages saved to: qmd/servers/\n")
