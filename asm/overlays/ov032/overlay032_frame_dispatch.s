.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern TouchPanelManager_GetPoint
.extern GamePhaseCurrencyHud_Update
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern Overlay032_UpdatePromptBlink
.extern gLupyContext
.extern gPadState1
.extern gTouchPanelManager

    .global func_ov032_021fdf30
func_ov032_021fdf30:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, L_021fe018
    ldr r0, L_021fe01c
    str r1, [r4, #0xb60]
    ldr r1, [r0, #0x0]
    add r0, sp, #0x0
    bl TouchPanelManager_GetPoint
    add r0, r4, #0x354
    add r1, sp, #0x0
    add r0, r0, #0x800
    cmp r1, r0
    ldrne r0, [sp, #0x4]
    strne r0, [r4, #0xb58]
    ldrne r0, [sp, #0x8]
    strne r0, [r4, #0xb5c]
    ldr r0, L_021fe01c
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0x44]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_021fdfb0
    ldr r0, [r4, #0xb80]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [r4, #0xb84]
    mov r0, #0x1
    b L_021fdfb8
L_021fdfb0:
    mov r0, #0x0
    str r0, [r4, #0xb84]
L_021fdfb8:
    add r1, r4, #0x36c
    str r0, [r4, #0xb80]
    ldr r0, [r1, #0x804]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r1, #0x800]
    ldrne r1, [r2, r1]
    ldreq r1, [r1, #0x800]
    blx r1
    movs r5, r0
    bne L_021fe00c
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, L_021fe020
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    mov r0, r4
    bl Overlay032_UpdatePromptBlink
L_021fe00c:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fe018: .word gPadState1
L_021fe01c: .word gTouchPanelManager
L_021fe020: .word gLupyContext
.size func_ov032_021fdf30, .-func_ov032_021fdf30

