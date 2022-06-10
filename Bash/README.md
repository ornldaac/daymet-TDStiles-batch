# Automate Downloads of Multiple Daymet Tiles 
This repo contains a sample bash script and run example for automating tile-level netCDF downloads of Daymet daily data.  Data are available by year and variable and are accessed from the ORNL DAAC THREDDS data server.

## Example Usage
The example will download netCDFs for the dayl variable between 2020 and 2021 for tiles between 11207 and 11209.
1. Download `daymet_tile-nc-retrieval.sh`
2. Run the following command:
   ```bash
   ./daymet_tile-nc-retrieval.sh -s 2020 -e 2021 -v dayl 11207 11209
   ```

Here is a sample run:
```bash
$ ./daymet_tile-nc-retrieval.sh -s 2020 -e 2021 -v dayl 11207 11209
--2022-06-08 18:40:16--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2020/11207_2020/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 72732652 (69M) [application/x-netcdf]
Saving to: ‘11207_2020_dayl.nc’

11207_2020_dayl.nc            100%[=================================================>]  69.36M  3.11MB/s    in 23s

2022-06-08 18:40:48 (3.00 MB/s) - ‘11207_2020_dayl.nc’ saved [72732652/72732652]

--2022-06-08 18:40:48--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2020/11208_2020/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 75383612 (72M) [application/x-netcdf]
Saving to: ‘11208_2020_dayl.nc’

11208_2020_dayl.nc            100%[=================================================>]  71.89M  3.03MB/s    in 27s

2022-06-08 18:41:23 (2.69 MB/s) - ‘11208_2020_dayl.nc’ saved [75383612/75383612]

--2022-06-08 18:41:23--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2020/11209_2020/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 77764456 (74M) [application/x-netcdf]
Saving to: ‘11209_2020_dayl.nc’

11209_2020_dayl.nc            100%[=================================================>]  74.16M  3.11MB/s    in 26s

2022-06-08 18:41:57 (2.89 MB/s) - ‘11209_2020_dayl.nc’ saved [77764456/77764456]

--2022-06-08 18:41:57--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2021/11207_2021/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2157873 (2.1M) [application/x-netcdf]
Saving to: ‘11207_2021_dayl.nc’

11207_2021_dayl.nc            100%[=================================================>]   2.06M  2.40MB/s    in 0.9s

2022-06-08 18:42:06 (2.40 MB/s) - ‘11207_2021_dayl.nc’ saved [2157873/2157873]

--2022-06-08 18:42:06--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2021/11208_2021/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2280920 (2.2M) [application/x-netcdf]
Saving to: ‘11208_2021_dayl.nc’

11208_2021_dayl.nc            100%[=================================================>]   2.17M  2.59MB/s    in 0.8s

2022-06-08 18:42:15 (2.59 MB/s) - ‘11208_2021_dayl.nc’ saved [2280920/2280920]

--2022-06-08 18:42:15--  https://thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1840/tiles/2021/11209_2021/dayl.nc
Resolving thredds.daac.ornl.gov (thredds.daac.ornl.gov)... 160.91.19.90
Connecting to thredds.daac.ornl.gov (thredds.daac.ornl.gov)|160.91.19.90|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2414819 (2.3M) [application/x-netcdf]
Saving to: ‘11209_2021_dayl.nc’

11209_2021_dayl.nc            100%[=================================================>]   2.30M  1.59MB/s    in 1.5s

2022-06-08 18:42:25 (1.59 MB/s) - ‘11209_2021_dayl.nc’ saved [2414819/2414819]

$ ls *.nc
11207_2020_dayl.nc  11207_2021_dayl.nc  11208_2020_dayl.nc  11208_2021_dayl.nc  11209_2020_dayl.nc  11209_2021_dayl.nc
```
