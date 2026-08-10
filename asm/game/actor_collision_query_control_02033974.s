; Matching retail form; see src/game/actor_collision_query_control.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_02011738
.extern BoundsCenterSnapshot_Init
.extern func_020573e4
.extern func_0205740c

    .global Actor_TestQueryPoint
    .type Actor_TestQueryPoint, @function
Actor_TestQueryPoint: ; 0x02033974
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldrsh r4, [r6, #0x60]
    mov r5, r1
    add r0, sp, #0x10
    strh r4, [sp, #0x10]
    ldrsh r8, [r6, #0x62]
    strh r8, [sp, #0x12]
    ldrsh r7, [r6, #0x64]
    strh r7, [sp, #0x14]
    ldrsh lr, [r6, #0x66]
    strh lr, [sp, #0x16]
    ldr r2, [r6, #0x24]
    ldr r3, [r6, #0x20]
    ldr r1, [r6, #0x1c]
    mov r2, r2, asr #0xc
    rsb ip, r2, r3, asr #0xc
    add r4, r4, r1, asr #0xc
    add r2, r7, r1, asr #0xc
    add r3, r8, ip
    add r1, lr, ip
    strh r4, [sp, #0x10]
    strh r3, [sp, #0x12]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x16]
    ldmib r5, {r1, r2}
    bl func_02011738
    mov r4, r0
    ldr r0, [r6, #0x1e0]
    cmp r0, #0x0
    beq .L_02033a60
    bl func_020573e4
    cmp r0, #0x0
    beq .L_02033a60
    add r0, sp, #0x8
    add r1, r6, #0x8
    bl BoundsCenterSnapshot_Init
    ldrsb r0, [sp, #0xd]
    ldr r1, [r6, #0x20]
    ldrsb ip, [sp, #0xc]
    add r3, r1, r0, lsl #0xc
    ldr lr, [r6, #0x1c]
    ldr r2, [r6, #0x24]
    add r0, sp, #0x18
    sub r2, r3, r2
    add r1, lr, ip, lsl #0xc
    mov r3, #0x0
    bl func_0200500c
    ldr r1, [r6, #0x1e0]
    add r0, sp, #0x0
    add r2, sp, #0x18
    bl func_0205740c
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x0
    ldmib r5, {r1, r2}
    bl func_02011738
    orr r4, r4, r0
.L_02033a60:
    mov r0, r4
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size Actor_TestQueryPoint, . - Actor_TestQueryPoint

    .global func_02033a6c
