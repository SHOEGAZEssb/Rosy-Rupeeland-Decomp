.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_ov066_02210efc

.global func_ov066_0220fe40
func_ov066_0220fe40:
    ldr r3, .L_0220fe50
    str r3, [r0, #0x0]
    stmib r0, {r1, r2}
    bx lr
.L_0220fe50: .word data_ov066_02210efc
.size func_ov066_0220fe40, . - func_ov066_0220fe40
