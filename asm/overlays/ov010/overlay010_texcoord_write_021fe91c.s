    .text
/* Exact fallback; see src/overlays/ov010/overlay010_texcoord_write.c. */
    .global func_ov010_021fe91c
func_ov010_021fe91c: ; 0x021fe91c
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fe94c
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
L_021fe94c: .word 0x4000488

    .size func_ov010_021fe91c, . - func_ov010_021fe91c
