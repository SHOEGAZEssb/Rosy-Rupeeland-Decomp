.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern TouchRegion_Init
.extern data_ov059_02211b5c

.global func_ov059_02210554
func_ov059_02210554:
    stmdb sp!, {r4, lr}
    mov r3, #0x1
    mov r4, r0
    bl TouchRegion_Init
    ldr r1, .L_02210574
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02210574: .word data_ov059_02211b5c
.size func_ov059_02210554, . - func_ov059_02210554
