    .text
    .extern func_02091c7c
    .extern func_02091cf0
    .extern GraphicsSpriteState_SetAnimationIndex
    .global func_ov002_021fbe08
func_ov002_021fbe08: ; 0x021fbe08
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x98
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    str r1, [r2, #0x18]
    str r0, [r2, #0x1c]
    add r0, r4, #0x98
    bl func_02091cf0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x7c]
    mov r1, #0x1f
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x80]
    mov r1, #0x20
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x1
    ldmia sp!, {r4, pc}
    .size func_ov002_021fbe08, .-func_ov002_021fbe08
