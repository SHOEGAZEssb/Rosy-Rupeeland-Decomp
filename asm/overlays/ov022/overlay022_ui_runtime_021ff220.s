.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern data_021f5128
.extern data_021f5ed0
.extern GraphicsSpriteRenderer_SetFontResource
.extern RecordMode_GetMessage
.extern TitleDialog_SetText
.extern TitleDialog_UpdateTextPage
.extern Overlay022_DrawCenteredCounter
.extern Overlay022_StatusWidget_SetMode2
.extern Overlay022_StatusWidget_SetSelector
.extern gDebugFont


    .global func_ov022_021ff220
func_ov022_021ff220:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, L_021ff2b8
    mov r4, r0
    ldr r0, [r2, #0x0]
    ldr r3, [r4, #0x2cc]
    ldr r0, [r0, #0x1c]
    mov r2, #0xd
    str r2, [r3, #0xd0]
    mov r2, #0x0
    str r2, [r3, #0xd4]
    bl RecordMode_GetMessage
    mov r1, r0
    ldr r0, [r4, #0x2cc]
    mov r2, #0x4
    bl TitleDialog_SetText
    ldr r0, [r4, #0x2cc]
    ldr r1, L_021ff2bc
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021ff294
    ldr r1, [r4, #0x2cc]
    ldr r0, [r4, #0x350]
    ldr r1, [r1, #0xe8]
    bl Overlay022_StatusWidget_SetSelector
    b L_021ff29c
L_021ff294:
    ldr r0, [r4, #0x350]
    bl Overlay022_StatusWidget_SetMode2
L_021ff29c:
    ldr r0, L_021ff2c0
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    bl Overlay022_DrawCenteredCounter
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff2b8: .word data_021f5128
L_021ff2bc: .word data_021f5ed0
L_021ff2c0: .word gDebugFont
.size func_ov022_021ff220, .-func_ov022_021ff220

