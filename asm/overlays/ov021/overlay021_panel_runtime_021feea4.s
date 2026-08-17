    .text
/* Exact fallback; see src/overlays/ov021/overlay021_panel_runtime.c. */
    .extern data_021f5ee8
    .extern GamePhaseCurrencyHud_Update
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern Presentation_BlendPalette16
    .extern InventoryScroll_UpdatePresentation
    .extern func_020958d8
    .extern func_020b1ff0
    .extern func_020b2058
    .extern func_ov000_021fc164
    .extern func_ov001_021fbf7c
    .extern func_ov002_021fba00
    .extern func_ov045_0220b908
    .extern func_ov045_0220c18c
    .extern gLupyContext

.global func_ov021_021feea4
func_ov021_021feea4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, L_021fefc4
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GamePhaseCurrencyHud_Update
    add r0, r4, #0xa0
    bl func_020958d8
    mov r7, #0x0
    add r6, r4, #0x14c
    mov r5, #0xac
L_021feecc:
    mla r0, r7, r5, r6
    bl func_020958d8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt L_021feecc
    ldr r5, [r4, #0x2c0]
    cmp r5, #0x0
    beq L_021feefc
    ldr r0, [r5, #0x58]
    bl InventoryScroll_UpdatePresentation
    ldr r0, [r5, #0x1c]
    bl GraphicsSpriteGroup_AdvanceAnimations
L_021feefc:
    ldr r0, [r4, #0x38c]
    cmp r0, #0x0
    beq L_021fef0c
    bl func_ov045_0220c18c
L_021fef0c:
    ldr r0, [r4, #0x390]
    cmp r0, #0x0
    beq L_021fef1c
    bl func_ov002_021fba00
L_021fef1c:
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    beq L_021fef34
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fef34:
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_021fef44
    bl func_ov000_021fc164
L_021fef44:
    ldr r0, [r4, #0x358]
    cmp r0, #0x0
    beq L_021fef54
    bl func_ov001_021fbf7c
L_021fef54:
    ldr r0, [r4, #0x3ec]
    bl func_ov045_0220b908
    ldr r0, [r4, #0x94]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x3f8]
    cmp r0, #0x10
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    add r2, r0, #0x1
    str r2, [r4, #0x3f8]
    ldr r0, [r4, #0x3f0]
    ldr r1, [r4, #0x3f4]
    bl Presentation_BlendPalette16
    ldr r0, L_021fefc8
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldr r0, [r4, #0x390]
    cmp r0, #0x0
    ldreq r0, [r4, #0x354]
    cmpeq r0, #0x0
    ldreq r0, [r4, #0x358]
    cmpeq r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, L_021fefc8
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fefc4: .word gLupyContext
L_021fefc8: .word data_021f5ee8
    .size func_ov021_021feea4, . - func_ov021_021feea4

