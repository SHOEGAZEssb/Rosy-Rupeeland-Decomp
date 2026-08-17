.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern TitleDialog_UpdateTextPage


    .global func_ov025_02200940
func_ov025_02200940:
    stmdb sp!, {lr}
    sub sp, sp, #0x2c
    ldr ip, [r0, #0x2c]
    add r3, sp, #0x14
    mov r2, #0xb
L_02200954:
    ldrh r1, [ip], #0x2
    subs r2, r2, #0x1
    strh r1, [r3], #0x2
    bne L_02200954
    ldr r1, [r0, #0x50c]
    ldr r2, [r1, #0x38]
    mov r1, r2, lsl #0x1f
    movs r1, r1, asr #0x1f
    str r2, [sp, #0x4]
    str r2, [sp, #0xc]
    movne r0, #0x1
    bne L_022009d0
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x1a
    movs r1, r1, asr #0x1f
    beq L_022009ac
    mov r1, r2, lsl #0x1e
    movs r1, r1, asr #0x1f
    ldrneh r1, [sp, #0x16]
    str r2, [sp, #0x8]
    orrne r1, r1, #0x1
    strneh r1, [sp, #0x16]
L_022009ac:
    ldr r0, [r0, #0x50c]
    add r1, sp, #0x14
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0x10]
    movs r0, r1, asr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
L_022009d0:
    add sp, sp, #0x2c
    ldmia sp!, {pc}
.size func_ov025_02200940, .-func_ov025_02200940

