; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text
.extern VecFx32Triple_Destroy
.extern GraphicsSpriteGroup_ReleaseState

.global RisingSpriteMotionController_Destroy
    .type RisingSpriteMotionController_Destroy, @function
RisingSpriteMotionController_Destroy: ; 0x02020558
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    ldr r1, [r4, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x1c
    bl VecFx32Triple_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size RisingSpriteMotionController_Destroy, .-RisingSpriteMotionController_Destroy
