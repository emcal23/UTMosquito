library(ggplot2)
library(tidyverse)
library(sf)
library(sp)
library(mapview)
library(data.table)
library(rgdal)

AbGsites <- read.csv("Aboveground_sites.csv") #read in data frame
View(AbGsites)

SLCounty <- st_read("SLC") #read in shape file
colnames(SLCshp)

SLCAbG <- st_as_sf(AbGsites, coords = c("Long", "Lat"), crs = 4269)
View(SLCAbG) #change data frame to a sf object
class(SLCAbG)
st_crs(SLCAbG)
st_crs(SLCounty) #check crs 
SLCAbGpoints <- st_transform(SLCAbG, crs = 4269)
st_crs(SLCAbGpoints)


SLCpointsAG <- st_transform(SLCounty, crs = st_crs(SLCAbGpoints)) #make crs the same
identical(st_crs(SLCpointsAG), st_crs(SLCAbGpoints)) #confirm

class(SLCpointsAG)
class(SLCAbGpoints)
mapviewOptions(fgb = FALSE)
mapview(SLCAbGpoints) + mapview(SLCpointsAG)

plot(SLCpointsAG$geometry) #county shape file
plot(SLCAbGpoints$geometry, add = T, col= "salmon") #SLCMAD lat long sites

#view above and belowground together
mapview(SLCAbGpoints) + mapview(SLCBGpoints) + mapview(SLCpointsAG)
mapview(SLCAbGpoints) + mapview(SLCBGpoints) + mapview(SLCpointsAG)

plot(SLCAbGpoints$geometry, add = T, col= "salmon") 
