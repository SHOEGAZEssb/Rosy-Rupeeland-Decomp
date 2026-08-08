.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_gameplay_state.c for documented portable C. */



    .global func_ov030_021ff574
func_ov030_021ff574:
    ldr r2, [r0, #0x0]
    cmp r2, #0x0
    beq L_021ff59c
    ldr r1, [r0, #0x4]
    cmp r2, r1
    sub r1, r2, #0x1
    streq r1, [r0, #0x0]
    moveq r0, #0x1
    bxeq lr
    str r1, [r0, #0x0]
L_021ff59c:
    mov r0, #0x0
    bx lr
.size func_ov030_021ff574, .-func_ov030_021ff574
