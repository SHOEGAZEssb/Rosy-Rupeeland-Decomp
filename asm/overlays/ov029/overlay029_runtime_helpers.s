.text

/* Exact fallback; see src/overlays/ov029/overlay029_runtime_helpers.c. */
.extern data_020f4e18
.extern data_021f5ed0
.extern data_021f5ee8
.extern GamePhaseCurrencyHud_Update
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsResourceSet_ApplyToMainBg
.extern GraphicsSpriteRenderer_SetFontResource
.extern RecordDescriptor_GetMessage
.extern TitleScreenResourceCollection_Init
.extern TitleScreenResourceCollection_Destroy
.extern TitleScreenResourceCollection_Append
.extern TitleScreenResourceCollection_Get
.extern TitlePalette_SetMainBackdrop
.extern Presentation_BlendPalette16
.extern TitleDialog_SetText
.extern TitleDialog_UpdateTextPage
.extern TitleDialog_ClearTextRect
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern func_ov002_021fba00
.extern func_ov029_021fce00
.extern func_ov045_0220b908
.extern func_ov045_0220c028
.extern func_ov045_0220c128
.extern func_ov045_0220c18c
.extern Overlay045_DrawSelectorPreview
.extern gDebugFont
.extern gGamePhaseCurrencyHud
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov029_021fd644
func_ov029_021fd644:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x54
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Init
    ldr r3, L_021fd6ec
    ldr r0, L_021fd6f0
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r1, L_021fd6f4
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Append
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x10
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    mov r0, #0x0
    bl TitlePalette_SetMainBackdrop
    ldr r1, L_021fd6f8
    mov r2, #0x0
    mov r0, #0x13
    strh r2, [r1, #0x0]
    str r0, [r4, #0x48]
    add r0, sp, #0x10
    bl TitleScreenResourceCollection_Destroy
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x54
    ldmia sp!, {r3, r4, pc}
L_021fd6ec: .word 0xa06f
L_021fd6f0: .word data_020f4e18
L_021fd6f4: .word 0xa070
L_021fd6f8: .word 0x4000050
.size func_ov029_021fd644, .-func_ov029_021fd644
    .global func_ov029_021fd6fc
func_ov029_021fd6fc:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd7a0
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GamePhaseCurrencyHud_Update
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    beq L_021fd720
    bl func_ov045_0220c18c
L_021fd720:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fd738
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fd738:
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    beq L_021fd748
    bl func_ov002_021fba00
L_021fd748:
    ldr r0, [r4, #0xd0]
    bl func_ov045_0220b908
    ldr r0, [r4, #0xdc]
    cmp r0, #0x10
    ldmgeia sp!, {r4, pc}
    add r2, r0, #0x1
    str r2, [r4, #0xdc]
    ldr r0, [r4, #0xd4]
    ldr r1, [r4, #0xd8]
    bl Presentation_BlendPalette16
    ldr r0, L_021fd7a4
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
    ldr r0, [r4, #0xa8]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, L_021fd7a4
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b2058
    ldmia sp!, {r4, pc}
L_021fd7a0: .word gGamePhaseCurrencyHud
L_021fd7a4: .word data_021f5ee8
.size func_ov029_021fd6fc, .-func_ov029_021fd6fc
    .global func_ov029_021fd7a8
func_ov029_021fd7a8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    mov r4, r1
    ldr r1, [r5, #0x68]
    add r0, sp, #0x8
    bl func_ov029_021fce00
    ldr r0, [r5, #0x9c]
    bl TitleDialog_ClearTextRect
    add r0, sp, #0x8
    mov r1, r4
    bl RecordDescriptor_GetMessage
    mov r1, r0
    ldr r0, [r5, #0x9c]
    mov r2, #0x4
    bl TitleDialog_SetText
    ldr r0, [r5, #0x9c]
    ldr r1, L_021fd848
    bl TitleDialog_UpdateTextPage
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r0, lsl #0x16
    movs r0, r0, asr #0x1f
    beq L_021fd81c
    ldr r1, [r5, #0x9c]
    ldr r0, [r5, #0xa4]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
    b L_021fd824
L_021fd81c:
    ldr r0, [r5, #0xa4]
    bl func_ov045_0220c028
L_021fd824:
    ldr r0, L_021fd84c
    ldr r1, [r5, #0x78]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    bl Overlay045_DrawSelectorPreview
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
L_021fd848: .word data_021f5ed0
L_021fd84c: .word gDebugFont
.size func_ov029_021fd7a8, .-func_ov029_021fd7a8
