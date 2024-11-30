#library(dplyr)
library(terra)
library(leaflet)
library(htmltools)
library(htmlwidgets)

# load raster
op <-rast("op21.tif")

# define description box
desc <- HTML('<div style="background-color: white; padding: 5px; border-radius: 5px; width: 200px; height: 130px; overflow: auto;">
              <p>Oil palm plantation on riparian zone detected by a neural network model from 2021 Sentinel-1 SAR images.</p>
              <p><a href="https://github.com/geografif/opdl" target="_blank">
              <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="GitHub logo" style="width: 20px; height: 20px; vertical-align: middle;"> Visit repository</a></p>
                    </div>')

# setup leaflet map
m <- leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "Imagery", providerTileOptions(zIndex=-10)) %>%
  addRasterImage(op, colors = "Reds", opacity = 0.5, group="oil palm") %>%
  setView(lng=100.649, lat=1.089, zoom=16) %>%
  addLayersControl(
    baseGroups="Imagery",
    overlayGroups="oil palm",
    options=layersControlOptions(collapsed=TRUE, autoZIndex = FALSE)) %>%
  addControl(desc, position = "bottomleft", className = "info") %>%
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate me",
    onClick=JS("function(btn, map){ map.locate({setView: true});}")));

# display map
print(m)

# export
saveWidget(m, file="index2.html")
