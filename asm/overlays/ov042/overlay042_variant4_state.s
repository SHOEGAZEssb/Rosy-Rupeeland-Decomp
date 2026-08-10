.text
.extern func_ov042_021fda0c
.extern func_020befec
.extern GraphicsSpriteState_SetAnimationIndex
.global func_ov042_02209af4
func_ov042_02209af4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x28
    mov r4, r1
    mov r7, #0xf0
    add r6, sp, #0x8
    mov r5, r0
    mvn r8, #0x7b
    add ip, sp, #0x10
    mov lr, #0x7c
    add r0, sp, #0x18
    mov r3, #0x6e
    add r9, sp, #0x20
    mov r1, #0x0
    str r1, [r9, #0x0]
    mov r1, #0x9b
    str r1, [r9, #0x4]
    mov r1, r2
    str r8, [sp, #0x0]
    str r7, [sp, #0x4]
    str lr, [r6, #0x0]
    str r7, [r6, #0x4]
    str r8, [ip, #0x0]
    str r3, [ip, #0x4]
    str lr, [r0, #0x0]
    str r3, [r0, #0x4]
    add r0, r5, #0x50
    strb r4, [r5, #0x8a]
    bl func_ov042_021fda0c
    mov r0, #0x0
    strh r0, [r5, #0x88]
    ldrb r0, [r5, #0x8a]
    mov r1, #0x3
    bl func_020befec
    ldr r0, [r5, #0x4c]
    mov r1, r1, lsl #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x4c]
    mov r0, #0x100
    ldr r2, [r1, #0xc]
    cmp r4, #0x4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldr r1, [r5, #0x4c]
    strh r0, [r1, #0x3c]
    strh r0, [r1, #0x3e]
    blt .L_02209bc0
    cmp r4, #0x7
    bne .L_02209c2c
.L_02209bc0:
    mov r1, r4, lsr #0x1f
    rsb r0, r1, r4, lsl #0x1f
    mov r2, #0x1
    adds r0, r1, r0, ror #0x1f
    str r2, [r5, #0x74]
    ldr r0, [r5, #0x54]
    add r1, sp, #0x0
    addne r0, r0, #0x40000
    subeq r0, r0, #0x40000
    str r0, [r5, #0x54]
    ldr r0, [r5, #0x58]
    cmp r4, #0x7
    sub r0, r0, #0x17000
    str r0, [r5, #0x58]
    moveq r4, #0x4
    ldr r2, [r1, r4, lsl #0x3]
    add r0, sp, #0x4
    mov r2, r2, lsl #0xc
    str r2, [r5, #0x60]
    ldr r2, [r0, r4, lsl #0x3]
    mov r1, #0x0
    mov r2, r2, lsl #0xc
    str r2, [r5, #0x64]
    mov r0, #0x2000
    str r1, [r5, #0x6c]
    str r0, [r5, #0x70]
    b .L_02209ca4
.L_02209c2c:
    cmp r4, #0x4
    cmpne r4, #0x6
    bne .L_02209c70
    mov r0, #0x5
    str r0, [r5, #0x74]
    ldr r1, [r5, #0x54]
    mov r0, #0x2000
    sub r1, r1, #0x40000
    str r1, [r5, #0x54]
    ldr r1, [r5, #0x58]
    rsb r0, r0, #0x0
    sub r1, r1, #0x17000
    str r1, [r5, #0x58]
    str r0, [r5, #0x6c]
    mov r0, #0x2000
    str r0, [r5, #0x70]
    b .L_02209ca4
.L_02209c70:
    cmp r4, #0x5
    bne .L_02209ca4
    mov r0, #0x5
    str r0, [r5, #0x74]
    ldr r1, [r5, #0x54]
    mov r0, #0x2000
    add r1, r1, #0x40000
    str r1, [r5, #0x54]
    ldr r1, [r5, #0x58]
    sub r1, r1, #0x17000
    str r1, [r5, #0x58]
    str r0, [r5, #0x6c]
    str r0, [r5, #0x70]
.L_02209ca4:
    mov r0, #0xa
    str r0, [r5, #0x7c]
    mov r0, #0x0
    str r0, [r5, #0x80]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov042_02209af4, . - func_ov042_02209af4
