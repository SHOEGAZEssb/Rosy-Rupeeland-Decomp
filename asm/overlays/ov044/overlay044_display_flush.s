.text
.extern SpriteMotionController_Update
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern InventoryScroll_UpdatePresentation
.extern func_ov001_021fbaa8

    .global func_ov044_0220c880
func_ov044_0220c880:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xd0
    bl SpriteMotionController_Update
    add r0, r5, #0x17c
    bl SpriteMotionController_Update
    ldr r0, [r5, #0xbc]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r4, [r5, #0x228]
    cmp r4, #0x0
    beq .L_0220c8bc
    ldr r0, [r4, #0x44]
    bl InventoryScroll_UpdatePresentation
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
.L_0220c8bc:
    ldr r0, [r5, #0x22c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov001_021fbaa8
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov044_0220c880, . - func_ov044_0220c880
