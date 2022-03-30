; RailCore Mini Duet3 Mini 5+ Configuration
; bed.g

M561                         ; clear any existing bed transform
G1 Z7.5 H2

G30 P0 X10 Y75 Z-99999
G30 P1 X75 Y140 Z-99999
G30 P2 X145 Y75 Z-99999
G30 P3 X75 Y42 Z-99999
G30 P4 X75 Y75 Z-99999 S3
G1 X0 Y0 F5000              ; move head to corner of the bed
