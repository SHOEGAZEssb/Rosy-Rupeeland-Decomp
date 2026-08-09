.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_022119bc
func_ov069_022119bc:
    mov r1, #0x0
    str r1, [r0, #0x60]
    str r1, [r0, #0x64]
    ldr r0, [r0, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    strb r1, [r0, #0x3a]
    bx lr
.size func_ov069_022119bc, . - func_ov069_022119bc
