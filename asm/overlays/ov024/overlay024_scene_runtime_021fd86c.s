.text

/* Exact fallback; see src/overlays/ov024/overlay024_scene_runtime.c. */
.extern AreaInfoPanelPresentation_ShowIndex
.extern AreaInfoPanelPresentation_Hide
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_02091b98
.extern func_02091c7c
.extern SpriteMotionController_Update
.extern Overlay005_UpdateScenePopulation
.extern func_ov046_0220c1a4


    .global func_ov024_021fd86c
func_ov024_021fd86c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x80
    bl SpriteMotionController_Update
    add r0, r4, #0x12c
    bl SpriteMotionController_Update
    add r0, r4, #0x1d8
    bl SpriteMotionController_Update
    ldr r0, [r4, #0x2c0]
    bl func_ov046_0220c1a4
    ldr r0, [r4, #0x2bc]
    bl Overlay005_UpdateScenePopulation
    ldr r0, [r4, #0x7c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    add r0, r4, #0x2c8
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r4, #0x2c8
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0x2e4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0x2e4]
    cmp r0, #0x0
    ldr r0, [r4, #0x2c4]
    beq L_021fd8f0
    ldr r1, [r4, #0x290]
    bl AreaInfoPanelPresentation_ShowIndex
    ldmia sp!, {r4, pc}
L_021fd8f0:
    bl AreaInfoPanelPresentation_Hide
    ldmia sp!, {r4, pc}
.size func_ov024_021fd86c, .-func_ov024_021fd86c

