library(ggmap)
gangbuk <- read.csv("project_gangbuk_data.csv", header=T)
g_m <- get_map("gangbukgu", zoom=13, maptype="roadmap")
gang.map <- ggmap(g_m) + geom_point(data=gangbuk, aes(x=LON, y=LAT), size=2, alpha=0.7, color="#980000")
gang.map
#°­ºÏ °æÂû¼­ ¹üÀ§
g_m <- get_map(location=c(lon=127.0273396, lat=37.6374119), zoom=14, maptype="roadmap")
gang.map <- ggmap(g_m) + geom_point(data=gangbuk, aes(x=LON, y=LAT), size=3, alpha=0.7, color="#980000") + geom_point(aes(x=127.0273396, y=37.6374119), size=110, alpha=0.1, color="#003399")
gang.map
