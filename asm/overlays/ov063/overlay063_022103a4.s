.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_021052fc
.extern func_ov063_02210380

.global func_ov063_022103a4
func_ov063_022103a4:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_ov063_02210380
    ldr r0, .L_022103d8
    add r1, sp, #0x0
    ldr r0, [r0, #0x0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {pc}
.L_022103d8: .word data_021052fc
.size func_ov063_022103a4, . - func_ov063_022103a4
