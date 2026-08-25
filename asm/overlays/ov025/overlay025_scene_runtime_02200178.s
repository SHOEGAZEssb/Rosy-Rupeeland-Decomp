.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern PresentationList_UpdateAndDeleteCompleted
.extern SpriteMotionController_Update
.extern func_ov094_022196e8


    .global func_ov025_02200178
func_ov025_02200178:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x5c0]
    bl func_ov094_022196e8
    add r0, r7, #0xf8
    add r0, r0, #0x400
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r7, #0xf0
    bl SpriteMotionController_Update
    add r0, r7, #0x19c
    bl SpriteMotionController_Update
    add r0, r7, #0x248
    bl SpriteMotionController_Update
    mov r6, #0x0
    add r5, r7, #0x2f4
    mov r4, #0xac
L_022001b8:
    mla r0, r6, r4, r5
    bl SpriteMotionController_Update
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_022001b8
    ldr r0, [r7, #0xb0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r7, #0xb4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r7, #0x598]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov025_02200178, .-func_ov025_02200178

