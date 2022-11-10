## this script will grab the L Washington limnological data stored in the MARSS package

## load data
data(lakeWAplankton, package = "MARSS")
dat <- lakeWAplanktonRaw

## prec for cols
rnd_prec <- c(1, 1, 1,
              0, 0, 0, 0, 0, 0,
              2, 2, 2, 2, 2,
              3, 3,
              2, 2) 
## round data
for(i in 3:ncol(dat)) {
  dat[,i] <- round(dat[,i], rnd_prec[i-2])
}

## set directory location
out_dir <- here::here("lectures", "week_05", "data")

## write raw data to file
write.csv(dat,
          file = file.path(out_dir, "lwa_limno.csv"),
          row.names = FALSE)
