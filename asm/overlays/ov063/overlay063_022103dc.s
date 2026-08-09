.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_021052fc
.extern func_ov063_02210380

.global func_ov063_022103dc
func_ov063_022103dc:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_ov063_02210380
    ldr r0, .L_02210410
    add r1, sp, #0x0
    ldr r0, [r0, #0x0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1c]
    blx r2
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {pc}
.L_02210410: .word data_021052fc
.size func_ov063_022103dc, . - func_ov063_022103dc
