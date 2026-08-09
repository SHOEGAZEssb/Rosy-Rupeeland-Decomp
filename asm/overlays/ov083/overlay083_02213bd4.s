.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213bd4
func_ov083_02213bd4:
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x8]
    bx lr
.size func_ov083_02213bd4, . - func_ov083_02213bd4
