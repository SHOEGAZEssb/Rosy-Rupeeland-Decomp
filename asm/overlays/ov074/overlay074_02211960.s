.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.

.global func_ov074_02211960
func_ov074_02211960:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, .L_02211990
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
.L_02211990: .word 0x4000488
.size func_ov074_02211960, . - func_ov074_02211960
