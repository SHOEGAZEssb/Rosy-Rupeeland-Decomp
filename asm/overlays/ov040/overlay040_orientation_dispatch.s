    .text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
.global func_ov040_02202a50
func_ov040_02202a50: ; 0x02202a50
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x50]
    cmp r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r2, [r4, #0x70]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_02202a98
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202a90
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02202a90:
    mvn r0, #0x0
    str r0, [r4, #0x70]
.L_02202a98:
    ldr r2, [r4, #0x74]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_02202acc
    ldr r0, [r4, #0x5c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202ac4
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02202ac4:
    mvn r0, #0x0
    str r0, [r4, #0x74]
.L_02202acc:
    ldr r2, [r4, #0x78]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_02202b00
    ldr r0, [r4, #0x60]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202af8
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02202af8:
    mvn r0, #0x0
    str r0, [r4, #0x78]
.L_02202b00:
    ldr r2, [r4, #0x7c]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_02202b5c
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202b54
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x5a
    str r0, [r4, #0x80]
    ldr r0, [r4, #0x7c]
    cmp r0, #0xb
    moveq r0, #0x1
    streq r0, [r4, #0x84]
    beq .L_02202b54
    cmp r0, #0x9
    moveq r0, #0x2
    streq r0, [r4, #0x84]
.L_02202b54:
    mvn r0, #0x0
    str r0, [r4, #0x7c]
.L_02202b5c:
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    ble .L_02202c28
    sub r0, r0, #0x1
    str r0, [r4, #0x80]
    cmp r0, #0x0
    bgt .L_02202c28
    ldr r0, [r4, #0x6c]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x6
    bne .L_02202ba0
    mov r1, #0xc
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3c
    str r0, [r4, #0x80]
    b .L_02202c28
.L_02202ba0:
    cmp r1, #0x7
    bne .L_02202bbc
    mov r1, #0x8
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3c
    str r0, [r4, #0x80]
    b .L_02202c28
.L_02202bbc:
    cmp r1, #0x8
    bne .L_02202bd8
    mov r1, #0x7
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3c
    str r0, [r4, #0x80]
    b .L_02202c28
.L_02202bd8:
    cmp r1, #0x9
    bne .L_02202bf4
    mov r1, #0xa
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3c
    str r0, [r4, #0x80]
    b .L_02202c28
.L_02202bf4:
    cmp r1, #0xa
    bne .L_02202c10
    mov r1, #0x9
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3c
    str r0, [r4, #0x80]
    b .L_02202c28
.L_02202c10:
    mov r1, #0x6
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r4, #0x84]
    mov r0, #0xa0
    str r0, [r4, #0x80]
.L_02202c28:
    ldr r2, [r4, #0x84]
    mvn r0, #0x0
    cmp r2, r0
    ble .L_02202c74
    ldr r0, [r4, #0x64]
    ldr r0, [r0, #0xc]
    ldrb r1, [r0, #0x38]
    cmp r2, r1
    beq .L_02202c6c
    and r1, r2, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x68]
    ldr r1, [r4, #0x84]
    ldr r0, [r0, #0xc]
    add r1, r1, #0x3
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_02202c6c:
    mvn r0, #0x0
    str r0, [r4, #0x84]
.L_02202c74:
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    sub r0, r0, #0x1
    str r0, [r4, #0x88]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [r4, #0x64]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x68]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldmia sp!, {r4, pc}
    .size func_ov040_02202a50, . - func_ov040_02202a50

