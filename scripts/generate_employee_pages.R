#!/usr/bin/env Rscript
# Generate Employee Profile Pages Script
# Reads employee data from database and generates individual profile pages

library(DBI)
library(RSQLite)
library(glue)

timestamp <- format(Sys.time(), "[%Y-%m-%d %H:%M:%S]")
cat(timestamp, "Generating employee profile pages\n")

# Read template
template <- readLines("assets/template/employee_profile.qmd")
template_text <- paste(template, collapse = "\n")

# Connect to DB
con <- dbConnect(RSQLite::SQLite(), "assets/data/site_data.db")
employees <- dbGetQuery(con, "SELECT * FROM employees ORDER BY employee_id")
dbDisconnect(con)

cat(timestamp, "Found", nrow(employees), "employees in database\n")

# Create directory
dir.create("qmd/employees", showWarnings = FALSE, recursive = TRUE)

# Generate profile for each employee
for (i in 1:nrow(employees)) {
  emp <- employees[i, ]

  # Replace placeholders with employee data
  profile_content <- glue(template_text,
    employee_id = emp$employee_id,
    name = emp$name,
    role = emp$role,
    department = emp$department,
    years_experience = emp$years_experience,
    projects_completed = emp$projects_completed,
    active_projects = emp$active_projects,
    utilization = emp$utilization,
    email = emp$email,
    phone = emp$phone,
    location = emp$location,
    bio = emp$bio,
    .open = "{{", .close = "}}"
  )

  # Write file
  output_file <- paste0("qmd/employees/", emp$employee_id, ".qmd")
  writeLines(profile_content, output_file)

  cat(timestamp, "Generated profile:", emp$name, "(", emp$employee_id, ")\n")
}

cat(timestamp, "Successfully generated", nrow(employees), "employee profile pages\n")
cat(timestamp, "Profile pages saved to: qmd/employees/\n")
