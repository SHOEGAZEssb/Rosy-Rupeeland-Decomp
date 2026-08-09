.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_TestFlag
.extern data_020c9670
.extern func_0209189c
.extern func_020948e4
.extern func_02094dd4
.extern func_020ae024
.extern func_ov094_02217bc8
.extern func_ov094_02218470
.extern func_ov094_022185a4
.extern gGameWork

.global func_ov094_0221807c
func_ov094_0221807c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0xc8]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_0221844c
.L_02218094:
    b .L_022180ac
    b .L_02218220
    b .L_0221829c
    b .L_022182cc
    b .L_02218424
    b .L_02218444
.L_022180ac:
    bl func_ov094_02218470
    ldr r0, .L_02218464
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02218190
    ldr r0, [r4, #0xa0]
    cmp r0, #0x2
    bne .L_022180ec
    ldrh r1, [r4, #0x98]
    mov r0, #0x3
    orr r1, r1, #0x2
    strh r1, [r4, #0x98]
    str r0, [r4, #0xc8]
    b .L_0221844c
.L_022180ec:
    ldr r0, [r4, #0xbc]
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
    ldr r0, .L_02218468
    mov r1, r5, lsl #0x1
    ldrsh r1, [r0, r1]
    ldr r2, [r4, #0xa4]
    mov r0, #0x60
    smlabb r2, r1, r0, r2
    add r0, r4, #0xc
    mov r1, #0x4
    bl func_020948e4
    add r1, r5, #0x1
    ldr r0, .L_02218468
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    ldr r2, [r4, #0xa8]
    mov r0, #0x60
    smlabb r2, r1, r0, r2
    add r0, r4, #0x1c
    mov r1, #0x4
    bl func_020948e4
    mov r0, #0x14
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xc8]
    add r0, r0, #0x1
    str r0, [r4, #0xc8]
    b .L_0221844c
.L_02218190:
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_0221844c
    ldrh r2, [r4, #0x98]
    add r0, r4, #0xac
    mvn r1, #0xf
    orr r2, r2, #0x1
    strh r2, [r4, #0x98]
    mov r2, #0x10
    bl func_0209189c
    ldr r1, [r4, #0xbc]
    ldr r3, [r4, #0xa4]
    ldr r2, [r1, #0x0]
    mov r1, #0x2
    add r2, r3, r2
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0xc
    bl func_020948e4
    add r0, r4, #0xac
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    ldr r1, [r4, #0xbc]
    ldr r3, [r4, #0xa8]
    ldr r2, [r1, #0x4]
    mov r1, #0x2
    add r2, r3, r2
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0x1c
    bl func_020948e4
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    b .L_0221844c
.L_02218220:
    bl func_ov094_02218470
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_0221844c
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x100
    bl func_020948e4
    ldr r0, [r4, #0xbc]
    ldr r2, [r4, #0xa4]
    ldr r1, [r0, #0x0]
    add r0, r4, #0xc
    add r2, r2, r1
    mov r1, #0x5
    bl func_020948e4
    ldr r0, [r4, #0xbc]
    ldr r2, [r4, #0xa8]
    ldr r1, [r0, #0x4]
    add r0, r4, #0x1c
    add r2, r2, r1
    mov r1, #0x5
    bl func_020948e4
    mov r0, #0x14
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xc8]
    add r0, r0, #0x1
    str r0, [r4, #0xc8]
    b .L_0221844c
.L_0221829c:
    bl func_ov094_02218470
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_0221844c
    ldrh r0, [r4, #0x98]
    orr r0, r0, #0x2
    strh r0, [r4, #0x98]
    ldr r0, [r4, #0xc8]
    add r0, r0, #0x1
    str r0, [r4, #0xc8]
    b .L_0221844c
.L_022182cc:
    bl func_ov094_02218470
    ldr r0, .L_02218464
    ldr r1, .L_0221846c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02218394
    ldr r0, [r4, #0xbc]
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
    mov r5, r0, lsr #0x10
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x10
    bl func_020948e4
    mov r0, r5, asr #0x4
    mov r5, r0, lsl #0x1
    ldr r0, .L_02218468
    mov r1, r5, lsl #0x1
    ldrsh r1, [r0, r1]
    ldr r2, [r4, #0xa4]
    add r0, r4, #0xc
    add r2, r2, r1, lsl #0x7
    mov r1, #0x4
    bl func_020948e4
    add r1, r5, #0x1
    ldr r0, .L_02218468
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    ldr r2, [r4, #0xa8]
    add r0, r4, #0x1c
    add r2, r2, r1, lsl #0x7
    mov r1, #0x4
    bl func_020948e4
    mov r0, #0x28
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xc8]
    add r0, r0, #0x1
    str r0, [r4, #0xc8]
    b .L_0221844c
.L_02218394:
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_0221844c
    ldr r0, [r4, #0xa0]
    cmp r0, #0x2
    bne .L_0221844c
    add r0, r4, #0xac
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    ldr r1, [r4, #0xbc]
    ldr r3, [r4, #0xa4]
    ldr r2, [r1, #0x0]
    mov r1, #0x2
    add r2, r3, r2
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0xc
    bl func_020948e4
    add r0, r4, #0xac
    mvn r1, #0xf
    mov r2, #0x10
    bl func_0209189c
    ldr r1, [r4, #0xbc]
    ldr r3, [r4, #0xa8]
    ldr r2, [r1, #0x4]
    mov r1, #0x2
    add r2, r3, r2
    add r2, r2, r0, lsl #0xc
    add r0, r4, #0x1c
    bl func_020948e4
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    b .L_0221844c
.L_02218424:
    bl func_ov094_02218470
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    ldrne r0, [r4, #0xc8]
    addne r0, r0, #0x1
    strne r0, [r4, #0xc8]
    b .L_0221844c
.L_02218444:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0221844c:
    mov r0, r4
    bl func_02094dd4
    mov r0, r4
    bl func_ov094_022185a4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02218464: .word gGameWork
.L_02218468: .word data_020c9670
.L_0221846c: .word 0x3d5
.size func_ov094_0221807c, . - func_ov094_0221807c
