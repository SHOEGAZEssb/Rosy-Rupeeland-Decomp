.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern gGamePhaseRuntime
.extern data_ov081_02215370
.extern func_ov081_02213710

.global func_ov081_022150b0
func_ov081_022150b0:
    stmdb sp!, {r3, lr}
    mov r2, #0x0
    str r2, [r0, #0xcc]
    str r2, [r0, #0xc8]
    strb r2, [r0, #0xd5]
    strb r2, [r0, #0xd4]
    add r1, r0, #0x100
    strh r2, [r1, #0xea]
    ldr r1, [r0, #0x54]
    ldrb r1, [r1, #0x38]
    cmp r1, #0x1a
    beq .L_02215104
    ldr r1, .L_02215118
    ldr r3, [r0, #0x0]
    ldr r1, [r1, #0x0]
    ldr r3, [r3, #0xd0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    mov r2, #0x12c
    blx r3
    ldmia sp!, {r3, pc}
.L_02215104:
    ldr r1, .L_0221511c
    mov r3, #0x12c
    ldmia r1, {r1, r2}
    bl func_ov081_02213710
    ldmia sp!, {r3, pc}
.L_02215118: .word gGamePhaseRuntime
.L_0221511c: .word data_ov081_02215370
.size func_ov081_022150b0, . - func_ov081_022150b0
