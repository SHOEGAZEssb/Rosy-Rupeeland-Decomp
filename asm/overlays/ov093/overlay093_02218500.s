.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_02218500
func_ov093_02218500:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov093_02218500, . - func_ov093_02218500
