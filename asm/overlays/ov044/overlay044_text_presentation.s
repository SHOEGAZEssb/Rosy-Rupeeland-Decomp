.text
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteState_ApplyRenderConfig
.extern SpriteMotionController_BindSprite
.extern SpriteMotionController_SetPosition
.extern SpriteMotionController_Hide
.extern GraphicsSpriteGroup_Clear

    .global func_ov044_0220c610
func_ov044_0220c610:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xcc]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xcc]
    mov r2, #0x84
    mov r3, #0x20
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0xd0
    mov r2, #0x9
    mov r3, #0x2
    bl SpriteMotionController_BindSprite
    add r0, r4, #0xd0
    mov r1, #0xe8
    mov r2, #0xaa
    bl SpriteMotionController_SetPosition
    ldr r0, [r4, #0xbc]
    add r1, r4, #0xc0
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x17c
    mov r2, #0x7
    mov r3, #0x2
    bl SpriteMotionController_BindSprite
    add r0, r4, #0x17c
    mov r1, #0x80
    mov r2, #0xaa
    bl SpriteMotionController_SetPosition
    add r0, r4, #0x17c
    bl SpriteMotionController_Hide
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov044_0220c610, . - func_ov044_0220c610

    .global func_ov044_0220c6dc
func_ov044_0220c6dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xbc]
    bl GraphicsSpriteGroup_Clear
    mov r0, #0x0
    str r0, [r4, #0xcc]
    str r0, [r4, #0x218]
    str r0, [r4, #0x16c]
    ldmia sp!, {r4, pc}
.size func_ov044_0220c6dc, . - func_ov044_0220c6dc
