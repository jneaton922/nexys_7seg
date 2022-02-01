#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/Data/Xilinx/Vivado/2021.2/ids_lite/ISE/bin/lin64:/Data/Xilinx/Vivado/2021.2/bin
else
  PATH=/Data/Xilinx/Vivado/2021.2/ids_lite/ISE/bin/lin64:/Data/Xilinx/Vivado/2021.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/Data/Hopkins/VHDL/nexys_7seg/project_1/project_1.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log lab1_top.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source lab1_top.tcl
