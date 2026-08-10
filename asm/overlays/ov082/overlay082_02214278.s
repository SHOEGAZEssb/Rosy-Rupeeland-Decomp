.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_0221483c
.extern Actor_RestoreSavedFlags

.global func_ov082_02214278
func_ov082_02214278:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    ldr r0, .L_022142d0
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r3, [r0, #0x18]
    ldr r2, [r0, #0x1c]
    mov r1, #0x2
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r3, [r0, #0x28]
    ldr r2, [r0, #0x2c]
    mov r0, #0x0
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    ldr r2, [r4, #0xd0]
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_022142d0: .word data_ov082_0221483c
.size func_ov082_02214278, . - func_ov082_02214278
