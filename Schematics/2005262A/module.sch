EESchema Schematic File Version 4
LIBS:module-cache
EELAYER 29 0
EELAYER END
$Descr E 44000 34000
encoding utf-8
Sheet 1 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 17375 14775 3275 4875
U 5B86CFFC
F0 "1" 140
F1 "2005262A-p1of2.sch" 140
F2 "FAP" U R 20650 16500 140
F3 "0VDCA" U R 20650 17925 140
F4 "+4SW" U R 20650 17225 140
$EndSheet
$Sheet
S 24450 14750 3300 4925
U 5B86D026
F0 "2" 140
F1 "2005262A-p2of2.sch" 140
F2 "FAP" U L 24450 16500 140
F3 "+4SW" U L 24450 17225 140
F4 "0VDCA" U L 24450 17925 140
$EndSheet
Wire Wire Line
	20650 17925 22475 17925
Wire Wire Line
	24450 17225 22475 17225
Wire Wire Line
	20650 16500 22475 16500
$Comp
L AGC_DSKY:PWR_FLAG #FLG01
U 1 1 5B872C9E
P 22475 16500
F 0 "#FLG01" H 22475 17025 50  0001 C CNN
F 1 "PWR_FLAG" H 22485 16960 50  0001 C CNN
F 2 "" H 22475 16500 50  0001 C CNN
F 3 "~" H 22475 16500 50  0001 C CNN
	1    22475 16500
	1    0    0    -1  
$EndComp
Connection ~ 22475 16500
Wire Wire Line
	22475 16500 24450 16500
$Comp
L AGC_DSKY:PWR_FLAG #FLG02
U 1 1 5B872CC2
P 22475 17225
F 0 "#FLG02" H 22475 17750 50  0001 C CNN
F 1 "PWR_FLAG" H 22485 17685 50  0001 C CNN
F 2 "" H 22475 17225 50  0001 C CNN
F 3 "~" H 22475 17225 50  0001 C CNN
	1    22475 17225
	1    0    0    -1  
$EndComp
Connection ~ 22475 17225
Wire Wire Line
	22475 17225 20650 17225
$Comp
L AGC_DSKY:PWR_FLAG #FLG03
U 1 1 5B872CE6
P 22475 17925
F 0 "#FLG03" H 22475 18450 50  0001 C CNN
F 1 "PWR_FLAG" H 22485 18385 50  0001 C CNN
F 2 "" H 22475 17925 50  0001 C CNN
F 3 "~" H 22475 17925 50  0001 C CNN
	1    22475 17925
	1    0    0    -1  
$EndComp
Connection ~ 22475 17925
Wire Wire Line
	22475 17925 24450 17925
Wire Notes Line width 6 style solid
	36461 982  36461 1300
Wire Notes Line width 6 style solid
	36464 1300 43500 1300
Wire Notes Line width 6 style solid
	42480 984  42480 1300
Wire Notes Line width 6 style solid
	41831 984  41831 1300
Wire Notes Line width 6 style solid
	41331 984  41331 1300
Wire Notes Line width 6 style solid
	40831 984  40831 1298
Wire Notes Line width 6 style solid
	36839 984  36839 1300
Wire Notes Line width 6 style solid
	37350 983  37350 1300
Text Notes 36560 1274 0    160  ~ 32
A
Text Notes 37382 1274 0    160  ~ 32
REVISED PER TDRR 30754
Text Notes 38892 31752 0    250  ~ 50
LOGIC FLOW DIAGRAM
Text Notes 40852 33152 0    250  ~ 50
2005262
Text Notes 38252 33168 0    250  ~ 50
80230
Text Notes 39644 32072 0    200  ~ 40
MODULE NO.A4
Text Notes 38476 32384 0    180  ~ 36
STAGE BRANCH DECODING MODULE
Text Notes 38748 33464 0    140  ~ 28
NONE
$EndSCHEMATC
