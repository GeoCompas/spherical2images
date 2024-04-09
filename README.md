# Spherical to simple side images

Bunch of scripts to process and convert Mapillary spherical images into cube imagen and then into simple images for specific area in Mapillary API.

## Build container

```sh
export MAPILLARY_ACCESS_TOKEN="MLY|..."
docker-compose build
```

### Clip pano images into left and right side
```
bash ./clip_mapillary_pano.sh
```
From the `clip_mapillary_pano` bash:

| COMMAND                 | REQUIRED | DESCRIPTION                                              |
| -----------------       | :------: | -------------------------------------------------        |
| --input_file_points     | yes      | input file path                                          |
| --image_clip_size       | yes      | image size for each image to be clipped                  |
| --output_file_points    | yes      | output file path                                         |
| --output_images_path    | yes      | output images path                                       |
| --cube_sides            | yes      | sides of the image to save                               |

### Download no pano image 
```
bash ./download_image_no_pano.sh
```
From the `download_image_no_pano` bash:

| COMMAND                 | REQUIRED | DESCRIPTION                                              |
| -----------------       | :------: | -------------------------------------------------        |
| --input_points          | yes      | input file path                                          |
| --output_images_path    | yes      | output images path                                       |
| --s3_url                | yes      | http url to s3 public bucket                             |
| --output_points         | yes      | output file path                                         |
   

**Note**: For converting spherical-pano image to cubemap image, we are using [py360convert](https://github.com/sunset1995/py360convert):

## Examples:

**1. Mapillary spherical-pano image:**

![](img/380223760052524.jpg)

- Cube:

|               Front                |                Back                |
| :--------------------------------: | :--------------------------------: |
| ![](img/380223760052524_front.jpg) | ![](/img/380223760052524_back.jpg) |

|               Left                |               Right                |
| :-------------------------------: | :--------------------------------: |
| ![](img/380223760052524_left.jpg) | ![](img/380223760052524_right.jpg) |

|               Under                |               Over                |
| :--------------------------------: | :-------------------------------: |
| ![](img/380223760052524_under.jpg) | ![](img/380223760052524_over.jpg) |


**2. Mapillary no pano image:**

|               Original             |                Fixed                |
| :--------------------------------: | :--------------------------------: |
| ![](img/original.jpg) | ![](/img/fixed.jpg) |