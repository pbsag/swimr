# link and zone shapefiles converted to R objects
library(maptools)
library(ggmap)
library(rgdal)

options(stringsAsFactors = FALSE)

ogic <- CRS("+proj=lcc +lat_1=43 +lat_2=45.5 +lat_0=41.75 +lon_0=-120.5 +x_0=399999.9999999999 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=ft +no_defs")
wgs84 <- CRS("+proj=longlat +datum=WGS84 +no_defs")

# links
links_shp <- readShapeLines(
  "data-raw/links_link_link.SHP",
  proj4string = ogic
) %>%
  spTransform(., wgs84)


links_data <- links_shp@data %>%
  tbl_df() %>%
  mutate(
    id = as.character(row_number() - 1),

    # there's a really annoying feature of R that reads in data as factors. But
    # even more annoying is the fact that the length fields in visum are written
    # as 0.159mi, which means that the numeric field gets read in as a factor.
    LENGTH = as.character(levels(LENGTH)[LENGTH]),
    R_LENGTH = as.character(levels(R_LENGTH)[R_LENGTH])
  ) %>%
  mutate(
    LENGTH = as.numeric(gsub("[^0-9$.]", "", LENGTH)),
    R_LENGTH = as.numeric(gsub("[^0-9$.]", "", R_LENGTH))
  )

links <- fortify(links_shp) %>%
  left_join(links_data, by = "id") %>%
  filter(!(TSYSSET %in% c("m", "n"))) %>%
  tbl_df()

devtools::use_data(links)

# zones
zones_shp <- readShapePoly(
  "data-raw/zones_zone.SHP",
  proj4string = ogic
) %>%
  spTransform(., wgs84)


zones_data <- zones_shp@data %>%
  mutate(id = as.character(row_number() - 1)) %>%
  tbl_df() %>%
  select(NO, ALDREGION, AZONE, BZONE, AREASQFT, id)

zones <- fortify(zones_shp) %>% tbl_df() %>%
  left_join(zones_data, by = "id")

devtools::use_data(zones)

