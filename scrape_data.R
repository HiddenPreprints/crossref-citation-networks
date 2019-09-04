library(rcrossref)

my_filter <- c(issn = "0138-9130",
               from_pub_date = "2007-01-01",
               until_pub_date = "2010-12-31")

dat <- cr_works(filter = my_filter, limit = 1000)
saveRDS(dat, file = "test_data.RDS")
