.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_ov069_0221279c

.global func_ov069_0220fd20
func_ov069_0220fd20:
    ldr r2, .L_0220fd38
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_0220fd38: .word data_ov069_0221279c
.size func_ov069_0220fd20, . - func_ov069_0220fd20
