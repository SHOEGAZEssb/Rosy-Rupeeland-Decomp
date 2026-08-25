.text
.extern SceneInputBase_Init
.extern TitleCharacterResourceCollection_Init
.extern AnimationResourceState_InitEmbedded
.extern SpriteMotionController_Init
.extern OverlaySlot_Init
.extern SpriteMotionController_SetPosition
.extern TitleCharacterResourceCollection_Append
.extern func_ov043_0220ba28
.extern func_ov043_0220bc2c
.extern func_ov043_0220b744
.extern data_ov043_0220c4bc
.extern gGameWork
.extern data_ov043_0220c480

    .global func_ov043_0220b76c
func_ov043_0220b76c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, .L_0220b854
    add r0, r4, #0x5c
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x80
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x90
    bl SpriteMotionController_Init
    add r0, r4, #0x13c
    bl SpriteMotionController_Init
    add r0, r4, #0x1e8
    bl SpriteMotionController_Init
    add r0, r4, #0x2dc
    bl OverlaySlot_Init
    add r0, r4, #0x2e8
    bl OverlaySlot_Init
    mov r0, #0x0
    str r0, [r4, #0x2f4]
    str r0, [r4, #0x8c]
    str r0, [r4, #0x58]
    str r0, [r4, #0x298]
    str r0, [r4, #0x294]
    ldr r1, .L_0220b858
    add r0, r4, #0x13c
    ldr r2, [r1, #0x0]
    mov r1, #0x48
    add r2, r2, #0x200
    ldrsh r3, [r2, #0x6]
    mov r2, #0x50
    str r3, [r4, #0x54]
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x1e8
    mov r1, #0xb8
    mov r2, #0x50
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x90
    mov r1, #0xe8
    mov r2, #0xa0
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x5c
    ldr r1, .L_0220b85c
    bl TitleCharacterResourceCollection_Append
    mov r0, r4
    bl func_ov043_0220ba28
    mov r0, r4
    bl func_ov043_0220bc2c
    ldr r1, [r4, #0x20]
    mov r0, r4
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r1, .L_0220b860
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220b854: .word data_ov043_0220c4bc
.L_0220b858: .word gGameWork
.L_0220b85c: .word 0x7005
.L_0220b860: .word data_ov043_0220c480
.size func_ov043_0220b76c, . - func_ov043_0220b76c

