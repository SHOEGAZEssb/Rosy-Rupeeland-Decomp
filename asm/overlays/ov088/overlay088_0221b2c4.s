.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02033f7c

.global func_ov088_0221b2c4
func_ov088_0221b2c4:
    stmdb sp!, {r3, lr}
    add r3, r0, #0x200
    ldrsh r3, [r3, #0x30]
    cmp r3, #0x1
    ldmneia sp!, {r3, pc}
    bl func_02033f7c
    ldmia sp!, {r3, pc}
.size func_ov088_0221b2c4, . - func_ov088_0221b2c4
