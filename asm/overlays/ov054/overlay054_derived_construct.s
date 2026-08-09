.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern data_ov054_0220f130
.extern func_ov054_0220e400

.global func_ov054_0220e68c
func_ov054_0220e68c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov054_0220e400
    ldr r0, .L_0220e6b0
    mov r1, #0x0
    str r0, [r4, #0x0]
    mov r0, r4
    str r1, [r4, #0x1b4]
    ldmia sp!, {r4, pc}
.L_0220e6b0: .word data_ov054_0220f130
.size func_ov054_0220e68c, . - func_ov054_0220e68c
