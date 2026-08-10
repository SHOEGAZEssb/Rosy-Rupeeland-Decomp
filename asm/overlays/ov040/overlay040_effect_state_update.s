.text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_ov040_021ff514
    .extern func_ov040_02202214

    .global func_ov040_02200eb8
func_ov040_02200eb8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r1, #0x4
    mov r5, #0xa000
    mov r6, #0x100
    mov r10, r0
    sub r9, r1, #0x1
    rsb r5, r5, #0x0
    mov r11, #0x1
    mov r4, r6
    mov r7, #0x0
.L_02200ee0:
    add r2, r10, r9, lsl #0x2
    ldr r0, [r2, #0xaf8]
    cmp r0, #0x0
    ble .L_02200fa8
    add r1, r0, #0x1
    str r1, [r2, #0xaf8]
    cmp r1, #0x2d
    ble .L_02200f18
    str r7, [r2, #0xaf8]
    ldr r1, [r2, #0xae8]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02200fa8
.L_02200f18:
    cmp r1, #0x12
    blt .L_02200fa8
    add r0, r9, r9, lsl #0x2
    rsb r0, r0, #0x16
    mul r8, r0, r0
    cmp r8, #0x100
    sub r0, r1, #0x12
    movlt r8, r6
    cmp r0, #0x0
    bne .L_02200f78
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0xae8]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r10, #0xbd4]
    cmp r0, #0x0
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xae8]
    movne r1, r11
    moveq r1, #0x0
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02200f78:
    add r2, r10, r9, lsl #0x2
    ldr r0, [r10, #0xbd4]
    ldr r1, [r2, #0xae8]
    cmp r0, #0x0
    moveq r3, #0xa000
    ldr r0, [r1, #0x30]
    movne r3, r5
    add r0, r0, r3
    str r0, [r1, #0x30]
    ldr r0, [r2, #0xae8]
    strh r4, [r0, #0x3c]
    strh r8, [r0, #0x3e]
.L_02200fa8:
    subs r9, r9, #0x1
    bpl .L_02200ee0
    ldr r0, [r10, #0xb08]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r10, #0xb94]
    cmp r0, #0x0
    ldreq r3, [r10, #0xb88]
    cmpeq r3, #0x0
    ldreq r0, [r10, #0xb9c]
    cmpeq r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r2, [r10, #0xb7c]
    mov r1, #0x0
    cmp r2, #0x3
    bne .L_02200ff8
    ldr r0, [r10, #0xb44]
    ldr r0, [r0, #0x34]
    cmp r0, #0x8c000
    movgt r1, #0x1
.L_02200ff8:
    cmp r2, #0x0
    beq .L_0220100c
    ldr r0, [r10, #0xb84]
    cmp r0, #0x8
    beq .L_02201010
.L_0220100c:
    mov r1, #0x1
.L_02201010:
    cmp r1, #0x0
    beq .L_02201030
    ldr r1, [r10, #0xb28]
    mov r0, r10
    sub r1, r1, #0x17
    str r1, [r10, #0xb28]
    bl func_ov040_021ff514
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02201030:
    cmp r3, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r2, #0x11
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r1, #0x1
    mov r0, r10
    str r1, [r10, #0xb88]
    mov r2, #0x0
    mov r1, #0x3
    str r2, [r10, #0xb8c]
    bl func_ov040_02202214
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov040_02200eb8, .-func_ov040_02200eb8

