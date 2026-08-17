.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern data_021f5ee8
.extern GamePhaseCurrencyHud_Update
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern Presentation_BlendPalette16
.extern InventoryScroll_UpdatePresentation
.extern PresentationList_UpdateAndDeleteCompleted
.extern func_020958d8
.extern func_020b1ff0
.extern func_020b2058
.extern func_ov046_0220c1a4
.extern gLupyContext


    .global func_ov022_021ff0d0
func_ov022_021ff0d0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, L_021ff1dc
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GamePhaseCurrencyHud_Update
    add r0, r4, #0xa8
    bl func_020958d8
    mov r7, #0x0
    add r6, r4, #0x154
    mov r5, #0xac
L_021ff0f8:
    mla r0, r7, r5, r6
    bl func_020958d8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt L_021ff0f8
    ldr r5, [r4, #0x350]
    cmp r5, #0x0
    beq L_021ff130
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    ldr r0, [r5, #0x1c]
    bl GraphicsSpriteGroup_AdvanceAnimations
L_021ff130:
    ldr r0, [r4, #0x2b8]
    cmp r0, #0x0
    beq L_021ff144
    ldr r0, [r0, #0x30]
    bl InventoryScroll_UpdatePresentation
L_021ff144:
    ldr r0, [r4, #0x35c]
    cmp r0, #0x0
    beq L_021ff174
    bl func_ov046_0220c1a4
    ldr r2, [r4, #0x35c]
    ldr r1, [r4, #0xa0]
    ldr r0, [r2, #0x10c]
    ldr r2, [r2, #0x110]
    rsb r0, r0, #0x80
    str r0, [r1, #0x18]
    rsb r0, r2, #0x60
    str r0, [r1, #0x1c]
L_021ff174:
    ldr r5, [r4, #0x354]
    add r0, r5, #0x48
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x9c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0xa0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x370]
    cmp r0, #0x10
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    add r2, r0, #0x1
    str r2, [r4, #0x370]
    ldr r0, [r4, #0x368]
    ldr r1, [r4, #0x36c]
    bl Presentation_BlendPalette16
    ldr r0, L_021ff1e0
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldr r0, L_021ff1e0
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021ff1dc: .word gLupyContext
L_021ff1e0: .word data_021f5ee8
.size func_ov022_021ff0d0, .-func_ov022_021ff0d0

