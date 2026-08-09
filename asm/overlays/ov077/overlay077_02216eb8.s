.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216eb8
func_ov077_02216eb8:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1bc]
    blx r2
    ldmia sp!, {r3, pc}
.size func_ov077_02216eb8, . - func_ov077_02216eb8
