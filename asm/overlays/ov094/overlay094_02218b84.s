.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_TestFlag
.extern data_020c9670
.extern func_0209189c
.extern func_020948e4
.extern func_02094dd4
.extern func_020ae024
.extern func_ov094_02217bc8
.extern func_ov094_02218da0
.extern func_ov094_02218ed4
.extern gGameWork

.global func_ov094_02218b84
func_ov094_02218b84:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0xbc]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_02218d80
.L_02218b9c:
    b .L_02218bac
    b .L_02218cf4
    b .L_02218d58
    b .L_02218d78
.L_02218bac:
    bl func_ov094_02218da0
    ldr r0, .L_02218d98
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02218c6c
    ldr r0, [r4, #0xb0]
    ldr r3, [r0, #0x0]
    ldr r2, [r0, #0x4]
    mov r0, r3, asr #0xb
    mov r1, r2, asr #0xb
    add r0, r3, r0, lsr #0x14
    add r1, r2, r1, lsr #0x14
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl func_020ae024
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r5, r0, lsl #0x1
    ldr r0, .L_02218d9c
    mov r1, r5, lsl #0x1
    ldrsh r2, [r0, r1]
    mov r1, #0x60
    add r0, r4, #0xc
    smulbb r1, r2, r1
    add r2, r1, #0x80000
    mov r1, #0x4
    bl func_020948e4
    add r1, r5, #0x1
    ldr r0, .L_02218d9c
    mov r1, r1, lsl #0x1
    ldrsh r2, [r0, r1]
    mov r1, #0x60
    add r0, r4, #0x1c
    smulbb r1, r2, r1
    sub r2, r1, #0xa0000
    mov r1, #0x4
    bl func_020948e4
    mov r0, #0x14
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xbc]
    add r0, r0, #0x1
    str r0, [r4, #0xbc]
    b .L_02218d80
.L_02218c6c:
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_02218d80
    ldrh r2, [r4, #0x98]
    add r0, r4, #0xa0
    mvn r1, #0xf
    orr r2, r2, #0x1
    strh r2, [r4, #0x98]
    mov r2, #0x10
    bl func_0209189c
    ldr r2, [r4, #0xb0]
    mov r1, #0x2
    ldr r2, [r2, #0x0]
    add r2, r2, #0x80000
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0xc
    bl func_020948e4
    add r0, r4, #0xa0
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    ldr r2, [r4, #0xb0]
    mov r1, #0x2
    ldr r2, [r2, #0x4]
    sub r2, r2, #0xa0000
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0x1c
    bl func_020948e4
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    b .L_02218d80
.L_02218cf4:
    bl func_ov094_02218da0
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_02218d80
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x10
    bl func_020948e4
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x80000
    bl func_020948e4
    add r0, r4, #0x1c
    mov r1, #0x2
    mov r2, #0x40000
    bl func_020948e4
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xbc]
    add r0, r0, #0x1
    str r0, [r4, #0xbc]
    b .L_02218d80
.L_02218d58:
    bl func_ov094_02218da0
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    ldrne r0, [r4, #0xbc]
    addne r0, r0, #0x1
    strne r0, [r4, #0xbc]
    b .L_02218d80
.L_02218d78:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02218d80:
    mov r0, r4
    bl func_02094dd4
    mov r0, r4
    bl func_ov094_02218ed4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02218d98: .word gGameWork
.L_02218d9c: .word data_020c9670
.size func_ov094_02218b84, . - func_ov094_02218b84
