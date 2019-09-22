```{r, echo=FALSE}
names(station_locations_2017)
?over
nrow(station_locations_2017)
View(NBHD_MPLS_google)

lat_long <- station_locations_2017[,c(3,4)]

spdf <- SpatialPointsDataFrame(coords = lat_long, data = station_locations_2017,
                               proj4string = CRS("+proj=longlat +datum=WGS84
                                                 +ellps=WGS84 +towgs84=0,0,0"))
str(spdf)

stations_google <- spdf %>% spTransform(CRS("+init=epsg:4326"))

stations_google %>% as("Spatial")  

#View(over(x=NBHD_MPLS_google, y = stations_google))
plot(stations_google)

point_data <- data.frame(stations_google)
View(point_data)

ggmap(mpls_map) +
  geom_point(data = point_data, aes(x = Longitude.1, y = Latitude.1), size = .5) +
  coord_fixed(ratio = 1.3)
```

```{r,echo=FALSE}
coordinates(station_locations_2017) <- ~ Latitude + Longitude

proj4string(dat) <- proj4string(NBHD_MPLS)
over(station_locations_2017, NBHD_MPLS)


over(sodo, dat)
```