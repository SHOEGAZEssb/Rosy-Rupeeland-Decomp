.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_0204cfa4

.global func_ov088_0221b218
func_ov088_0221b218:
    stmdb sp!, {r3, lr}
    mov r2, r0
    add r0, r2, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x4000
    movne r0, #0x6
    ldmneia sp!, {r3, pc}
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x5
    ldmeqia sp!, {r3, pc}
    tst r1, #0x2000
    movne r0, #0x4
    ldmneia sp!, {r3, pc}
    ldr r0, [r2, #0x3c]
    ldr r1, [r2, #0x40]
    bl func_0204cfa4
    cmp r0, #0x1000
    movge r0, #0x3
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov088_0221b218, . - func_ov088_0221b218
