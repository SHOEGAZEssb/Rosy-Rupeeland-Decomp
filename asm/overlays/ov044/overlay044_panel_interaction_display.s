.text
.extern GraphicsSpriteCanvas_FillRect
.extern GraphicsSpriteRenderer_SetFontResource
.extern func_ov044_0220bb48
.extern func_02079f3c
.extern func_02076148
.extern func_020628c8
.extern func_02092960
.extern func_020befec
.extern data_021f3ecc
.extern gSystemState

    .global func_ov044_0220bba4
func_ov044_0220bba4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r10, r0
    str r1, [sp, #0x4]
    ldr r0, [r10, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x40]
    cmp r0, #0x0
    beq .L_0220bd18
    mov r7, #0x0
    mov r11, #0xe
    mov r6, #0x1
    mov r5, #0x4
    mov r4, r7
    b .L_0220bd10
.L_0220bbf4:
    ldr r1, [r10, #0x44]
    ldr r0, [r10, #0x40]
    ldr r1, [r1, #0xc]
    add r8, r7, r1
    cmp r8, r0
    bge .L_0220bd18
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0x14]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [r10, #0x38]
    mov r1, #0x1
    add r0, r0, r8, lsl #0x5
    bl func_ov044_0220bb48
    cmp r0, #0x0
    beq .L_0220bc68
    ldr r0, .L_0220bd20
    mov r1, #0x188
    bl func_02079f3c
    str r6, [sp, #0x0]
    str r5, [sp, #0x4]
    add r8, r7, #0x1
    mov r3, #0x18
    mul r3, r8, r3
    str r4, [sp, #0x8]
    add r1, r0, #0x2
    ldr r0, [r10, #0x0]
    mov r2, #0x44
    bl func_02076148
    b .L_0220bd0c
.L_0220bc68:
    ldr r0, [r10, #0x38]
    add r0, r0, r8, lsl #0x5
    ldr r9, [r0, #0xc]
    mov r0, r9
    bl func_020628c8
    add r8, r7, #0x1
    mov r3, #0x18
    mul r3, r8, r3
    str r11, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r10, #0x0]
    mov r2, #0x44
    bl func_02076148
    mov r0, #0x18
    mul r0, r7, r0
    add r8, r0, #0x20
    ldr r0, .L_0220bd24
    ldr r1, [r10, #0x18]
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    ldr r0, [r10, #0x0]
    subne r8, r8, #0x2
    bl GraphicsSpriteRenderer_SetFontResource
    ldrh r1, [r9, #0x4]
    mov r0, #0xe
    mov r2, #0xa
    cmp r1, #0x63
    movge r0, #0x3
    str r8, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x8
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, [r10, #0x0]
    mov r3, #0xb0
    bl func_02092960
.L_0220bd0c:
    add r7, r7, #0x1
.L_0220bd10:
    cmp r7, #0x5
    blt .L_0220bbf4
.L_0220bd18:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220bd20: .word data_021f3ecc
.L_0220bd24: .word gSystemState
.size func_ov044_0220bba4, . - func_ov044_0220bba4

    .global func_ov044_0220bd28
func_ov044_0220bd28:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x18
    subs r2, r2, #0x40
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0x80
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x78
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x18
    bl func_020befec
    ldr r2, [r4, #0x44]
    cmp r0, #0x5
    ldr r2, [r2, #0xc]
    movge r0, #0x4
    ldr r1, [r4, #0x40]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov044_0220bd28, . - func_ov044_0220bd28

    .global func_ov044_0220bd98
func_ov044_0220bd98:
    ldr r1, [r0, #0x44]
    ldr r2, [r0, #0x38]
    ldr r0, [r1, #0x14]
    add r0, r2, r0, lsl #0x5
    bx lr
.size func_ov044_0220bd98, . - func_ov044_0220bd98
