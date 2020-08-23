#!/bin/bash

if [ "$1" == "build" ]; then
   rm -rf build_dir
   vlog -f list_rtl.vc -work build_dir
   rm -rf wave.wlf
   vsim -c -voptargs=+acc -do "log -r /*; run -all; exit;" -wlf wave.wlf build_dir.Final_tb
elif [ "$1" == "view" ]; then
   vsim -view wave.wlf
fi
