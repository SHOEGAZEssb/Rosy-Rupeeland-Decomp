; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern DualScreenUiPresentationBase_SetEmbeddedEnabled
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

    .global DualScreenUiGridState_Destroy
    .type DualScreenUiGridState_Destroy, @function
DualScreenUiGridState_Destroy: ; 0x02026514
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r1, #0x0
    bl DualScreenUiPresentationBase_SetEmbeddedEnabled
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_02026578
    bl GraphicsSpriteGroup_Clear
    mov r4, #0x0
.L_02026538:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_02026554
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02026554:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_02026538
    ldr r0, .L_02026584
    ldr r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    mov r0, #0x0
    str r0, [r5, #0x0]
.L_02026578:
    mvn r0, #0x0
    strh r0, [r5, #0x74]
    ldmia sp!, {r3, r4, r5, pc}
.L_02026584: .word gDebugFont
    .size DualScreenUiGridState_Destroy, . - DualScreenUiGridState_Destroy
