.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.

.global func_ov069_0221094c
func_ov069_0221094c:
    add r0, r0, r1, lsl #0x4
    add r0, r0, #0x1000
    ldr r3, [r0, #0x590]
    mov r1, #0x0
    str r3, [r2, #0x4]
    ldr r0, [r0, #0x598]
    str r0, [r2, #0x8]
    str r1, [r2, #0xc]
    bx lr
.size func_ov069_0221094c, . - func_ov069_0221094c
