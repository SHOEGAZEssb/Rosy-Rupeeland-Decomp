.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_0220fdf8
func_ov060_0220fdf8:
    ldrsh r1, [r0, #0x2]
    ldrsh r0, [r0, #0x6]
    sub r0, r0, r1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    add r0, r0, r0, lsr #0x1f
    add r0, r1, r0, asr #0x1
    bx lr
.size func_ov060_0220fdf8, . - func_ov060_0220fdf8
