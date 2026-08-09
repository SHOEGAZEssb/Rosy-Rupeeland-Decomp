.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_02210540
func_ov071_02210540:
    mov r1, #0x8
    strh r1, [r0, #0xf8]
    mov r1, #0x0
    str r1, [r0, #0xfc]
    bx lr
.size func_ov071_02210540, . - func_ov071_02210540
