    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_list.c. */
    .extern data_ov021_02202ed8
    .extern data_ov021_02202ee0
    .extern data_ov021_02202ee8
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_StopPackedEffect
    .extern InventoryScroll_SaveOrigins
    .extern InventoryScroll_UpdateInterpolation
    .extern InventoryScroll_BeginMarkerDrag
    .extern InventoryScroll_UpdateMarkerDrag
    .extern InventoryScroll_EndMarkerDrag
    .extern Overlay000_Grid_UpdateTransition
    .extern func_ov000_021fc560
    .extern Overlay001_Grid_UpdateTransition
    .extern func_ov001_021fc348
    .extern Overlay021_List_UpdateVisibleRows
    .extern Overlay021_SetTransition
    .extern Overlay021_ShowListMarker
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_UpdatePrompt
    .extern Overlay021_RefreshPrimarySelectionDisplay
    .extern Overlay021_RefreshSecondarySelectionDisplay

.global func_ov021_022000f0
func_ov021_022000f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x354]
    cmp r0, #0x0
    ldrne r4, [r0, #0x26c]
    bne L_0220011c
    ldr r0, [r5, #0x358]
    cmp r0, #0x0
    ldrne r4, [r0, #0x1bc]
    ldreq r0, [r5, #0x2c0]
    ldreq r4, [r0, #0x58]
L_0220011c:
    mov r0, r5
    bl Overlay021_Dialog_UpdatePrompt
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    beq L_02200144
    cmp r0, #0x1
    beq L_02200164
    cmp r0, #0x2
    beq L_02200218
    b L_02200344
L_02200144:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_02200164:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_022001b4
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_0220019c
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_0220019c:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200218
L_022001b4:
    ldr r0, [r5, #0x354]
    cmp r0, #0x0
    beq L_022001d8
    bl Overlay000_Grid_UpdateTransition ; func_ov001_021fc460
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    bl Overlay021_RefreshPrimarySelectionDisplay
    b L_02200344
L_022001d8:
    ldr r0, [r5, #0x358]
    cmp r0, #0x0
    beq L_022001fc
    bl Overlay001_Grid_UpdateTransition
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    bl Overlay021_RefreshSecondarySelectionDisplay
    b L_02200344
L_022001fc:
    ldr r0, [r5, #0x2c0]
    bl Overlay021_List_UpdateVisibleRows
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    bl Overlay021_ShowListMarker
    b L_02200344
L_02200218:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_022002e8
    ldr r0, [r5, #0x354]
    cmp r0, #0x0
    beq L_02200268
    add r1, r5, #0x30
    bl func_ov000_021fc560
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200344
L_02200268:
    ldr r0, [r5, #0x358]
    cmp r0, #0x0
    beq L_022002a8
    add r1, r5, #0x30
    bl func_ov001_021fc348
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200344
L_022002a8:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_02200344
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02200344
L_022002e8:
    mov r0, r4
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r0, [r5, #0x354]
    cmp r0, #0x0
    beq L_02200314
    ldr r1, L_02200354
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200344
L_02200314:
    ldr r0, [r5, #0x358]
    cmp r0, #0x0
    beq L_02200334
    ldr r1, L_02200358
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200344
L_02200334:
    ldr r1, L_0220035c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_02200344:
    mov r0, r5
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02200354: .word data_ov021_02202ee8
L_02200358: .word data_ov021_02202ee0
L_0220035c: .word data_ov021_02202ed8
    .size func_ov021_022000f0, . - func_ov021_022000f0

