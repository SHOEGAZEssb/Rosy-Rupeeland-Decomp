.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_ov066_02210efc

.global func_ov066_02210e54
func_ov066_02210e54:
    ldr r2, .L_02210e6c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_02210e6c: .word data_ov066_02210efc
.size func_ov066_02210e54, . - func_ov066_02210e54
