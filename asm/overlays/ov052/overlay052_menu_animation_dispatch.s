.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_021f4020
.extern func_02079408
.extern func_ov052_0220e064

.global func_ov052_0220e14c
func_ov052_0220e14c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, .L_0220e174
    mov r4, r2
    bl func_02079408
    mov r1, r0
    mov r0, r5
    mov r2, r4
    bl func_ov052_0220e064
    ldmia sp!, {r3, r4, r5, pc}
.L_0220e174: .word data_021f4020
.size func_ov052_0220e14c, . - func_ov052_0220e14c
