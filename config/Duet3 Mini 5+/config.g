; RailCore Mini Duet3 Mini 5+ Configuration
; config.g

G21						;Work in millimetres
G90						;Send absolute coordinates...
M83						;...but relative extruder moves

M550 P"RailCoreMini"

;Wifi Networking
M552 S1								; Enable WiFi

M575 P1 S1 B57600

;Axis and motor configuration
M569 P0 S0 D3					;Drive 0 Extruder
M569 P1 S1 D3					;Drive1 Unused
M569 P2 S0 D3					;Drive 2 Z Front Right
M569 P3 S0 D3					;Drive 3 Z Rear Right
M569 P4 S0 D3					;Drive 4 Z Left
M569 P5 S1 D3					;Drive 5 Y / Front
M569 P6 S0 D3					;Drive 6 X / Rear
M667 S1						    ;corexy mode

M584 X6 Y5 Z4:3:2 E0	;Map X to drive 6 Y to drive 5 Z to drives 2, 3, 4, and E to drive 0

;Leadscrew locations
M671 X-5:165:165  Y90:155:22.5 S7.5		;X -10, -10, 315

M350 X16 Y16 Z16 E16 I1				      ;Set 16x microstepping for axes with interpolation
M906 X1400 Y1400 Z1200 E800 I80			;Set motor currents (mA)
M201 X2000 Y2000 Z150 E1500			    ;Accelerations (mm/s^2)
M204 P1400 T4000
M203 X12000 Y12000 Z900 E3600			  ;Maximum speeds (mm/min) was Z1800 tr8*4
M566 X1000 Y1000 Z150 E1800			    ;Maximum jerk speeds mm/minute E60 Z60
M208 X150 Y150 Z150				          ;Set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z0 S1				            ;Set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X200 Y200 Z1600 E562            ;Steps/mm

; End Stops
M574 X2 S1 P"io2.in"				        ;Map the X endstop to io2.in
M574 Y1 S1 P"io4.in"				        ;Map the Y endstop to io4.in

; Thermistors
M308 S0 P"temp0" Y"thermistor" A"bed_heat" T100000 B4240 H0 L0 		      ;Bed thermistor
M308 S1 P"temp1" Y"thermistor" A"e0_heat" T100000 B4725 C7.06e-8 H0 L0	;E3D Revo thermistor

;Define Heaters
M950 H0 C"out0" T0				;Bed heater is on out0
M950 H1 C"out1" T1				;Hotend heater is on out1

;Define Bed
M140 H0

M570 S360					;Hot end may be a little slow to heat up so allow it 180 seconds
M143 S285					;Set max hotend temperature

; Fans
M950 F1 C"out4"					;Layer fan on "out4" connector
M106 P1 S0 						  ;Layer fan default speed
M950 F2 C"out5"					;Case fans on "out5" connector
M106 P2 S255 					  ;Case fans default speed
M950 F3 C"out6"         ;Hotend fan on "out6" connector
M106 P3 S255 H1 T50 		;Enable thermostatic mode for hotend fan

; Tool definitions
M563 P0 D0 H1 F1        ;Define tool 0
G10 P0 S0 R0            ;Set tool 0 operating and standby temperatures

;BLTouch
M558 P9 C"io3.in" H5 R1 F120 T6000 A5 S0.02 B1	;define the bltouch input on io3.in
M950 S0 C"io3.out"					                    ;define the bltouch servo on io4.out
G31 X2 Y42 Z1.843 P25				                    ;set the offsets for the bltouch

T0 ;select first hot end
