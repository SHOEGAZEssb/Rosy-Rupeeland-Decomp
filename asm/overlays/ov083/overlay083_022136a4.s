.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02213e48

.global func_ov083_022136a4
func_ov083_022136a4:
    ldr r2, [r0, #0x260]
    mov r1, #0x8
    bic r2, r2, #0x1
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    mov r1, #0x16
    strh r1, [r0, #0xd6]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0x5a]
    sub r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldrsh r1, [r1, #0x5a]
    cmp r1, #0x0
    bge .L_02213700
    ldr r1, .L_02213708
    ldr r3, [r1, #0x0]
    ldr r2, [r1, #0x4]
    str r3, [r0, #0x218]
    str r2, [r0, #0x21c]
    ldr r2, [r1, #0x28]
    ldr r1, [r1, #0x2c]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
.L_02213700:
    mov r0, #0x0
    bx lr
.L_02213708: .word data_ov083_02213e48
.size func_ov083_022136a4, . - func_ov083_022136a4
