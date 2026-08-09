.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_021052fc

.global func_ov081_02214dc8
func_ov081_02214dc8:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02214df0
    ldr r3, [r0, #0x0]
    ldr r1, [r1, #0x0]
    ldr r3, [r3, #0xd0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    mov r2, #0x12c
    blx r3
    ldmia sp!, {r3, pc}
.L_02214df0: .word data_021052fc
.size func_ov081_02214dc8, . - func_ov081_02214dc8
