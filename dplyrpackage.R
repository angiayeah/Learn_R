library(dplyr)
cran <- tbl_df(mydf)
select(cran, ip_id, package, country)
select(cran, r_arch:country)
select(cran, -time) #omit time
select(cran, -(X:size))


filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")

filter(cran, !is.na(r_version))

#arrange data in ascending or descending order
cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version), ip_id)

cran3 <- select(cran, ip_id, package, size)
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb/2^10)
mutate(cran3, correct_size = size + 1000)


summarize(cran, avg_bytes = mean(size))
