.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_020050a4
.extern func_ov081_0221367c

.global func_ov081_02213b7c
func_ov081_02213b7c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    cmp r0, #0x0
    bne .L_02213bb0
    add r0, r4, #0x78
    add r1, r4, #0x214
    bl func_020050a4
    mov r0, #0x0
    str r0, [r4, #0x210]
.L_02213bb0:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_02213be0
    mov r0, r4
    bl func_ov081_0221367c
.L_02213be0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov081_02213b7c, . - func_ov081_02213b7c
