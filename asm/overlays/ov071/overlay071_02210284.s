.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_02210284
func_ov071_02210284:
    mov r1, #0x80000
    str r1, [r0, #0x60]
    mov r1, #0x0
    str r1, [r0, #0x64]
    str r1, [r0, #0xd4]
    str r1, [r0, #0xcc]
    str r1, [r0, #0xd0]
    strh r1, [r0, #0xf8]
    str r1, [r0, #0xfc]
    bx lr
.size func_ov071_02210284, . - func_ov071_02210284
