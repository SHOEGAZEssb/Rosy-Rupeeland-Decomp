.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_021052fc
.extern func_ov063_02210380

.global func_ov063_02210348
func_ov063_02210348:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_ov063_02210380
    ldr r0, .L_0221037c
    add r1, sp, #0x0
    ldr r0, [r0, #0x0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x14]
    blx r2
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {pc}
.L_0221037c: .word data_021052fc
.size func_ov063_02210348, . - func_ov063_02210348
