.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_0221026c
func_ov059_0221026c:
    ldrsh r1, [r0, #0x6]
    ldrsh r0, [r0, #0x2]
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    bx lr
.size func_ov059_0221026c, . - func_ov059_0221026c
