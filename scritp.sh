#!/usr/bin/env bash
mkdir station_nc
mkdir station_txt
lon=(-4.3 -0.13 -2.9166666667 -3.4833333333
 -0.0333333333 0.35 -3.1833333333 -1.5166666667
  -2.4333333333 -1.15)
lat=(11.1666667 12.98 11.73333333
 12.4666667 14.03333333 12.06666667
  10.3333333333 12.35 13.58333333
   11.166667)
name=("BOBO" "BOGANDE" "BOROMO" "DEDOUGOU"
 "DORI" "FADA" "GAOUA" "OUAGADOUGOU"
  "OUAHIGOUYA" "PO")

for i in $(seq 0 9); 
do
  cdo remapnn,"lon=${lon[i]}_lat=${lat[i]}"\
   BF_ETO_day.nc "station_nc/${name[i]}_ETO_day.nc" 
  
  cdo outputtab,lon,lat,date,value\
   "station_nc/${name[i]}_ETO_day.nc"\
    > "station_txt/${name[i]}_ETO_day.txt"
done



