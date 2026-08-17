.text

/* Exact fallback; see src/overlays/ov030/overlay030_dialog_runtime.c for documented portable C. */
.extern data_021f3ecc
.extern data_021f5ed0
.extern GraphicsSpriteRenderer_SetFontResource
.extern func_020791e0
.extern TitleDialog_SetText
.extern TitleDialog_UpdateTextPage
.extern func_ov045_0220c028
.extern func_ov045_0220c128
.extern Overlay045_DrawSelectorPreview
.extern gDebugFont


    .global func_ov030_021fe954
func_ov030_021fe954:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x2bc]
    mov r0, #0xd
    mov r1, r1, lsl #0x10
    str r0, [r3, #0xd0]
    mov r2, #0x0
    ldr r0, L_021fe9f4
    str r2, [r3, #0xd4]
    mov r1, r1, lsr #0x10
    bl func_020791e0
    mov r1, r0
    ldr r0, [r4, #0x2bc]
    mov r2, #0x4
    bl TitleDialog_SetText
    ldr r0, [r4, #0x2bc]
    ldr r1, L_021fe9f8
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021fe9c8
    ldr r1, [r4, #0x2bc]
    ldr r0, [r4, #0x2c0]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
    b L_021fe9d0
L_021fe9c8:
    ldr r0, [r4, #0x2c0]
    bl func_ov045_0220c028
L_021fe9d0:
    ldr r0, L_021fe9fc
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0x8
    mov r1, #0x21
    bl Overlay045_DrawSelectorPreview
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021fe9f4: .word data_021f3ecc
L_021fe9f8: .word data_021f5ed0
L_021fe9fc: .word gDebugFont
.size func_ov030_021fe954, .-func_ov030_021fe954
