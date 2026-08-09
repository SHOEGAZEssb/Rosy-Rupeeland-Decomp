.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_02217d90
func_ov095_02217d90:
    ldrsh r1, [r0, #0x6]
    ldrsh r0, [r0, #0x2]
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    bx lr
.size func_ov095_02217d90, . - func_ov095_02217d90
