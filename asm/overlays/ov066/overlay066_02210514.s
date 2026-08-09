.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_ov066_02210efc

.global func_ov066_02210514
func_ov066_02210514:
    ldr r2, .L_02210530
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_02210530: .word data_ov066_02210efc
.size func_ov066_02210514, . - func_ov066_02210514
