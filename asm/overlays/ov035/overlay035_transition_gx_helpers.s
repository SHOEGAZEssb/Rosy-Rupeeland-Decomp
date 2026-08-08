.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_render.c for documented portable C. */




    .global func_ov035_021fe88c
func_ov035_021fe88c: 
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    rsb r1, r1, #0x4
    mov r1, r0, lsr r1
    ldr r0, L_021fe8ac
    str r1, [r0, #0x0]
    bx lr
L_021fe8ac: .word 0x40004ac
.size func_ov035_021fe88c, .-func_ov035_021fe88c

    .global func_ov035_021fe8b0

func_ov035_021fe8b0: 
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fe8e0
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
L_021fe8e0: .word 0x4000488
.size func_ov035_021fe8b0, .-func_ov035_021fe8b0

