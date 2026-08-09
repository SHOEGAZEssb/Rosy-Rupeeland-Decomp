.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_ov080_02213e68

.global func_ov080_022136c0
func_ov080_022136c0:
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x0]
    mov r4, r0
    ldr r2, [r2, #0xd4]
    blx r2
    ldr r1, .L_022136f0
    mov r0, #0x1
    ldr r2, [r1, #0x0]
    ldr r1, [r1, #0x4]
    str r2, [r4, #0x220]
    str r1, [r4, #0x224]
    ldmia sp!, {r4, pc}
.L_022136f0: .word data_ov080_02213e68
.size func_ov080_022136c0, . - func_ov080_022136c0
