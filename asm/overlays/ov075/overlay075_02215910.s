.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_ov075_02215930

.global func_ov075_02215910
func_ov075_02215910:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x2a4]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, #0x0
    str r1, [r0, #0x2a4]
    bl func_ov075_02215930
    ldmia sp!, {r3, pc}
.size func_ov075_02215910, . - func_ov075_02215910
