.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_020050a4
.extern func_02033828
.extern func_ov085_02213204

.global func_ov085_022131b4
func_ov085_022131b4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x18
    add r1, r4, #0x214
    bl func_020050a4
    mov r0, r4
    bl func_02033828
    mov r1, #0x0
    ldr r0, [r4, #0x1dc]
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x24]
    add r0, r4, #0x38
    bl func_ov085_02213204
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov085_02213204
    ldmia sp!, {r4, pc}
.size func_ov085_022131b4, . - func_ov085_022131b4
