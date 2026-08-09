.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e70
.extern func_02095308

.global func_ov094_02217c54
func_ov094_02217c54:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217c70
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217c70: .word data_ov094_02219e70
.size func_ov094_02217c54, . - func_ov094_02217c54
