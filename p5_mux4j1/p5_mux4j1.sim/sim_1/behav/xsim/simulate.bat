@echo off
REM ****************************************************************************
REM Vivado (TM) v2022.2.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun Mar 17 16:40:25 +0100 2024
REM SW Build 3788238 on Tue Feb 21 20:00:34 MST 2023
REM
REM IP Build 3783773 on Tue Feb 21 23:41:56 MST 2023
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_behav -key {Behavioral:sim_1:Functional:tb} -tclbatch tb.tcl -log simulate.log"
call xsim  tb_behav -key {Behavioral:sim_1:Functional:tb} -tclbatch tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
