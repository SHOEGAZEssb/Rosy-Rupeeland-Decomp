.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern data_021052fc

.global func_ov060_02210450
func_ov060_02210450:
    stmdb sp!, {r3, lr}
    ldr r0, .L_0221046c
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldmia sp!, {r3, pc}
.L_0221046c: .word data_021052fc
.size func_ov060_02210450, . - func_ov060_02210450
