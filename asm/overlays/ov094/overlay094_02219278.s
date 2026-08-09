.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219ed4
.extern func_ov094_02219230

.global func_ov094_02219278
func_ov094_02219278:
    stmdb sp!, {r4, lr}
    ldr r2, .L_022192a0
    mov r4, r0
    ldr r1, .L_022192a4
    str r2, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0x0]
    bl func_ov094_02219230
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022192a0: .word data_ov094_02219ed4
.L_022192a4: .word 0x4000050
.size func_ov094_02219278, . - func_ov094_02219278
