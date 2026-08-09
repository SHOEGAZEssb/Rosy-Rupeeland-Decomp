.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_021052fc

.global func_ov059_0221127c
func_ov059_0221127c:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02211298
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldmia sp!, {r3, pc}
.L_02211298: .word data_021052fc
.size func_ov059_0221127c, . - func_ov059_0221127c
