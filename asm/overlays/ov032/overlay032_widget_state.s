.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_state.c for documented portable C. */
.extern Sound_Play
.extern data_021f6288
.extern Sound_StopEffect
.extern InventoryScroll_SetSelectedRow
.extern InventoryScroll_SaveOrigins
.extern InventoryScroll_MoveSelectionUp
.extern InventoryScroll_MoveSelectionDown
.extern InventoryScroll_PageUp
.extern InventoryScroll_PageDown
.extern InventoryScroll_UpdateInterpolation
.extern InventoryScroll_UpdatePresentation
.extern InventoryScroll_TestUpperArrowPress
.extern InventoryScroll_TestLowerArrowPress
.extern InventoryScroll_TestUpperArrowHold
.extern InventoryScroll_TestLowerArrowHold
.extern InventoryScroll_TestMarkerHit
.extern InventoryScroll_BeginMarkerDrag
.extern InventoryScroll_UpdateMarkerDrag
.extern InventoryScroll_EndMarkerDrag
.extern InventoryScroll_UpdateSelectionMovement
.extern InventoryScroll_ResetPresentationState
.extern Overlay032SpriteWrapper_HitTest
.extern func_ov032_02201930
.extern Overlay032Widget_HitTestRow
.extern func_ov032_02201e58
.extern func_ov032_02201ea4
.extern gSoundContext
.extern gSystemState

    .global func_ov032_02201960
func_ov032_02201960:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    cmp r1, #0xc
    addls pc, pc, r1, lsl #0x2
    b L_02201dc8
L_02201978: ; jump table
    b L_022019ac ; case 0
    b L_022019cc ; case 1
    b L_02201a04 ; case 2
    b L_02201dc8 ; case 3
    b L_02201dc8 ; case 4
    b L_02201dc8 ; case 5
    b L_02201dc8 ; case 6
    b L_02201dc8 ; case 7
    b L_02201dc8 ; case 8
    b L_02201dc8 ; case 9
    b L_02201cd4 ; case 10
    b L_02201cf0 ; case 11
    b L_02201d60 ; case 12
L_022019ac:
    bl func_ov032_02201ea4
    mov r0, r5
    bl func_ov032_02201930
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_ResetPresentationState
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
L_022019cc:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    ldrne r0, [r5, #0x4]
    addne r0, r0, #0x1
    strne r0, [r5, #0x4]
    bne L_02201dc8
    mov r0, r5
    bl func_ov032_02201e58
    cmp r0, #0x0
    beq L_02201dc8
    mov r0, r5
    bl func_ov032_02201930
    b L_02201dc8
L_02201a04:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_SaveOrigins
    ldr r0, L_02201dd8
    ldrh r0, [r0, #0xa]
    tst r0, #0x40
    beq L_02201a28
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_MoveSelectionUp
    b L_02201ca0
L_02201a28:
    tst r0, #0x80
    beq L_02201a3c
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_MoveSelectionDown
    b L_02201ca0
L_02201a3c:
    ldr r1, [r5, #0x0]
    ldr r0, [r1, #0xb80]
    cmp r0, #0x0
    beq L_02201ca0
    add r1, r1, #0x354
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x800
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    beq L_02201a70
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_PageUp
    b L_02201ca0
L_02201a70:
    ldr r1, [r5, #0x0]
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x354
    add r1, r1, #0x800
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_02201a98
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_PageDown
    b L_02201ca0
L_02201a98:
    ldr r1, [r5, #0x0]
    ldr r0, [r1, #0xb84]
    cmp r0, #0x0
    beq L_02201ca0
    add r1, r1, #0x354
    mov r0, r5
    add r1, r1, #0x800
    bl Overlay032Widget_HitTestRow
    ldr r1, [r5, #0x0]
    mov r4, r0
    add r1, r1, #0x354
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x800
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    beq L_02201b00
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_02201ca0
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x16
    bl Sound_Play
    b L_02201ca0
L_02201b00:
    ldr r1, [r5, #0x0]
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x354
    add r1, r1, #0x800
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    beq L_02201b44
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_02201ca0
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x16
    bl Sound_Play
    b L_02201ca0
L_02201b44:
    ldr r1, [r5, #0x0]
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x354
    add r1, r1, #0x800
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r5, #0x4]
    bne L_02201ca0
    cmp r4, #0x0
    blt L_02201bf4
    ldr r0, [r5, #0x4c]
    ldr r2, [r0, #0x14]
    cmp r4, r2
    beq L_02201bac
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl Sound_Play
    ldr r0, [r5, #0x4c]
    mov r1, r4
    bl InventoryScroll_SetSelectedRow
    mov r0, r5
    bl func_ov032_02201930
    b L_02201ca0
L_02201bac:
    ldr r0, [r5, #0x0]
    ldr r1, L_02201de0
    str r2, [r0, #0xf14]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0xf14]
    add r2, r1, r0, lsl #0x3
    ldrh r0, [r2, #0x2]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02201bec
    mov r1, #0x1
    mov r0, r5
    strh r1, [r2, #0x2]
    bl func_ov032_02201ea4
L_02201bec:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_02201bf4:
    ldr r1, [r5, #0x0]
    mvn r2, #0x0
    add r0, r1, #0x314
    add r1, r1, #0x354
    mov r3, r2
    add r0, r0, #0x800
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    beq L_02201c6c
    ldr r1, [r5, #0x4c]
    ldr r0, [r5, #0x0]
    ldr r2, [r1, #0x14]
    ldr r1, L_02201de0
    str r2, [r0, #0xf14]
    ldr r0, [r5, #0x0]
    ldr r0, [r0, #0xf14]
    add r2, r1, r0, lsl #0x3
    ldrh r0, [r2, #0x2]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02201c64
    mov r1, #0x1
    mov r0, r5
    strh r1, [r2, #0x2]
    bl func_ov032_02201ea4
L_02201c64:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_02201c6c:
    ldr r0, [r5, #0x0]
    mvn r2, #0x0
    add r1, r0, #0x354
    mov r3, r2
    add r0, r0, #0x154
    add r1, r1, #0x800
    bl Overlay032SpriteWrapper_HitTest
    cmp r0, #0x0
    ldrne r0, [r5, #0x0]
    mvnne r1, #0x0
    strne r1, [r0, #0xf14]
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
L_02201ca0:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_02201dc8
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl Sound_Play
    ldr r0, [r5, #0x4]
    sub r0, r0, #0x1
    str r0, [r5, #0x4]
    b L_02201dc8
L_02201cd4:
    ldr r0, [r5, #0x4c]
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    b L_02201dc8
L_02201cf0:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_02201d44
    ldr r0, [r5, #0x4c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02201d34
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_StopEffect
L_02201d34:
    ldr r0, [r5, #0x4]
    add r0, r0, #0x1
    str r0, [r5, #0x4]
    b L_02201dc8
L_02201d44:
    mov r0, r5
    bl func_ov032_02201e58
    cmp r0, #0x0
    beq L_02201dc8
    mov r0, r5
    bl func_ov032_02201930
    b L_02201dc8
L_02201d60:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_SaveOrigins
    ldr r1, [r5, #0x0]
    ldr r0, [r1, #0xb80]
    cmp r0, #0x0
    beq L_02201db4
    add r1, r1, #0x354
    ldr r0, [r5, #0x4c]
    add r1, r1, #0x800
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_02201dc8
    ldr r0, L_02201ddc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
    ldr r0, [r5, #0x4]
    sub r0, r0, #0x1
    str r0, [r5, #0x4]
    b L_02201dc8
L_02201db4:
    ldr r0, [r5, #0x4c]
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    mov r0, #0x0
    str r0, [r5, #0x4]
L_02201dc8:
    ldr r0, [r5, #0x4c]
    bl InventoryScroll_UpdatePresentation
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02201dd8: .word gSystemState
L_02201ddc: .word gSoundContext
L_02201de0: .word data_021f6288
.size func_ov032_02201960, .-func_ov032_02201960

