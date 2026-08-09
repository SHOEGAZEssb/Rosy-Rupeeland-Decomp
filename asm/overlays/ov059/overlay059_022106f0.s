.text
.extern TouchRegion_Tick
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022106f0
func_ov059_022106f0:
    ldr ip, .L_022106f8
    bx ip
.L_022106f8: .word TouchRegion_Tick
.size func_ov059_022106f0, . - func_ov059_022106f0
