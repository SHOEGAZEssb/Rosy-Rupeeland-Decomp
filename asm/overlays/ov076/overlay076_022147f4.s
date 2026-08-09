.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_022147f4
func_ov076_022147f4:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1bc]
    blx r2
    ldmia sp!, {r3, pc}
.size func_ov076_022147f4, . - func_ov076_022147f4
