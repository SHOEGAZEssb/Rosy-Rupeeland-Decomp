.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216ecc
func_ov077_02216ecc:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x154]
    blx r2
    ldmia sp!, {r3, pc}
.size func_ov077_02216ecc, . - func_ov077_02216ecc
