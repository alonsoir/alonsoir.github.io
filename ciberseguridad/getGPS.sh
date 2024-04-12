#!/bin/bash

# Input file
FILE="${1}"
if [ -z "${FILE}" ]; then echo "No input file provided."; exit 1; fi
if [ ! -f "${FILE}" ]; then echo "Input file does not exist." exit 1; fi

# Check if GPS coordiantes are stored in the Exif part
if [ ! "$(exiftool "${FILE}" | grep "GPS Latitude")" ]; then echo "Can't find GPS coordinates for this image."; exit 1; fi

# Extract GPS coordinates
LAT=$(exiftool "${FILE}" \
          | grep Latitude \
          | grep deg \
          | cut -d : -f 2 \
          | sed -e 's/deg/°/g' -e 's/ //g'
)

LON=$(exiftool "${FILE}" \
          | grep Longitude \
          | grep deg \
          | cut -d : -f 2 \
          | sed -e 's/deg/°/g' -e 's/ //g'
)

# Open Google Maps and mark GPS coordinates
open https://www.google.com/maps/place/"${LAT}${LON}"

exit
