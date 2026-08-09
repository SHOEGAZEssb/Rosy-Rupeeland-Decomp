.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern data_ov071_022123c0

.global func_ov071_02210184
func_ov071_02210184:
    ldr r2, .L_0221019c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_0221019c: .word data_ov071_022123c0
.size func_ov071_02210184, . - func_ov071_02210184
