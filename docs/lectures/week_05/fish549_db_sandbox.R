library(DBI)
library(RPostgres)

## from Jennifer
# Hostname: p.nxh57cg2izb6dbv27dykuuxztq.db.postgresbridge.com
# Port: 5432
# Database: postgres
# Username: postgres
# Password: FGE9jBmVIuizl0ImuR9N9rPer5hXAfuIifvkAazJC59EG5zhf8bIZUU3LTrN13Eo

con <- dbConnect(drv = Postgres(), 
                 # dbname = "postgres", 
                 dbname = "lake_wa", 
                 host = "p.nxh57cg2izb6dbv27dykuuxztq.db.postgresbridge.com", 
                 port = "5432", 
                 user = "postgres", 
                 password = "FGE9jBmVIuizl0ImuR9N9rPer5hXAfuIifvkAazJC59EG5zhf8bIZUU3LTrN13Eo")

dbListTables(con)

tbl(con, from = "limno")

#### tables ####

library(dplyr)
library(dbplyr)


#### queries ####

