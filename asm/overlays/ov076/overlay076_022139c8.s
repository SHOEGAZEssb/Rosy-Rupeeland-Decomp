.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Actor_SetInteractionFlag2000

.global func_ov076_022139c8
func_ov076_022139c8:
    ldr ip, .L_022139d0
    bx ip
.L_022139d0: .word Actor_SetInteractionFlag2000
.size func_ov076_022139c8, . - func_ov076_022139c8
