; Matching retail form; see src/game/actor_runtime_query_dispatch.c.
.text
.extern func_02005030
.extern func_02005058
.extern VecFx32Stepper_GetStep
.extern ActorBounds_GetWidth
.extern ActorBounds_GetHeight

    .global Actor_QueryRuntimeProperty
    .type Actor_QueryRuntimeProperty, @function
Actor_QueryRuntimeProperty: ; 0x02032e14
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r2, r0
    cmp r1, #0x2e
    addls pc, pc, r1, lsl #0x2
    b .L_020330f0
.L_02032e2c: ; jump table
    b .L_02032ee8 ; case 0
    b .L_02032ef4 ; case 1
    b .L_02032f00 ; case 2
    b .L_02032f0c ; case 3
    b .L_02032f18 ; case 4
    b .L_02032f20 ; case 5
    b .L_02032f2c ; case 6
    b .L_02032f40 ; case 7
    b .L_02032f64 ; case 8
    b .L_02032f88 ; case 9
    b .L_02032fac ; case 10
    b .L_020330f0 ; case 11
    b .L_020330f0 ; case 12
    b .L_02032fb8 ; case 13
    b .L_02032fd8 ; case 14
    b .L_02032fec ; case 15
    b .L_0203300c ; case 16
    b .L_02033018 ; case 17
    b .L_020330f0 ; case 18
    b .L_02033020 ; case 19
    b .L_0203302c ; case 20
    b .L_02033038 ; case 21
    b .L_02033044 ; case 22
    b .L_020330f0 ; case 23
    b .L_02033050 ; case 24
    b .L_0203305c ; case 25
    b .L_020330f0 ; case 26
    b .L_0203306c ; case 27
    b .L_020330f0 ; case 28
    b .L_020330f0 ; case 29
    b .L_020330f0 ; case 30
    b .L_020330f0 ; case 31
    b .L_020330f0 ; case 32
    b .L_020330f0 ; case 33
    b .L_020330f0 ; case 34
    b .L_020330f0 ; case 35
    b .L_02033074 ; case 36
    b .L_02033084 ; case 37
    b .L_02033094 ; case 38
    b .L_020330f0 ; case 39
    b .L_020330f0 ; case 40
    b .L_020330a4 ; case 41
    b .L_020330b8 ; case 42
    b .L_020330f0 ; case 43
    b .L_020330cc ; case 44
    b .L_020330d8 ; case 45
    b .L_020330e4 ; case 46
.L_02032ee8:
    add r0, r2, #0x8
    bl ActorBounds_GetWidth
    b .L_020330f4
.L_02032ef4:
    add r0, r2, #0x8
    bl ActorBounds_GetHeight
    b .L_020330f4
.L_02032f00:
    add r0, r2, #0x4
    bl ActorBounds_GetWidth
    b .L_020330f4
.L_02032f0c:
    add r0, r2, #0x4
    bl ActorBounds_GetHeight
    b .L_020330f4
.L_02032f18:
    ldr r0, [r2, #0x1dc]
    b .L_020330f4
.L_02032f20:
    ldr r0, [r2, #0x14]
    and r0, r0, #0x10
    b .L_020330f4
.L_02032f2c:
    ldr r0, [r2, #0x10]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    b .L_020330f4
.L_02032f40:
    add r0, sp, #0x20
    add r1, r2, #0x18
    bl func_02005030
    ldr r1, [sp, #0x24]
    add r0, sp, #0x20
    mov r4, r1, asr #0xc
    bl func_02005058
    mov r0, r4
    b .L_020330f4
.L_02032f64:
    add r0, sp, #0x10
    add r1, r2, #0x18
    bl func_02005030
    ldr r1, [sp, #0x18]
    add r0, sp, #0x10
    mov r4, r1, asr #0xc
    bl func_02005058
    mov r0, r4
    b .L_020330f4
.L_02032f88:
    add r0, sp, #0x0
    add r1, r2, #0x18
    bl func_02005030
    ldr r1, [sp, #0xc]
    add r0, sp, #0x0
    mov r4, r1, asr #0xc
    bl func_02005058
    mov r0, r4
    b .L_020330f4
.L_02032fac:
    ldr r0, [r2, #0x54]
    ldrb r0, [r0, #0x38]
    b .L_020330f4
.L_02032fb8:
    ldr r0, [r2, #0x10]
    tst r0, #0x4000
    bne .L_02032fd0
    tst r0, #0x2000
    movne r0, #0x1
    bne .L_020330f4
.L_02032fd0:
    mov r0, #0x0
    b .L_020330f4
.L_02032fd8:
    ldr r0, [r2, #0x10]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    b .L_020330f4
.L_02032fec:
    ldr r0, [r2, #0x10]
    tst r0, #0x4000
    beq .L_02033004
    tst r0, #0x2000
    moveq r0, #0x1
    beq .L_020330f4
.L_02033004:
    mov r0, #0x0
    b .L_020330f4
.L_0203300c:
    ldr r0, [r2, #0x54]
    ldrb r0, [r0, #0x3a]
    b .L_020330f4
.L_02033018:
    ldr r0, [r2, #0xc8]
    b .L_020330f4
.L_02033020:
    ldr r0, [r2, #0x54]
    ldrsh r0, [r0, #0x2c]
    b .L_020330f4
.L_0203302c:
    ldr r0, [r2, #0x54]
    ldrsh r0, [r0, #0x2e]
    b .L_020330f4
.L_02033038:
    ldr r0, [r2, #0x54]
    ldrsh r0, [r0, #0x32]
    b .L_020330f4
.L_02033044:
    ldr r0, [r2, #0x54]
    ldrsh r0, [r0, #0x34]
    b .L_020330f4
.L_02033050:
    ldr r0, [r2, #0x54]
    ldrh r0, [r0, #0x28]
    b .L_020330f4
.L_0203305c:
    ldr r0, [r2, #0x5c]
    mov r0, r0, lsl #0x8
    mov r0, r0, asr #0x18
    b .L_020330f4
.L_0203306c:
    ldrsh r0, [r2, #0xe4]
    b .L_020330f4
.L_02033074:
    add r0, r2, #0x198
    bl VecFx32Stepper_GetStep
    ldr r0, [r0, #0x4]
    b .L_020330f4
.L_02033084:
    add r0, r2, #0x198
    bl VecFx32Stepper_GetStep
    ldr r0, [r0, #0x8]
    b .L_020330f4
.L_02033094:
    add r0, r2, #0x198
    bl VecFx32Stepper_GetStep
    ldr r0, [r0, #0xc]
    b .L_020330f4
.L_020330a4:
    ldr r0, [r2, #0x14]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    b .L_020330f4
.L_020330b8:
    ldr r0, [r2, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    b .L_020330f4
.L_020330cc:
    ldr r0, [r2, #0x2c]
    mov r0, r0, asr #0xc
    b .L_020330f4
.L_020330d8:
    ldr r0, [r2, #0x30]
    mov r0, r0, asr #0xc
    b .L_020330f4
.L_020330e4:
    ldr r0, [r2, #0x34]
    mov r0, r0, asr #0xc
    b .L_020330f4
.L_020330f0:
    mov r0, #0x0
.L_020330f4:
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
    .size Actor_QueryRuntimeProperty, . - Actor_QueryRuntimeProperty

    .global Actor_SetRuntimeProperty
