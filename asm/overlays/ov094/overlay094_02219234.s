.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219ed4
.extern Presentation_Init
.extern func_020afce8

.global func_ov094_02219234
func_ov094_02219234:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Presentation_Init
    ldr r0, .L_02219270
    mov r2, #0x0
    str r0, [r4, #0x0]
    str r2, [r4, #0x9c]
    mov r0, #0x20
    str r0, [r4, #0x7c]
    ldr r0, .L_02219274
    mov r1, #0xe
    str r2, [r4, #0x80]
    bl func_020afce8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02219270: .word data_ov094_02219ed4
.L_02219274: .word 0x4000050
.size func_ov094_02219234, . - func_ov094_02219234
