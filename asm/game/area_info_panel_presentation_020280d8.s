; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern func_020927b8

    .global AreaInfoPanelPresentation_Destroy
    .type AreaInfoPanelPresentation_Destroy, @function
AreaInfoPanelPresentation_Destroy: ; 0x020280d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x34]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x24
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size AreaInfoPanelPresentation_Destroy, . - AreaInfoPanelPresentation_Destroy

