#!/usr/bin/env Rscript
# Database Creation Script for Quarto Website
# Creates SQLite database with all tables and sample data

library(DBI)
library(RSQLite)
library(magick)

cat("Creating database and populating with sample data...\n\n")

# Create database connection
con <- dbConnect(RSQLite::SQLite(), "assets/data/site_data.db")

# ============================================================================
# TABLE 1: EMPLOYEES
# ============================================================================
cat("Creating employees table...\n")

dbExecute(con, "DROP TABLE IF EXISTS employees")
dbExecute(con, "
CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT NOT NULL,
  role TEXT NOT NULL,
  years_experience INTEGER,
  projects_completed INTEGER,
  active_projects INTEGER,
  utilization INTEGER,
  status TEXT,
  email TEXT,
  phone TEXT,
  location TEXT,
  start_date TEXT,
  photo_filename TEXT,
  bio TEXT
)")

# Sample employee data (12 employees matching current people.qmd)
employees_data <- data.frame(
  employee_id = 100001:100012,
  name = c("Sarah Johnson", "Michael Chen", "Emily Rodriguez", "David Kim",
           "Jessica Martinez", "Robert Taylor", "Amanda Wilson", "James Brown",
           "Maria Garcia", "Christopher Lee", "Nicole Anderson", "Daniel White"),
  department = c("Analytics", "Data Science", "Analytics", "Engineering",
                 "Data Science", "Analytics", "Engineering", "Data Science",
                 "Analytics", "Engineering", "Data Science", "Analytics"),
  role = c("Senior Analyst", "Data Scientist", "Analyst", "Data Engineer",
           "ML Engineer", "Team Lead", "Senior Engineer", "Data Scientist",
           "Analyst", "Data Engineer", "Data Scientist", "Senior Analyst"),
  years_experience = c(7, 5, 3, 6, 4, 10, 8, 5, 2, 7, 6, 9),
  projects_completed = c(34, 28, 15, 42, 19, 67, 53, 31, 12, 45, 29, 58),
  active_projects = c(3, 4, 2, 5, 3, 2, 4, 3, 3, 4, 4, 3),
  utilization = c(60, 80, 40, 100, 60, 40, 80, 60, 60, 80, 80, 60),
  status = c("Normal", "High Load", "Normal", "High Load", "Normal", "Normal",
             "High Load", "Normal", "Normal", "High Load", "High Load", "Normal"),
  email = c("sjohnson@company.com", "mchen@company.com", "erodriguez@company.com",
            "dkim@company.com", "jmartinez@company.com", "rtaylor@company.com",
            "awilson@company.com", "jbrown@company.com", "mgarcia@company.com",
            "clee@company.com", "nanderson@company.com", "dwhite@company.com"),
  phone = c("+1-555-0101", "+1-555-0102", "+1-555-0103", "+1-555-0104",
            "+1-555-0105", "+1-555-0106", "+1-555-0107", "+1-555-0108",
            "+1-555-0109", "+1-555-0110", "+1-555-0111", "+1-555-0112"),
  location = c("New York", "San Francisco", "Austin", "Seattle",
               "Boston", "New York", "Seattle", "San Francisco",
               "Austin", "Seattle", "Boston", "New York"),
  start_date = c("2017-03-15", "2019-06-01", "2021-09-10", "2018-04-20",
                 "2020-02-15", "2014-01-10", "2016-07-25", "2019-05-12",
                 "2022-08-01", "2017-11-03", "2018-09-15", "2015-10-22"),
  photo_filename = paste0(100001:100012, ".jpg"),
  bio = c(
    "Experienced analyst specializing in business intelligence and data visualization.",
    "Machine learning expert focused on predictive modeling and AI solutions.",
    "Junior analyst passionate about statistical analysis and data storytelling.",
    "Senior data engineer building robust ETL pipelines and data infrastructure.",
    "ML engineer developing cutting-edge deep learning models for production.",
    "Team lead with extensive experience in analytics strategy and team management.",
    "Infrastructure specialist ensuring high availability and system reliability.",
    "Data scientist with expertise in natural language processing and computer vision.",
    "Entry-level analyst eager to learn and contribute to data-driven insights.",
    "Backend engineer specializing in distributed systems and database optimization.",
    "Data scientist focused on causal inference and experimental design.",
    "Senior analyst leading cross-functional analytics projects and mentoring juniors."
  ),
  stringsAsFactors = FALSE
)

dbWriteTable(con, "employees", employees_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(employees_data), "employees\n")

# ============================================================================
# TABLE 2: USAGE
# ============================================================================
cat("Creating usage table...\n")

dbExecute(con, "DROP TABLE IF EXISTS usage")
dbExecute(con, "
CREATE TABLE usage (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  department TEXT NOT NULL,
  month TEXT NOT NULL,
  year INTEGER NOT NULL,
  total_sessions INTEGER,
  avg_session_duration REAL,
  data_processed_gb REAL,
  growth_rate REAL,
  efficiency REAL
)")

usage_data <- data.frame(
  department = rep(c("Analytics", "Data Science", "Engineering", "Operations",
                     "Finance", "Marketing", "Sales", "HR"), each = 3),
  month = rep(c("November", "December", "January"), 8),
  year = rep(c(2025, 2025, 2026), 8),
  total_sessions = c(
    456, 523, 489,  # Analytics
    389, 412, 445,  # Data Science
    234, 267, 298,  # Engineering
    178, 192, 201,  # Operations
    145, 167, 189,  # Finance
    234, 289, 312,  # Marketing
    312, 345, 378,  # Sales
    89, 98, 112     # HR
  ),
  avg_session_duration = round(runif(24, 15, 45), 1),
  data_processed_gb = round(runif(24, 10, 500), 1),
  growth_rate = c(0, 14.7, -6.5, 0, 5.9, 8.0, 0, 14.1, 11.6, 0, 7.9, 4.7,
                  0, 15.2, 13.2, 0, 23.5, 8.0, 0, 10.6, 9.6, 0, 10.1, 14.3),
  efficiency = round(runif(24, 0.5, 12), 2),
  stringsAsFactors = FALSE
)

dbWriteTable(con, "usage", usage_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(usage_data), "usage records\n")

# ============================================================================
# TABLE 3: LEADERBOARD
# ============================================================================
cat("Creating leaderboard table...\n")

dbExecute(con, "DROP TABLE IF EXISTS leaderboard")
dbExecute(con, "
CREATE TABLE leaderboard (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  rank INTEGER NOT NULL,
  total_points INTEGER,
  quality_score REAL,
  innovation_score INTEGER,
  collaboration_score INTEGER,
  overall_rating REAL,
  badge TEXT,
  period TEXT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)")

leaderboard_data <- data.frame(
  employee_id = c(100001, 100002, 100006, 100012, 100003, 100007, 100005,
                  100004, 100008, 100009, 100010, 100011),
  rank = 1:12,
  total_points = c(9850, 9420, 9180, 8965, 8734, 8590, 8412, 8289,
                   8156, 7998, 7845, 7723),
  quality_score = round(runif(12, 88, 99.5), 1),
  innovation_score = sample(75:100, 12, replace = TRUE),
  collaboration_score = sample(80:100, 12, replace = TRUE),
  overall_rating = round(runif(12, 85, 97), 1),
  badge = c("🥇 Elite", "🥇 Elite", "🥇 Elite", "⭐ Top Performer",
            "⭐ Top Performer", "⭐ Top Performer", "⭐ Top Performer",
            "⭐ Top Performer", "⭐ Top Performer", "⭐ Top Performer",
            "💎 High Achiever", "💎 High Achiever"),
  period = "2026-01",
  stringsAsFactors = FALSE
)

dbWriteTable(con, "leaderboard", leaderboard_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(leaderboard_data), "leaderboard records\n")

# ============================================================================
# TABLE 4: SERVERS
# ============================================================================
cat("Creating servers table...\n")

dbExecute(con, "DROP TABLE IF EXISTS servers")
dbExecute(con, "
CREATE TABLE servers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  server_name TEXT NOT NULL UNIQUE,
  environment TEXT NOT NULL,
  cpu_cores INTEGER,
  ram_gb INTEGER,
  storage_tb REAL,
  uptime_pct REAL,
  current_load_pct REAL,
  location TEXT,
  status TEXT,
  health TEXT,
  total_capacity_score REAL
)")

servers_data <- data.frame(
  server_name = c("PROD-APP-01", "PROD-APP-02", "PROD-DB-01", "PROD-DB-02",
                  "DEV-APP-01", "DEV-DB-01", "TEST-APP-01", "TEST-DB-01",
                  "ANALYTICS-01", "ANALYTICS-02", "ML-GPU-01", "ML-GPU-02",
                  "WEB-01", "WEB-02", "CACHE-01", "STORAGE-01"),
  environment = c("Production", "Production", "Production", "Production",
                  "Development", "Development", "Testing", "Testing",
                  "Analytics", "Analytics", "ML/AI", "ML/AI",
                  "Web", "Web", "Cache", "Storage"),
  cpu_cores = c(32, 32, 64, 64, 16, 32, 16, 32,
                48, 48, 96, 96, 24, 24, 16, 8),
  ram_gb = c(128, 128, 512, 512, 64, 256, 64, 256,
             256, 256, 512, 512, 128, 128, 64, 1024),
  storage_tb = c(2, 2, 10, 10, 1, 5, 1, 5,
                 8, 8, 4, 4, 2, 2, 1, 50),
  uptime_pct = c(99.99, 99.98, 99.99, 99.99, 98.5, 98.7, 97.8, 97.5,
                 99.5, 99.4, 99.2, 99.3, 99.9, 99.8, 99.95, 99.99),
  current_load_pct = c(67, 72, 54, 48, 45, 38, 32, 28,
                       78, 82, 91, 88, 56, 52, 68, 45),
  location = rep(c("US-East", "US-West", "EU-West", "Asia-Pacific"), each = 4),
  status = c("Normal", "Normal", "Normal", "Normal", "Normal", "Low Load",
             "Low Load", "Low Load", "Normal", "High Load", "High Load",
             "High Load", "Normal", "Normal", "Normal", "Normal"),
  health = c("Excellent", "Excellent", "Excellent", "Excellent", "Good", "Good",
             "Monitor", "Monitor", "Good", "Good", "Good", "Good", "Excellent",
             "Excellent", "Excellent", "Excellent"),
  total_capacity_score = round(c(32*2 + 128 + 2*10, 32*2 + 128 + 2*10,
                                 64*2 + 512 + 10*10, 64*2 + 512 + 10*10,
                                 16*2 + 64 + 1*10, 32*2 + 256 + 5*10,
                                 16*2 + 64 + 1*10, 32*2 + 256 + 5*10,
                                 48*2 + 256 + 8*10, 48*2 + 256 + 8*10,
                                 96*2 + 512 + 4*10, 96*2 + 512 + 4*10,
                                 24*2 + 128 + 2*10, 24*2 + 128 + 2*10,
                                 16*2 + 64 + 1*10, 8*2 + 1024 + 50*10) / 100, 1),
  stringsAsFactors = FALSE
)

dbWriteTable(con, "servers", servers_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(servers_data), "server records\n")

# ============================================================================
# TABLE 5: SOFTWARE
# ============================================================================
cat("Creating software table...\n")

dbExecute(con, "DROP TABLE IF EXISTS software")
dbExecute(con, "
CREATE TABLE software (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  software_name TEXT NOT NULL,
  category TEXT NOT NULL,
  version TEXT,
  license TEXT,
  support_level TEXT,
  users INTEGER,
  last_review TEXT,
  status TEXT,
  adoption_rate REAL,
  days_since_review INTEGER
)")

software_data <- data.frame(
  software_name = c("R", "Python", "RStudio", "VS Code", "Jupyter",
                    "Git", "Docker", "PostgreSQL", "Tableau", "Power BI",
                    "Quarto", "Posit Connect", "Shiny", "Plotly", "ggplot2",
                    "pandas", "scikit-learn", "TensorFlow", "Apache Spark", "DuckDB"),
  category = c("Language", "Language", "IDE", "IDE", "IDE",
               "Version Control", "Container", "Database", "Visualization", "Visualization",
               "Publishing", "Platform", "Framework", "Library", "Library",
               "Library", "Library", "Library", "Framework", "Database"),
  version = c("4.3.2", "3.11", "2023.12", "1.85", "Latest",
              "2.43", "24.0", "16.1", "2023.3", "Latest",
              "1.4", "2023.12", "1.8.0", "5.18", "3.4.4",
              "2.1.4", "1.3.2", "2.15", "3.5.0", "0.10"),
  license = c("GPL", "PSF", "AGPL", "MIT", "BSD",
              "GPL", "Apache", "PostgreSQL", "Proprietary", "Proprietary",
              "GPL", "Proprietary", "GPL", "MIT", "MIT",
              "BSD", "BSD", "Apache", "Apache", "MIT"),
  support_level = c("Full", "Full", "Full", "Full", "Full",
                    "Full", "Full", "Full", "Limited", "Limited",
                    "Full", "Full", "Full", "Full", "Full",
                    "Full", "Full", "Community", "Community", "Full"),
  users = c(156, 189, 145, 167, 98,
            178, 123, 89, 67, 54,
            134, 45, 87, 145, 156,
            178, 98, 67, 34, 56),
  last_review = c("2024-01-05", "2024-01-06", "2024-01-04", "2024-01-07", "2024-01-03",
                  "2024-01-08", "2024-01-02", "2024-01-05", "2023-12-20", "2023-12-18",
                  "2024-01-09", "2024-01-01", "2024-01-06", "2024-01-07", "2024-01-05",
                  "2024-01-06", "2024-01-04", "2024-01-03", "2023-12-28", "2024-01-08"),
  status = c(rep("Recommended", 17), "Evaluation", "Evaluation", "Recommended"),
  adoption_rate = round(c(156, 189, 145, 167, 98, 178, 123, 89, 67, 54,
                          134, 45, 87, 145, 156, 178, 98, 67, 34, 56) / 189 * 100, 1),
  days_since_review = as.integer(as.Date("2026-01-10") -
                                   as.Date(c("2024-01-05", "2024-01-06", "2024-01-04",
                                           "2024-01-07", "2024-01-03", "2024-01-08",
                                           "2024-01-02", "2024-01-05", "2023-12-20",
                                           "2023-12-18", "2024-01-09", "2024-01-01",
                                           "2024-01-06", "2024-01-07", "2024-01-05",
                                           "2024-01-06", "2024-01-04", "2024-01-03",
                                           "2023-12-28", "2024-01-08"))),
  stringsAsFactors = FALSE
)

dbWriteTable(con, "software", software_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(software_data), "software records\n")

# ============================================================================
# TABLE 6: SUPPORT_RESOURCES
# ============================================================================
cat("Creating support_resources table...\n")

dbExecute(con, "DROP TABLE IF EXISTS support_resources")
dbExecute(con, "
CREATE TABLE support_resources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT NOT NULL,
  topic TEXT NOT NULL,
  description TEXT,
  contact_email TEXT,
  response_time TEXT,
  priority INTEGER,
  available_24_7 BOOLEAN
)")

support_data <- data.frame(
  category = c("Technical", "Technical", "Account", "Security", "Training",
               "Infrastructure", "Software", "Data Access", "Billing", "General",
               "Emergency", "Documentation"),
  topic = c("Server Issues", "Application Bugs", "Access Requests", "Security Incidents",
            "Training Sessions", "Infrastructure Support", "Software Installation",
            "Data Permissions", "Billing Questions", "General Inquiries",
            "Critical Outages", "Documentation Requests"),
  description = c(
    "Report and resolve server connectivity, performance, or availability issues",
    "Submit bug reports and track resolution of application issues",
    "Request access to systems, applications, and resources",
    "Report security incidents and vulnerabilities immediately",
    "Schedule training sessions and workshops for teams",
    "Infrastructure provisioning, scaling, and maintenance support",
    "Install, update, or troubleshoot approved software packages",
    "Request data access permissions and manage data governance",
    "Questions about invoices, subscriptions, and cost allocation",
    "General questions and support for all other topics",
    "Immediate response for critical system outages",
    "Request technical documentation and user guides"
  ),
  contact_email = c(
    "infrastructure@company.com", "dev-support@company.com", "access@company.com",
    "security@company.com", "training@company.com", "infrastructure@company.com",
    "it-support@company.com", "data-governance@company.com", "billing@company.com",
    "support@company.com", "emergency@company.com", "docs@company.com"
  ),
  response_time = c("2-4 hours", "1 business day", "2 business days", "Immediate",
                    "1 week", "4 hours", "1 business day", "2 business days",
                    "3 business days", "2 business days", "15 minutes", "1 business day"),
  priority = c(2, 3, 3, 1, 4, 2, 3, 3, 4, 5, 1, 4),
  available_24_7 = c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE,
                     FALSE, FALSE, TRUE, FALSE),
  stringsAsFactors = FALSE
)

dbWriteTable(con, "support_resources", support_data, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(support_data), "support resource records\n")

# ============================================================================
# TABLE 7-10: ACHIEVEMENT TABLES
# ============================================================================

# ACHIEVEMENTS_QUANTUM
cat("Creating achievements_quantum table...\n")

dbExecute(con, "DROP TABLE IF EXISTS achievements_quantum")
dbExecute(con, "
CREATE TABLE achievements_quantum (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  task_name TEXT NOT NULL,
  completion_date TEXT,
  complexity_score INTEGER,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)")

quantum_tasks <- c(
  "Quantum Optimization Algorithm", "Entanglement Simulation", "Qubit Calibration",
  "Quantum Error Correction", "Superposition Analysis", "Quantum Circuit Design",
  "Bell State Preparation", "Quantum Teleportation Protocol", "Shor's Algorithm Implementation",
  "Grover's Search Optimization", "Quantum Annealing Study", "Quantum Key Distribution"
)

achievements_quantum <- data.frame()
for (emp_id in 100001:100012) {
  n_tasks <- sample(5:10, 1)
  emp_quantum <- data.frame(
    employee_id = emp_id,
    task_name = sample(quantum_tasks, n_tasks, replace = FALSE),
    completion_date = as.character(sample(seq(as.Date("2024-01-01"), as.Date("2026-01-10"), by = "day"), n_tasks)),
    complexity_score = sample(60:100, n_tasks, replace = TRUE),
    stringsAsFactors = FALSE
  )
  achievements_quantum <- rbind(achievements_quantum, emp_quantum)
}

dbWriteTable(con, "achievements_quantum", achievements_quantum, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(achievements_quantum), "quantum achievement records\n")

# ACHIEVEMENTS_SERVER
cat("Creating achievements_server table...\n")

dbExecute(con, "DROP TABLE IF EXISTS achievements_server")
dbExecute(con, "
CREATE TABLE achievements_server (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  server_name TEXT NOT NULL,
  action_type TEXT,
  date_completed TEXT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)")

server_names <- c("PROD-APP-01", "PROD-DB-01", "ML-GPU-01", "ANALYTICS-01",
                  "WEB-01", "CACHE-01", "STORAGE-01", "TEST-APP-01")
action_types <- c("Deployed", "Optimized", "Migrated", "Upgraded", "Configured",
                  "Monitored", "Secured", "Scaled")

achievements_server <- data.frame()
for (emp_id in 100001:100012) {
  n_actions <- sample(5:10, 1)
  emp_server <- data.frame(
    employee_id = emp_id,
    server_name = sample(server_names, n_actions, replace = TRUE),
    action_type = sample(action_types, n_actions, replace = TRUE),
    date_completed = as.character(sample(seq(as.Date("2024-01-01"), as.Date("2026-01-10"), by = "day"), n_actions)),
    stringsAsFactors = FALSE
  )
  achievements_server <- rbind(achievements_server, emp_server)
}

dbWriteTable(con, "achievements_server", achievements_server, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(achievements_server), "server achievement records\n")

# ACHIEVEMENTS_CODE
cat("Creating achievements_code table...\n")

dbExecute(con, "DROP TABLE IF EXISTS achievements_code")
dbExecute(con, "
CREATE TABLE achievements_code (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  repository TEXT NOT NULL,
  lines_of_code INTEGER,
  commits INTEGER,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)")

repositories <- c("analytics-platform", "ml-pipeline", "data-warehouse", "web-app",
                  "api-gateway", "dashboard", "etl-jobs", "recommendation-engine",
                  "user-service", "reporting-tools")

achievements_code <- data.frame()
for (emp_id in 100001:100012) {
  n_repos <- sample(5:10, 1)
  emp_code <- data.frame(
    employee_id = emp_id,
    repository = sample(repositories, n_repos, replace = FALSE),
    lines_of_code = sample(500:5000, n_repos, replace = TRUE),
    commits = sample(10:150, n_repos, replace = TRUE),
    stringsAsFactors = FALSE
  )
  achievements_code <- rbind(achievements_code, emp_code)
}

dbWriteTable(con, "achievements_code", achievements_code, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(achievements_code), "code achievement records\n")

# ACHIEVEMENTS_GENERAL
cat("Creating achievements_general table...\n")

dbExecute(con, "DROP TABLE IF EXISTS achievements_general")
dbExecute(con, "
CREATE TABLE achievements_general (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  achievement_name TEXT NOT NULL,
  category TEXT,
  date_achieved TEXT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)")

achievements_list <- c(
  "Team Player Award", "Innovation Prize", "Customer Success Champion",
  "Technical Excellence Award", "Mentor of the Year", "5 Year Anniversary",
  "Best Presenter", "Community Contributor", "Problem Solver Award",
  "Leadership Recognition", "Quality Champion", "Fast Learner Award",
  "Collaboration Star", "Process Improvement Award", "Security Champion"
)

categories <- c("Recognition", "Milestone", "Technical", "Leadership", "Community")

achievements_general <- data.frame()
for (emp_id in 100001:100012) {
  n_achievements <- sample(5:10, 1)
  emp_achievements <- data.frame(
    employee_id = emp_id,
    achievement_name = sample(achievements_list, n_achievements, replace = FALSE),
    category = sample(categories, n_achievements, replace = TRUE),
    date_achieved = as.character(sample(seq(as.Date("2024-01-01"), as.Date("2026-01-10"), by = "day"), n_achievements)),
    stringsAsFactors = FALSE
  )
  achievements_general <- rbind(achievements_general, emp_achievements)
}

dbWriteTable(con, "achievements_general", achievements_general, overwrite = TRUE, row.names = FALSE)
cat("  Inserted", nrow(achievements_general), "general achievement records\n")

# ============================================================================
# GENERATE EMPLOYEE PHOTOS
# ============================================================================
cat("\nGenerating employee placeholder photos...\n")

# Create directory
dir.create("assets/img/employees", showWarnings = FALSE, recursive = TRUE)

# Theme colors from website
employee_colors <- c("#4b7874", "#0D2E2B", "#cfa600", "#793d03", "#debb9d")

for (i in 1:nrow(employees_data)) {
  emp_id <- employees_data$employee_id[i]
  color <- employee_colors[((i - 1) %% length(employee_colors)) + 1]

  # Create 400x400 placeholder with employee ID
  img <- image_blank(400, 400, color = color) %>%
    image_annotate(
      as.character(emp_id),
      size = 80,
      color = "white",
      gravity = "center",
      font = "Arial",
      weight = 700
    )

  image_write(img, paste0("assets/img/employees/", emp_id, ".jpg"))
}

cat("  Generated", nrow(employees_data), "placeholder images\n")

# ============================================================================
# CLOSE DATABASE
# ============================================================================
dbDisconnect(con)

cat("\n✅ Database creation complete!\n")
cat("📁 Database saved to: assets/data/site_data.db\n")
cat("📸 Employee photos saved to: assets/img/employees/\n\n")

# Print summary
cat("Summary:\n")
cat("  - 12 employees (IDs 100001-100012)\n")
cat("  - 24 usage records (8 departments × 3 months)\n")
cat("  - 12 leaderboard rankings\n")
cat("  - 16 server records\n")
cat("  - 20 software packages\n")
cat("  - 12 support resources\n")
cat("  - ", nrow(achievements_quantum), " quantum achievements\n")
cat("  - ", nrow(achievements_server), " server achievements\n")
cat("  - ", nrow(achievements_code), " code achievements\n")
cat("  - ", nrow(achievements_general), " general achievements\n")
cat("\n")
