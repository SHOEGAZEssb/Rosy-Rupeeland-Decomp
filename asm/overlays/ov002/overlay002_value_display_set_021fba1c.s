    .text
    .extern func_020befec
    .extern GraphicsSpriteState_SetAnimationIndex
    .global Overlay002_SetDisplayedValue
Overlay002_SetDisplayedValue: ; 0x021fba1c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r10, r0
    ldr r2, [r10, #0x6c]
    mov r9, r1
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r1, [r10, #0x70]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r10, #0x90]
    cmp r0, #0x0
    beq L_021fbb38
    ldr r0, L_021fbb60
    ldr r6, L_021fbb64
    cmp r9, r0
    mov r7, #0x0
    blt L_021fba8c
    ldr r1, [r10, #0x6c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r10, #0x70]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    b L_021fbaa0
L_021fba8c:
    cmp r9, #0x3e8
    ldrge r1, [r10, #0x70]
    ldrgeh r0, [r1, #0x24]
    bicge r0, r0, #0x4
    strgeh r0, [r1, #0x24]
L_021fbaa0:
    mov r8, #0x0
    mov r4, #0x1
    mov r5, #0xa
L_021fbaac:
    mov r0, r9
    mov r1, r6
    bl func_020befec
    mov r9, r1
    mov r0, r6
    mov r1, r5
    bl func_020befec
    mov r6, r0
    mov r0, r9
    mov r1, r6
    bl func_020befec
    cmp r0, #0x0
    cmpeq r7, #0x0
    bne L_021fbaec
    cmp r8, #0x6
    bne L_021fbb14
L_021fbaec:
    add r3, r10, r8, lsl #0x2
    ldr r2, [r3, #0x18]
    and r1, r0, #0xff
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r3, #0x18]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r7, r4
    b L_021fbb28
L_021fbb14:
    add r0, r10, r8, lsl #0x2
    ldr r1, [r0, #0x18]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
L_021fbb28:
    add r8, r8, #0x1
    cmp r8, #0x7
    blt L_021fbaac
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fbb38:
    mov r2, #0x0
L_021fbb3c:
    add r0, r10, r2, lsl #0x2
    ldr r1, [r0, #0x18]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    cmp r2, #0x7
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    blt L_021fbb3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fbb60: .word 0xf4240
L_021fbb64: .word 0x989680
    .size Overlay002_SetDisplayedValue, .-Overlay002_SetDisplayedValue

