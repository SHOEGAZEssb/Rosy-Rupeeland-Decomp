    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_runtime.c. */
    .extern func_02075598
    .extern func_02076148
    .extern GraphicsSpriteCanvas_FillRect

.global func_ov021_021fd39c
func_ov021_021fd39c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r10, r0
    str r1, [sp, #0x4]
    ldr r0, [r10, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x54]
    cmp r0, #0x0
    beq L_021fd488
    ldr r0, [r10, #0x60]
    cmp r0, #0x0
    ldr r0, [r10, #0x0]
    bne L_021fd3f4
    ldr r1, [r10, #0x28]
    mvn r8, #0x1
    bl func_02075598
    b L_021fd400
L_021fd3f4:
    ldr r1, [r10, #0x2c]
    mov r8, #0x0
    bl func_02075598
L_021fd400:
    mov r9, #0x0
    mov r7, #0xe
    mov r11, #0x1
    mov r6, #0x8
    mov r5, #0xc
    mov r4, #0x18
    b L_021fd480
L_021fd41c:
    ldr r1, [r10, #0x58]
    ldr r0, [r10, #0x54]
    ldr r1, [r1, #0xc]
    add r1, r9, r1
    cmp r1, r0
    bge L_021fd488
    mul r0, r1, r5
    ldr r1, [r10, #0x4c]
    mov r3, r7
    ldr r1, [r1, r0]
    mul r2, r9, r4
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    moveq r0, r11
    movne r0, #0x0
    cmp r0, #0x0
    movne r3, #0x3
    stmia sp, {r3, r6, r8}
    ldr r1, [r1, #0x4]
    add r3, r2, #0x13
    ldr r0, [r10, #0x0]
    add r1, r1, #0x2c
    mov r2, #0x40
    bl func_02076148
    add r9, r9, #0x1
L_021fd480:
    cmp r9, #0x4
    blt L_021fd41c
L_021fd488:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov021_021fd39c, . - func_ov021_021fd39c

