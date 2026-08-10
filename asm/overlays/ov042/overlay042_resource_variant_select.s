.text
.extern func_0209a07c
.extern func_0209a0d8
.extern GraphicsSpriteState_SetAnimationIndex
.global func_ov042_02206ff8
func_ov042_02206ff8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r1
    mvn r1, #0x0
    mov r4, r0
    cmp r5, r1
    bne .L_02207078
    ldr r0, [r4, #0x50]
    bl func_0209a07c
    ldr r0, [r4, #0x48]
    mov r2, #0x1300
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    stmia sp, {r0, r1}
    ldr r0, [r4, #0x50]
    rsb r1, r1, #0x1300
    add r3, r2, #0x1
    bl func_0209a0d8
    ldr r0, [r4, #0x50]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x50]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x50]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b .L_02207108
.L_02207078:
    ldr r0, [r4, #0x4c]
    bl func_0209a07c
    cmp r5, #0x2
    bne .L_022070b4
    ldr r0, [r4, #0x48]
    ldr r1, .L_02207110
    ldr r2, [r0, #0x0]
    mov r0, #0x2
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4c]
    add r2, r1, #0x4
    add r3, r1, #0x2
    bl func_0209a0d8
    b .L_022070e4
.L_022070b4:
    cmp r5, #0x1
    bne .L_022070e4
    ldr r0, [r4, #0x48]
    ldr r1, .L_02207110
    ldr r2, [r0, #0x0]
    mov r0, #0x2
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4c]
    add r2, r1, #0x3
    add r3, r1, #0x2
    bl func_0209a0d8
.L_022070e4:
    ldr r0, [r4, #0x4c]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02207108:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02207110: .word 0x12fa
.size func_ov042_02206ff8, . - func_ov042_02206ff8
