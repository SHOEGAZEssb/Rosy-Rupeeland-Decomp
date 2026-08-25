.text

/* Exact fallback; see src/overlays/ov032/overlay032_selection_motion.c for documented portable C. */
.extern GraphicsResource_GetFormat
.extern func_020708c4
.extern GraphicsArchiveResource_ReleaseAlternateBuffer
.extern func_02070958
.extern GraphicsBgPaletteResource_UploadToMainBg
.extern func_020b44e8
.extern Overlay032Controller_SetScaleTarget

    .global func_ov032_021fe9e8
func_ov032_021fe9e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    str r9, [r10, #0xc40]
    mov r0, #0x3c
    str r0, [r10, #0xb7c]
    ldr r0, [r10, #0xb48]
    bl GraphicsArchiveResource_ReleaseAlternateBuffer
    ldr r0, [r10, #0xb48]
    bl func_020708c4
    mvn r0, #0x0
    cmp r9, r0
    moveq r0, #0x100000
    movne r0, #0x0
    str r0, [r10, #0xc3c]
    ldr r1, [r10, #0xc3c]
    ldr r0, [r10, #0xb48]
    mov r1, r1, asr #0xc
    mov r2, r1
    mov r3, r1
    bl func_02070958
    bl func_020b44e8
    ldr r0, [r10, #0xb44]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r10, #0xb48]
    moveq r1, #0x0
    bl GraphicsBgPaletteResource_UploadToMainBg
    mov r8, #0x1
    add r0, r10, #0x5c
    add r6, r0, #0xc00
    mov r11, #0x0
    mov r7, r8
    mvn r4, #0x0
    mov r5, #0x6c
L_021fea78:
    mul r2, r8, r5
    add r0, r10, r2
    ldr r0, [r0, #0xc5c]
    cmp r0, #0x0
    moveq r0, r7
    movne r0, r11
    cmp r0, #0x0
    bne L_021feac4
    cmp r9, r4
    bne L_021feab4
    add r0, r6, r2
    mov r1, #0x0
    mov r2, #0x3c
    bl Overlay032Controller_SetScaleTarget
    b L_021feac4
L_021feab4:
    add r0, r6, r2
    mov r1, #0x80
    mov r2, #0x3c
    bl Overlay032Controller_SetScaleTarget
L_021feac4:
    add r8, r8, #0x1
    cmp r8, #0x3
    ble L_021fea78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov032_021fe9e8, .-func_ov032_021fe9e8

