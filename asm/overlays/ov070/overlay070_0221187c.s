.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern data_ov070_02212ac0

.global func_ov070_0221187c
func_ov070_0221187c:
    ldr r2, .L_02211898
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_02211898: .word data_ov070_02212ac0
.size func_ov070_0221187c, . - func_ov070_0221187c
