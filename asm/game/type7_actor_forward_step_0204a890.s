; Matching retail form; see src/game/type7_actor_forward_step.c.
.extern Actor_SaveAndForceFlags
.extern Actor_QueryTerrainHeight
.extern func_02034d34
.extern func_020adae4
.extern func_020adc90
.text
    .global Type7Actor_TryStartForwardStepTransition
.type Type7Actor_TryStartForwardStepTransition, @function
Type7Actor_TryStartForwardStepTransition: ; 0x0204a890
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    ldr r1, [r6, #0x24]
    ldr r0, [r6, #0x1dc]
    cmp r1, r0
    bne .L_0204a980
    ldrb r1, [r6, #0x4a]
    ldrb r0, [r6, #0x4b]
    orr r0, r1, r0
    tst r0, #0xf
    ldrne r1, [r6, #0x240]
    cmpne r1, #0x0
    beq .L_0204a980
    mov r0, #0x11000
    bl func_020adc90
    mov r5, r0, asr #0xc
    ldr r3, [r6, #0x1c]
    ldr r2, [r6, #0x3c]
    ldr r1, [r6, #0x20]
    ldr r0, [r6, #0x40]
    mla r4, r2, r5, r3
    mla r7, r0, r5, r1
    mov r0, r6
    mov r1, r4, asr #0x10
    mov r2, r7, asr #0x10
    bl Actor_QueryTerrainHeight
    ldr r1, [r6, #0x1dc]
    mov r8, r0, lsl #0x10
    add r1, r1, #0x10000
    cmp r1, r0, lsl #0x10
    bne .L_0204a980
    mov r0, r6
    mov r1, r4
    mov r2, r7
    mov r3, r8
    bl func_02034d34
    cmp r0, #0x0
    beq .L_0204a980
    str r4, [r6, #0xb4]
    str r7, [r6, #0xb8]
    mov r0, r6
    str r8, [r6, #0xbc]
    bl Actor_SaveAndForceFlags
    mov r0, #0x0
    strh r0, [r6, #0xac]
    mov r1, #0x18
    strh r1, [r6, #0xae]
    ldr r2, [r6, #0x3c]
    mul r0, r2, r5
    bl func_020adae4
    str r0, [r6, #0xc0]
    ldr r2, [r6, #0x40]
    mov r1, #0x18
    mul r0, r2, r5
    bl func_020adae4
    str r0, [r6, #0xc4]
    mov r0, #0x0
    str r0, [r6, #0x44]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0204a980:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size Type7Actor_TryStartForwardStepTransition, . - Type7Actor_TryStartForwardStepTransition
