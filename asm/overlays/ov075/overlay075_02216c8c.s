.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02216c8c
func_ov075_02216c8c:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1bc]
    blx r2
    ldmia sp!, {r3, pc}
.size func_ov075_02216c8c, . - func_ov075_02216c8c
