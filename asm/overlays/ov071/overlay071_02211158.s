.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern data_ov071_022123c0

.global func_ov071_02211158
func_ov071_02211158:
    ldr r2, .L_02211174
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x1b8]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x1bc]
    str r1, [r0, #0x8]
    bx lr
.L_02211174: .word data_ov071_022123c0
.size func_ov071_02211158, . - func_ov071_02211158
