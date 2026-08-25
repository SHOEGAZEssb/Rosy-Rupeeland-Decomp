; Matching retail form; see src/game/area_info_panel_presentation.c.
.text
.extern GameWork_TestFlag
.extern data_020c37e4
.extern data_020c3a1c
.extern data_020c3a28
.extern data_020d780c
.extern data_020d7828
.extern data_020d782c
.extern data_020d7a48
.extern data_021f3ecc
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_DrawGlyph
.extern GraphicsSpriteRenderer_DrawText
.extern RetailTextTable_FindRecordById
.extern func_02092960
.extern func_020befec
.extern gGameWork
.extern gSystemState

    .global AreaInfoPanelPresentation_ShowIndex
    .type AreaInfoPanelPresentation_ShowIndex, @function
AreaInfoPanelPresentation_ShowIndex: ; 0x02028100
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x34]
    mov r2, #0x1
    str r2, [r0, #0x20]
    ldr r0, [r5, #0x30]
    mov r4, r1
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r3, [r5, #0x38]
    ldr r0, .L_02028340
    ldrh r2, [r3, #0x24]
    ldrb r1, [r0, r4]
    bic r0, r2, #0x4
    strh r0, [r3, #0x24]
    ldr r0, [r5, #0x38]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x30]
    ldr r1, [r5, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, .L_02028344
    mov r1, r4, lsl #0x1
    ldrb r0, [r0, #0x5f]
    mov r6, #0x9d
    cmp r0, #0x0
    ldr r0, .L_02028348
    subne r6, r6, #0x2
    ldrh r1, [r0, r1]
    ldr r0, .L_0202834c
    bl RetailTextTable_FindRecordById
    mov r1, #0xd
    mov r2, r0
    str r1, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    add r1, r2, #0x2
    ldr r0, [r5, #0x30]
    mov r3, r6
    mov r2, #0x6
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, [r5, #0x30]
    ldr r1, [r5, #0x4]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0x34
    mul r6, r4, r0
    ldr r1, .L_02028350
    ldr r0, .L_0202834c
    ldrh r1, [r1, r6]
    bl RetailTextTable_FindRecordById
    add r1, r0, #0x2
    mov r0, #0xd
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    sub r0, r0, #0x7
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x30]
    mov r2, #0x5
    mov r3, #0xa7
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, .L_02028354
    ldr r1, .L_02028358
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02028338
    ldr r1, .L_0202835c
    ldr r0, .L_02028354
    ldrh r1, [r1, r6]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02028338
    ldr r1, .L_02028360
    ldr r0, .L_02028354
    ldrh r1, [r1, r6]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02028268
    mov r0, #0xd
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x30]
    mov r1, #0xd3
    mov r2, #0xee
    mov r3, #0xac
    bl GraphicsSpriteRenderer_DrawGlyph
    b .L_02028338
.L_02028268:
    ldr r3, .L_02028354
    mov r1, #0x0
    ldr r6, .L_02028364
    mov r2, r1
    mov r0, r1
    ldr r3, [r3, #0x0]
    ldr r6, [r6, #0x0]
    ldr r7, .L_02028368
    mov lr, #0x24
    b .L_020282c8
.L_02028290:
    mul ip, r0, lr
    ldrsh ip, [r7, ip]
    cmp r4, ip
    bne .L_020282c4
    cmp r0, #0x0
    add r1, r1, #0x1
    beq .L_020282c0
    add ip, r3, r0
    add ip, ip, #0x5000
    ldrb ip, [ip, #0xe94]
    cmp ip, #0x0
    beq .L_020282c4
.L_020282c0:
    add r2, r2, #0x1
.L_020282c4:
    add r0, r0, #0x1
.L_020282c8:
    cmp r0, r6
    blt .L_02028290
    mov r0, #0x64
    mul r0, r2, r0
    bl func_020befec
    mov r1, r0
    cmp r1, #0x0
    ble .L_02028338
    mov r0, #0xac
    str r0, [sp, #0x0]
    mov r0, #0xd
    str r0, [sp, #0x4]
    mov r0, #0xc
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x30]
    mov r2, #0x64
    mov r3, #0xca
    bl func_02092960
    mov r1, #0xd
    mov r2, r0
    str r1, [sp, #0x0]
    ldr r0, [r5, #0x30]
    add r2, r2, #0xca
    mov r1, #0x5
    mov r3, #0xac
    bl GraphicsSpriteRenderer_DrawGlyph
.L_02028338:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02028340: .word data_020c3a1c
.L_02028344: .word gSystemState
.L_02028348: .word data_020c3a28
.L_0202834c: .word data_021f3ecc
.L_02028350: .word data_020d780c
.L_02028354: .word gGameWork
.L_02028358: .word 0x765
.L_0202835c: .word data_020d782c
.L_02028360: .word data_020d7828
.L_02028364: .word data_020c37e4
.L_02028368: .word data_020d7a48
    .size AreaInfoPanelPresentation_ShowIndex, . - AreaInfoPanelPresentation_ShowIndex

