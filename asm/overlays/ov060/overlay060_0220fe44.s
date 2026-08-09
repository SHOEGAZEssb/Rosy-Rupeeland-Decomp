.text
.extern TouchRegion_EndPress
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_0220fe44
func_ov060_0220fe44:
    ldr ip, .L_0220fe4c
    bx ip
.L_0220fe4c: .word TouchRegion_EndPress
.size func_ov060_0220fe44, . - func_ov060_0220fe44
