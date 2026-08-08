.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_setup.c for documented portable C. */

    .global func_ov032_021fd938
func_ov032_021fd938:
    ldr r1, [r0, #0xb78]
    ldr r2, L_021fd988
    rsb r1, r1, #0x0
    add r1, r1, r1, lsr #0x1f
    mov r3, r1, asr #0x1
    ldr r1, L_021fd98c
    and r3, r2, r3, lsl #0x10
    str r3, [r1, #0x0]
    ldr r1, [r0, #0xb78]
    ldr r3, L_021fd990
    add r1, r1, #0xa0
    rsb r1, r1, #0x0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    and r1, r2, r1, lsl #0x10
    str r1, [r3, #0x0]
    ldr r1, [r0, #0xb78]
    add r1, r1, #0x1
    str r1, [r0, #0xb78]
    bx lr
L_021fd988: .word 0x1ff0000
L_021fd98c: .word 0x4001018
L_021fd990: .word 0x4000014
.size func_ov032_021fd938, .-func_ov032_021fd938

