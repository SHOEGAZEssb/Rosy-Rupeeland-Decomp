.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */

    .global func_ov032_02201390
func_ov032_02201390:
    ldr r1, [r0, #0x64]
    cmp r1, #0x0
    moveq r0, #0x1
    bxeq lr
    ldr r1, [r0, #0x18]
    cmp r1, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    movne r0, #0x1
    bxne lr
    ldr r1, [r0, #0x64]
    sub r1, r1, #0x1
    str r1, [r0, #0x64]
    ldr r2, [r0, #0x5c]
    ldr r1, [r0, #0x58]
    add r1, r2, r1
    str r1, [r0, #0x5c]
    ldr r1, [r0, #0x64]
    cmp r1, #0x0
    bne L_02201400
    ldr r3, [r0, #0x4c]
    ldr r2, [r0, #0x18]
    ldr r1, [r0, #0x68]
    mov r0, #0x1
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    bx lr
L_02201400:
    ldr r2, [r0, #0x5c]
    ldr r3, [r0, #0x48]
    ldr r1, [r0, #0x60]
    mov r2, r2, asr #0xc
    mla r1, r2, r1, r3
    ldr r3, [r0, #0x4c]
    ldr r2, [r0, #0x18]
    mov r0, #0x0
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    bx lr
.size func_ov032_02201390, .-func_ov032_02201390

