; RailCore Mini Duet3 Mini 5+ Configuration
; resume.g

G1 R1 Z2 F5000	; move to 2mm above resume point
G1 R1			      ; lower nozzle to resume point
M83				      ; relative extruder moves
