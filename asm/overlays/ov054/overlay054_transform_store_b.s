.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.

.global func_ov054_0220e994
func_ov054_0220e994:
    ldr r2, .L_0220e9b8
    cmp r1, #0x0
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3f
    orr r1, r1, r0
    ldr r0, .L_0220e9b8
    orrne r1, r1, #0x20
    strh r1, [r0, #0x0]
    bx lr
.L_0220e9b8: .word 0x400004a
.size func_ov054_0220e994, . - func_ov054_0220e994
