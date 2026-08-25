.text

/* Exact fallback; see src/overlays/ov032/overlay032_selection_motion.c for documented portable C. */
.extern GraphicsResource_GetFormat
.extern func_02070958
.extern GraphicsBgPaletteResource_UploadToMainBg
.extern func_020b44e8
.extern Overlay032Controller_UpdateScale

    .global func_ov032_021fead4
func_ov032_021fead4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    mov r4, #0x1
    add r0, r5, #0x5c
    add r7, r0, #0xc00
    mov r8, #0x0
    mov r9, r4
    mov r6, #0x6c
L_021feaf4:
    mul r1, r4, r6
    add r0, r5, r1
    ldr r0, [r0, #0xc5c]
    cmp r0, #0x0
    moveq r0, r9
    movne r0, r8
    cmp r0, #0x0
    bne L_021feb1c
    add r0, r7, r1
    bl Overlay032Controller_UpdateScale
L_021feb1c:
    add r4, r4, #0x1
    cmp r4, #0x3
    ble L_021feaf4
    ldr r0, [r5, #0xb7c]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    subs r0, r0, #0x1
    str r0, [r5, #0xb7c]
    ldr r1, [r5, #0xc40]
    mvn r0, #0x0
    bne L_021feb90
    cmp r1, r0
    moveq r1, #0x0
    movne r1, #0x100
    ldr r0, [r5, #0xb48]
    mov r2, r1
    mov r3, r1
    bl func_02070958
    bl func_020b44e8
    ldr r0, [r5, #0xb44]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r5, #0xb48]
    moveq r1, #0x0
    bl GraphicsBgPaletteResource_UploadToMainBg
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021feb90:
    cmp r1, r0
    ldr r1, [r5, #0xc3c]
    ldreq r0, [r5, #0xc38]
    subeq r0, r1, r0
    ldrne r0, [r5, #0xc38]
    addne r0, r1, r0
    str r0, [r5, #0xc3c]
    ldr r1, [r5, #0xc3c]
    ldr r0, [r5, #0xb48]
    mov r1, r1, asr #0xc
    mov r2, r1
    mov r3, r1
    bl func_02070958
    bl func_020b44e8
    ldr r0, [r5, #0xb44]
    bl GraphicsResource_GetFormat
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r5, #0xb48]
    moveq r1, #0x0
    bl GraphicsBgPaletteResource_UploadToMainBg
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size func_ov032_021fead4, .-func_ov032_021fead4

