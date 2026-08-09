.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cca0
.extern func_02005058
.extern func_ov078_02212ba0

.global func_ov095_02217998
func_ov095_02217998:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022179e0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x320]
    cmp r0, #0x0
    beq .L_022179c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022179c0:
    add r0, r4, #0x2f0
    bl func_02005058
    add r0, r4, #0x2e0
    bl func_02005058
    mov r0, r4
    bl func_ov078_02212ba0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022179e0: .word data_ov095_0221cca0
.size func_ov095_02217998, . - func_ov095_02217998
