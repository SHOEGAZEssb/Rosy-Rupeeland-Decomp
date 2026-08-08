.text
/* Exact fallback; see overlay038_selection_accessors.c for portable C. */
    .extern data_020d7a48
    .global func_ov038_021fd508
func_ov038_021fd508:
    ldr r1, [r0, #0x110]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r2, [r0, #0x314]
    mov r1, #0x24
    ldr r3, [r2, #0x14]
    ldr r2, L_021fd53c
    add r0, r0, r3, lsl #0x2
    ldr r0, [r0, #0x114]
    mul r1, r0, r1
    ldrsh r0, [r2, r1]
    bx lr
L_021fd53c: .word data_020d7a48
    .size func_ov038_021fd508, .-func_ov038_021fd508
