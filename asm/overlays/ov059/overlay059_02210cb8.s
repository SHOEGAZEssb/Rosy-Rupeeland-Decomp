.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210114

.global func_ov059_02210cb8
func_ov059_02210cb8:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldmltia sp!, {r3, pc}
    ldr r2, [r0, #0x8]
    ldrsh r2, [r2, #0x0]
    cmp r1, r2
    ldmgeia sp!, {r3, pc}
    mov r2, #0x70
    mul r2, r1, r2
    ldr r1, [r0, #0x0]
    ldr r0, [r1, r2]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r0, r1, r2
    bl func_ov059_02210114
    ldmia sp!, {r3, pc}
.size func_ov059_02210cb8, . - func_ov059_02210cb8
