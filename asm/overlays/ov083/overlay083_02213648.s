.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02213e48
.extern func_02033efc

.global func_ov083_02213648
func_ov083_02213648:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02033efc
    ldr r1, [r4, #0x10]
    ldr r0, .L_022136a0
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r3, [r0, #0x18]
    ldr r2, [r0, #0x1c]
    mov r1, #0x2
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r3, [r0, #0x30]
    ldr r2, [r0, #0x34]
    mov r0, #0x0
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    ldr r2, [r4, #0xd0]
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_022136a0: .word data_ov083_02213e48
.size func_ov083_02213648, . - func_ov083_02213648
