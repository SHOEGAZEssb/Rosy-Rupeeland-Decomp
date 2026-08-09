.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218a48
func_ov091_02218a48:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov091_02218a48, . - func_ov091_02218a48
