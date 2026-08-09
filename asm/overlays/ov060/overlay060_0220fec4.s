.text
.extern TouchRegion_Tick
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_0220fec4
func_ov060_0220fec4:
    ldr ip, .L_0220fecc
    bx ip
.L_0220fecc: .word TouchRegion_Tick
.size func_ov060_0220fec4, . - func_ov060_0220fec4
