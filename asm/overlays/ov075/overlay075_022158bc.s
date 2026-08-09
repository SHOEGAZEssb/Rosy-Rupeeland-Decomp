.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_ov075_02215930

.global func_ov075_022158bc
func_ov075_022158bc:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x2a4]
    cmp r1, #0x0
    ldmneia sp!, {r3, pc}
    mov r1, #0x1
    str r1, [r0, #0x2a4]
    ldr r2, [r0, #0x1c]
    mov r1, #0x7
    mov r2, r2, asr #0x10
    sub r2, r2, #0x1
    str r2, [r0, #0x2a8]
    add r2, r2, #0x2
    str r2, [r0, #0x2b0]
    ldr r2, [r0, #0x20]
    mov r2, r2, asr #0x10
    sub r2, r2, #0x1
    str r2, [r0, #0x2ac]
    add r2, r2, #0x1
    str r2, [r0, #0x2b4]
    bl func_ov075_02215930
    ldmia sp!, {r3, pc}
.size func_ov075_022158bc, . - func_ov075_022158bc
