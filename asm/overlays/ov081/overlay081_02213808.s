.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_02213808
func_ov081_02213808:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0xd4]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0x8
    movge r0, #0x2
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov081_02213808, . - func_ov081_02213808
