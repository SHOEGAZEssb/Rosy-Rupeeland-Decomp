.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_02212b58
func_ov081_02212b58:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x120]
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov081_02212b58, . - func_ov081_02212b58
