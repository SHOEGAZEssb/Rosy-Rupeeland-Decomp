.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_ov069_0221278c

.global func_ov069_0220fe0c
func_ov069_0220fe0c:
    ldr r2, .L_0220fe24
    mov r1, #0x0
    str r2, [r0, #0x0]
    strh r1, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
.L_0220fe24: .word data_ov069_0221278c
.size func_ov069_0220fe0c, . - func_ov069_0220fe0c
