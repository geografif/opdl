# opdl
Satellite images deep learning for oil palm semantic segmentation


### Datasets
* Satellite images
  * Sentinel-2 L2A Harmonized (Tile 47NQB was used to develop the model)
  * Sentinel-1 GRD
  * Sentinel-1 SLC
* Label
  * Oil palm plantations were obtained from Descals et al. (2020) ([GEE](https://developers.google.com/earth-engine/datasets/catalog/BIOPAMA_GlobalOilPalm_v1), [Zenodo](https://zenodo.org/record/4473715#.ZBCVAx_MK9I))
  * Natural forests and plantation forests were obtained from [Nusantara Atlas](https://map.nusantara-atlas.org/)
  * Water bodies and built-up areas were derived from ESRI Land Cover ([Living Atlas](https://livingatlas.arcgis.com/landcoverexplore), [GEE](https://gee-community-catalog.org/projects/S2TSLULC/))
* Other
  * Administrative boundary ([Link](http://geoportal.riau.go.id/))
  * River was obtained from Global River Width from Landsat (GRWL) dataset tile NA47, NA48, SA47, SA48. ([GEE](https://gee-community-catalog.org/projects/grwl/), [Zenodo](https://zenodo.org/record/1297434#.ZBCTKx_MK9I))

### Models and inputs
All models were developed and tested for binary (oil palm vs non-oil palm) and multi-class segmentation tasks
* U-Net with Sentinel-1 (VV, VH)
* U-Net with Sentinel-2 (R, G, B, NIR)
* U-Net with Sentinel-1 & Sentinel-2 Early Fusion 1 (All bands above)
* U-Net with Sentinel-1 & Sentinel-2 Early Fusion 2 (S1-VV, S1-VH, S2-R)
* U-Net with Sentinel-1 & Sentinel-2 Late Fusion (All bands)
* CV-UNet with Sentinel-1 Polarimetric Covariance Matrix (C11-real, C12-complex, C22-real) (Imaginary part of real components was set as 0)
* U-Net with Sentinel-1 Polarimetric Covariance Matrix & Sentinel-2 Late Fusion (All bands)

### References
Allen & Pavelsky 2018
Descals et al. 2020
Gaveau et al. 2021
Ronneberger et al. 2015
