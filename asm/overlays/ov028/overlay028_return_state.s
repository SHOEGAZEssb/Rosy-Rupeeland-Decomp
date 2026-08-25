.text

/* Exact fallback; see src/overlays/ov028/overlay028_return_state.c. */
.extern data_ov028_021ff240
.extern SceneSound_PlayPackedEffect
.extern SceneSound_StopPackedEffect
.extern InventoryScroll_SaveOrigins
.extern InventoryScroll_UpdateInterpolation
.extern InventoryScroll_BeginMarkerDrag
.extern InventoryScroll_UpdateMarkerDrag
.extern InventoryScroll_EndMarkerDrag
.extern func_ov028_021fd5e0
.extern func_ov028_021fdad8
.extern func_ov028_021fe438
.extern func_ov028_021fe6bc


    .global func_ov028_021fea98
func_ov028_021fea98:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x220]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x0
    beq L_021feac8
    cmp r0, #0x1
    beq L_021feae8
    cmp r0, #0x2
    beq L_021feb54
    b L_021febbc
L_021feac8:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021feae8:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021feb38
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021feb20
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_021feb20:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021feb54
L_021feb38:
    ldr r0, [r5, #0x220]
    bl func_ov028_021fd5e0
    cmp r0, #0x0
    beq L_021febbc
    mov r0, r5
    bl func_ov028_021fe6bc
    b L_021febbc
L_021feb54:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_021feba4
    bl InventoryScroll_SaveOrigins
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_021febbc
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021febbc
L_021feba4:
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r1, L_021febcc
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
L_021febbc:
    mov r0, r5
    bl func_ov028_021fe438
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021febcc: .word data_ov028_021ff240
.size func_ov028_021fea98, .-func_ov028_021fea98
