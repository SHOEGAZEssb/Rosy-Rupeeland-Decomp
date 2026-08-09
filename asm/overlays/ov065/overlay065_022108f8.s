.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern data_021052fc

.global func_ov065_022108f8
func_ov065_022108f8:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02210918
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02210918: .word data_021052fc
.size func_ov065_022108f8, . - func_ov065_022108f8
