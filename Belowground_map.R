library(ggplot2)
library(tidyverse)
library(sf)
library(sp)
library(mapview)
library(data.table)
library(rgdal)

BGsites <- read.csv("BelowGround_sites.csv") #read in data frame
View(BGsites)

SLCounty <- st_read("SLC") #read in shape file
colnames(SLCshp)

SLCBG <- st_as_sf(BGsites, coords = c("Long", "Lat"), crs = 4269)
View(SLCBG) #change data frame to a sf object
class(SLCBG)
st_crs(SLCBG)
st_crs(SLCounty) #check crs 
SLCBGpoints <- st_transform(SLCBG, crs = 4269)
st_crs(SLCBGpoints)


SLCpointsBG <- st_transform(SLCounty, crs = st_crs(SLCBGpoints)) #make crs the same
identical(st_crs(SLCpointsBG), st_crs(SLCBGpoints)) #confirm

class(SLCpointsBG)
class(SLCpointsBG)
mapviewOptions(fgb = FALSE)
mapview(SLCBGpoints) + mapview(SLCpointsBG)


plot(SLCpointsBG$geometry) #county shape file
plot(SLCBGpoints$geometry, add = T, col= "salmon") #SLCMAD lat long sites
