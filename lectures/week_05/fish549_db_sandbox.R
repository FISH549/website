library(DBI)
library(dplyr)
library(dbplyr)
library(odbc)



## from Jennifer
# Hostname: p.nxh57cg2izb6dbv27dykuuxztq.db.postgresbridge.com
# Port: 5432
# Database: postgres
# Username: postgres
# Password: FGE9jBmVIuizl0ImuR9N9rPer5hXAfuIifvkAazJC59EG5zhf8bIZUU3LTrN13Eo

install.packages("RPostgreSQL")
require("RPostgreSQL")
# this completes installing packages

# now start creating connection
con <- dbConnect(dbDriver("PostgreSQL"),
                 dbname = "postgres",
                 host = "p.nxh57cg2izb6dbv27dykuuxztq.db.postgresbridge.com",
                 port = 5432,
                 user = "postgres",
                 password = "FGE9jBmVIuizl0ImuR9N9rPer5hXAfuIifvkAazJC59EG5zhf8bIZUU3LTrN13Eo")
# this completes creating connection

# get all the tables from connection
dbListTables(con)




## from here
## https://solutions.posit.co/connections/db/best-practices/drivers/#connecting-to-a-database-in-r
con <- dbConnect(
  odbc::odbc(),
  driver = dbDriver("PostgreSQL"),
  database = "test_db",
  uid    = Sys.getenv("DB_USER"),
  pwd    = Sys.getenv("DB_PASSWORD"),
  host   = "localhost",
  port   = 5432
)


## from here
## https://solutions.posit.co/connections/db/databases/postgresql/
con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = "PostgreSQL Driver",
                      Server   = "p.nxh57cg2izb6dbv27dykuuxztq.db.postgresbridge.com",
                      Database = "postgres",
                      UID      = "postgres", # rstudioapi::askForPassword("userID"),
                      PWD      = "FGE9jBmVIuizl0ImuR9N9rPer5hXAfuIifvkAazJC59EG5zhf8bIZUU3LTrN13Eo", # rstudioapi::askForPassword("pwd"),
                      Port     = 5432)

