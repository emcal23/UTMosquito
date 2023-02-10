library(ggplot2)
library(tidyverse)
library(sf)
library(sp)
library(mapview)
library(data.table)
library(rgdal)

sites <- read.csv("/Users/emigrace/Documents/UTMosquito/ectrap_sites.csv") #read in data frame
View(sites)

SLC <- st_read("/Users/emigrace/Documents/UTMosquito/SLC") #read in shape file
colnames(SLC)

SLCMAD <- st_as_sf(sites, coords = c("long", "lat"), crs = 4269)
View(SLCMAD) #change data frame to a sf object
class(SLCMAD)
st_crs(SLCMAD)
st_crs(SLC) #check crs 
SLCMADpoints <- st_transform(SLCMAD, crs = 4269)
st_crs(SLCMADpoints)

SLCp <- st_transform(SLC, crs = st_crs(SLCMADpoints)) #make crs the same
identical(st_crs(SLCp), st_crs(SLCMADpoints)) #confirm

class(SLCp)
class(SLCMADpoints)
mapviewOptions(fgb = FALSE)
mapview(SLCp) + mapview(SLCMADpoints)


plot(SLCp$geometry) #county shape file
plot(SLCMADpoints$geometry, add = T, col= "salmon") #SLCMAD lat long sites






