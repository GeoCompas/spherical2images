#!/usr/bin/env bash
outputDir=data
mkdir -p $outputDir

sphericaldocker="docker run -v $PWD:/mnt/ -v $HOME/.aws:/root/.aws --rm -e MAPILLARY_ACCESS_TOKEN=$MAPILLARY_ACCESS_TOKEN -e AWS_PROFILE=$AWS_PROFILE -it developmentseed/spherical2images:v1"

################ Download and fix no pano images from Mapillary ################

$sphericaldocker clip_mapillary_pano \
        --input_file_points=$outputDir/mapillary_imgs_for_download.geojson \
        --image_clip_size=1024 \
        --output_file_points=$outputDir/mapillary_point_images.geojson \
        --output_images_path=$outputDir/imgs \
        --cube_sides=right,left
