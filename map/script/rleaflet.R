library(dplyr)
library(leaflet)
library(terra)

# load raster
op <-rast("data/op21.tif")

# setup leaflet map
m <- leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "Imagery", providerTileOptions(zIndex=-10)) %>%
  addRasterImage(op, colors = "Reds", opacity = 0.5, group="oil palm", providerTileOptions(zIndex=-10)) %>%
  setView(lng=100.649, lat=1.082, zoom=14) %>%
  addLayersControl(
    baseGroups="Imagery",
    overlayGroups="oil palm",
    options=layersControlOptions(collapsed=TRUE, autoZIndex = FALSE)) %>%
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate me",
    onClick=JS("function(btn, map){ map.locate({setView: true});}")));

# display map
print(m)

#export
library(htmlwidgets)
saveWidget(m, file="m.html")
