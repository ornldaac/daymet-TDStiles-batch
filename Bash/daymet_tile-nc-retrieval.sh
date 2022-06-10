#!/bin/bash
# Script to download individual .nc files from the ORNL
# Daymet server at: https://daymet.ornl.gov
# 
# Tile IDs must be provided either as a range
# of values, or as a space seperated list.Tile IDs may
# be determined from the tile image provide here:
# https://daymet.ornl.gov/static/graphics/TilesV4_Daymet.png
#
# Methods using wget and curl are shown. Each uses a resaonable
# rate limit for downloading data. Users attempting to download
# data at higher rates may be rate limited by the server. 
#
# Data is also available via the THREDDS web interface at:
# https://thredds.daac.ornl.gov/thredds/catalog/ornldaac/1840/tiles/catalog.html
#
# Daymet User Guide and Citation Information is available at:
# https://daac.ornl.gov/DAYMET/guides/Daymet_Daily_V4.html
# Daymet Home Page: https://daymet.ornl.gov
#
# Citation Information is available at:
# https://daac.ornl.gov/DAYMET/guides/Daymet_mosaics.html#Daymet_m_citation
# 
# Updated June 08, 2022 added command line arguments. (jrw)
# Updated June 27, 2014 to reflect new THREDDS urls.  (myt)
#
# Oak Ridge National Lab
Help()
{
   # Display Help
   echo "Script to download netCDFs from https://thredds.daac.ornl.gov/thredds/catalog/ornldaac/1840/tiles/catalog.html"
   echo
   echo "Usage: daymet_tile-nc-retrieval.sh [h|s|e|v|t|c] [start_tile] [end_tile]"
   echo "Options:"
   echo "h     Print this Help."
   echo "s     Specifiy start year. Default is 1980."
   echo "e     Specifiy end year. Default is 2021."
   echo "v     Specifiy variable list(quoted space delimited list). Default all variables (dayl,prcp,srad,swe,tmax,tmin,vp)."
   echo "t     Input tiles a list of tiles instead of a range(quoted space delimited list)."
   echo "c     Set flag to use curl instead of wget."    
   echo 
   echo "Examples:"
   echo "./daymet_tile-nc-retrieval.sh -s 2020 -e 2021 -v \"vp\" 11207 11209"
   echo "Download vp netcdfs for tiles 11207, 11208, 11209 between 2020 and 2021." 
   echo
}

START=1980
END=2021
VARS=("dayl" "prcp" "srad" "swe" "tmax" "tmin" "vp")
CURL=0
while getopts ":hs:e:v:t::c" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      s)
        START=$OPTARG;;
      e)
        END=$OPTARG;;
      v)
        VARS=(${OPTARG});;
      t)
        TILES="${OPTARG}";;
      c)
        CURL=1;;
      \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done
	
FST_TILE=${@: -2:1}
LST_TILE=${@: -1:1}

for ((i=$START; i<=$END; i++));do
  if [ ${#TILES[@]} -eq 0 ]; then
    for ((j=$FST_TILE; j<=$LST_TILE; j++));do
      for var in ${VARS[@]}; do
        if (( $CURL == 0 )); then 
          wget -q --show-progress --progress=bar:force --limit-rate=3m https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/${i}/${j}_${i}/${var}.nc -O ${j}_${i}_${var}.nc
        else
          curl --limit-rate 3m -o ${j}_${i}_${var}.nc https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/${i}/${j}_${i}/${var}.nc
        fi
      done
    done
  else
    for tile in ${TILES[@]};do
      for var in ${VARS[@]}; do
        if (( $CURL == 0 )); then 
          wget -q --show-progress --progress=bar:force --limit-rate=3m https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/${i}/${tile}_${i}/${var}.nc -O ${tile}_${i}_${var}.nc
        else
          curl --limit-rate 3m -o ${tile}_${i}_${var}.nc https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/${i}/${tile}_${i}/${var}.nc
        fi
      done
    done
  fi
done