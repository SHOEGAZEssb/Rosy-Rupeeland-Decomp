    .text
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .global Overlay004_UpdateContext
Overlay004_UpdateContext: ; 0x021fbf10
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x8c]
    ldr r1, [r4, #0x60]
    ldr r0, [r4, #0x7c]
    str r0, [r1, #0x18]
    str r2, [r1, #0x1c]
    ldr r0, [r4, #0x60]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x64]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
    .size Overlay004_UpdateContext, .-Overlay004_UpdateContext
