.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern data_ov070_02212ac0

.global func_ov070_02210218
func_ov070_02210218:
    ldr r2, .L_02210230
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_02210230: .word data_ov070_02212ac0
.size func_ov070_02210218, . - func_ov070_02210218
