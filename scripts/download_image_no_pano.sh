#!/usr/bin/env bash
outputDir=data
mkdir -p $outputDir

sphericaldocker="docker run -v $PWD:/mnt/ -v $HOME/.aws:/root/.aws --rm -e MAPILLARY_ACCESS_TOKEN=$MAPILLARY_ACCESS_TOKEN -e AWS_PROFILE=geocompas -it developmentseed/spherical2images:v1"

################ Download and fix no pano images from Mapillary ################

$sphericaldocker lens_correction \
        --input_points=$outputDir/mapillary_imgs_for_download.geojson \
        --output_images_path=s3://geocompas-devseed/cpal/fixed_imgs/\
        --s3_url=https://urban-blight-public-mapillary-images.s3.amazonaws.com/dallas_ipads_kaart/test/ \
        --output_points=s3://geocompas-devseed/cpal/mapillary_imgs_for_download_url.geojson