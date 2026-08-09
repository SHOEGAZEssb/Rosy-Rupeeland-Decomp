.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214340
.extern func_ov085_02213bd0

.global func_ov085_02213df8
func_ov085_02213df8:
    mov r3, #0x0
    str r3, [r0, #0xcc]
    str r3, [r0, #0xc8]
    strb r3, [r0, #0xd5]
    ldr r2, .L_02213e28
    ldr ip, .L_02213e2c
    strb r3, [r0, #0xd4]
    add r1, r0, #0x100
    strh r3, [r1, #0xea]
    mov r3, #0x12c
    ldmia r2, {r1, r2}
    bx ip
.L_02213e28: .word data_ov085_02214340
.L_02213e2c: .word func_ov085_02213bd0
.size func_ov085_02213df8, . - func_ov085_02213df8
