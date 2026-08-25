; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteRenderer_ClearTextBuffer

    .global AreaInfoPanelPresentation_Hide
    .type AreaInfoPanelPresentation_Hide, @function
AreaInfoPanelPresentation_Hide: ; 0x0202836c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x34]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}
    .size AreaInfoPanelPresentation_Hide, . - AreaInfoPanelPresentation_Hide

