.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern data_021052fc

.global func_ov072_022107f8
func_ov072_022107f8:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02210814
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldmia sp!, {r3, pc}
.L_02210814: .word data_021052fc
.size func_ov072_022107f8, . - func_ov072_022107f8
