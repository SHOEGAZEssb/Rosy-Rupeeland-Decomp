.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_02210928
func_ov069_02210928:
    mov r3, #0x3c
    mla r3, r1, r3, r0
    ldr r1, [r3, #0x474]
    mov r0, #0x0
    str r1, [r2, #0x4]
    ldr r1, [r3, #0x478]
    str r1, [r2, #0x8]
    str r0, [r2, #0xc]
    bx lr
.size func_ov069_02210928, . - func_ov069_02210928
