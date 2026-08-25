.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern data_021f3ecc
.extern data_021f5ed0
.extern GraphicsSpriteRenderer_SetFontResource
.extern LanguageLookupDatabase_GetResourceById
.extern TitleDialog_SetText
.extern TitleDialog_UpdateTextPage
.extern Overlay022_DrawCenteredCounter
.extern Overlay022_StatusWidget_SetMode2
.extern Overlay022_StatusWidget_SetSelector
.extern gDebugFont


    .global func_ov022_021ff2c4
func_ov022_021ff2c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x2cc]
    mov r0, #0xd
    mov r1, r1, lsl #0x10
    str r0, [r3, #0xd0]
    mov r2, #0x0
    ldr r0, L_021ff35c
    str r2, [r3, #0xd4]
    mov r1, r1, lsr #0x10
    bl LanguageLookupDatabase_GetResourceById
    mov r1, r0
    ldr r0, [r4, #0x2cc]
    mov r2, #0x4
    bl TitleDialog_SetText
    ldr r0, [r4, #0x2cc]
    ldr r1, L_021ff360
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021ff338
    ldr r1, [r4, #0x2cc]
    ldr r0, [r4, #0x350]
    ldr r1, [r1, #0xe8]
    bl Overlay022_StatusWidget_SetSelector
    b L_021ff340
L_021ff338:
    ldr r0, [r4, #0x350]
    bl Overlay022_StatusWidget_SetMode2
L_021ff340:
    ldr r0, L_021ff364
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    bl Overlay022_DrawCenteredCounter
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff35c: .word data_021f3ecc
L_021ff360: .word data_021f5ed0
L_021ff364: .word gDebugFont
.size func_ov022_021ff2c4, .-func_ov022_021ff2c4

