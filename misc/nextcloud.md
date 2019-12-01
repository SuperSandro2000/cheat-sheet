# Nextcloud 

## Table of Contents

* [Optimization](#optimization)

## Optimization

Source: https://ownyourbits.com/2019/06/29/understanding-and-improving-nextcloud-previews/
````
./occ config:app:set previewgenerator squareSizes --value="32 256"
./occ config:app:set previewgenerator widthSizes  --value="256 384"
./occ config:app:set previewgenerator heightSizes --value="256"
./occ config:system:set preview_max_x --value 2048
./occ config:system:set preview_max_y --value 2048
./occ config:system:set jpeg_quality --value 60
./occ config:app:set preview jpeg_quality --value="60"
````
