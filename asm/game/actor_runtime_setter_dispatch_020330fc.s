; Matching retail form; see src/game/actor_runtime_setter_dispatch.c.
.text
.extern func_020050a4
.extern ActorBounds_GetWidth
.extern ActorBounds_GetHeight
.extern ActorBounds_Copy
.extern ActorBounds_Set
.extern BoundsCenterSnapshot_Init
.extern ActorBounds_SetMinimum
.extern Actor_SetAttachmentEnabled
.extern Actor_SetAttachmentAnimation
.extern func_020adae4

    .global Actor_SetRuntimeProperty
    .type Actor_SetRuntimeProperty, @function
Actor_SetRuntimeProperty: ; 0x020330fc
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x34
    mov r5, r0
    mov r4, r2
    cmp r1, #0x32
    addls pc, pc, r1, lsl #0x2
    b .L_0203372c
.L_02033118: ; jump table
    b .L_020331e4 ; case 0
    b .L_02033270 ; case 1
    b .L_02033300 ; case 2
    b .L_0203338c ; case 3
    b .L_0203372c ; case 4
    b .L_0203341c ; case 5
    b .L_0203372c ; case 6
    b .L_020334c4 ; case 7
    b .L_020334d4 ; case 8
    b .L_020334e4 ; case 9
    b .L_02033620 ; case 10
    b .L_0203372c ; case 11
    b .L_0203372c ; case 12
    b .L_0203372c ; case 13
    b .L_0203372c ; case 14
    b .L_0203372c ; case 15
    b .L_0203372c ; case 16
    b .L_0203362c ; case 17
    b .L_02033438 ; case 18
    b .L_0203372c ; case 19
    b .L_0203372c ; case 20
    b .L_02033440 ; case 21
    b .L_02033460 ; case 22
    b .L_020334a8 ; case 23
    b .L_020334f4 ; case 24
    b .L_02033500 ; case 25
    b .L_02033520 ; case 26
    b .L_0203372c ; case 27
    b .L_02033528 ; case 28
    b .L_02033578 ; case 29
    b .L_02033594 ; case 30
    b .L_0203359c ; case 31
    b .L_020335a8 ; case 32
    b .L_020335c0 ; case 33
    b .L_020335dc ; case 34
    b .L_020335f8 ; case 35
    b .L_0203372c ; case 36
    b .L_0203372c ; case 37
    b .L_0203372c ; case 38
    b .L_02033638 ; case 39
    b .L_02033654 ; case 40
    b .L_020336b4 ; case 41
    b .L_020336d0 ; case 42
    b .L_02033480 ; case 43
    b .L_0203372c ; case 44
    b .L_0203372c ; case 45
    b .L_0203372c ; case 46
    b .L_020336e8 ; case 47
    b .L_02033670 ; case 48
    b .L_020336f8 ; case 49
    b .L_02033714 ; case 50
.L_020331e4:
    add r0, sp, #0x2c
    add r1, r5, #0x8
    bl BoundsCenterSnapshot_Init
    add r0, r5, #0x8
    bl ActorBounds_GetHeight
    mov r3, r4, lsl #0x18
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x10
    mov r2, r1
    mov r3, r3, asr #0x18
    bl ActorBounds_Set
    add r1, sp, #0x10
    add r0, r5, #0x8
    bl ActorBounds_Copy
    mov r0, r4
    mvn r1, #0x1
    bl func_020adae4
    mov r6, r0
    add r0, r5, #0x8
    bl ActorBounds_GetHeight
    mvn r1, #0x1
    bl func_020adae4
    ldrsb r2, [sp, #0x30]
    mov r4, r0
    ldrsb r1, [sp, #0x31]
    add r3, r2, r6
    add r0, r5, #0x8
    add r2, r1, r4
    mov r1, r3, lsl #0x18
    mov r2, r2, lsl #0x18
    mov r1, r1, asr #0x18
    mov r2, r2, asr #0x18
    bl ActorBounds_SetMinimum
    b .L_0203372c
.L_02033270:
    add r0, sp, #0x24
    add r1, r5, #0x8
    bl BoundsCenterSnapshot_Init
    add r0, r5, #0x8
    bl ActorBounds_GetWidth
    mov r3, r0
    mov r0, r4, lsl #0x18
    mov r2, r0, asr #0x18
    mov r1, #0x0
    str r2, [sp, #0x0]
    add r0, sp, #0xc
    mov r2, r1
    bl ActorBounds_Set
    add r1, sp, #0xc
    add r0, r5, #0x8
    bl ActorBounds_Copy
    add r0, r5, #0x8
    bl ActorBounds_GetWidth
    mvn r1, #0x1
    bl func_020adae4
    mov r6, r0
    mov r0, r4
    mvn r1, #0x1
    bl func_020adae4
    ldrsb r2, [sp, #0x28]
    mov r4, r0
    ldrsb r1, [sp, #0x29]
    add r3, r2, r6
    add r0, r5, #0x8
    add r2, r1, r4
    mov r1, r3, lsl #0x18
    mov r2, r2, lsl #0x18
    mov r1, r1, asr #0x18
    mov r2, r2, asr #0x18
    bl ActorBounds_SetMinimum
    b .L_0203372c
.L_02033300:
    add r0, sp, #0x1c
    add r1, r5, #0x4
    bl BoundsCenterSnapshot_Init
    add r0, r5, #0x4
    bl ActorBounds_GetHeight
    mov r3, r4, lsl #0x18
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x8
    mov r2, r1
    mov r3, r3, asr #0x18
    bl ActorBounds_Set
    add r1, sp, #0x8
    add r0, r5, #0x4
    bl ActorBounds_Copy
    mov r0, r4
    mvn r1, #0x1
    bl func_020adae4
    mov r6, r0
    add r0, r5, #0x4
    bl ActorBounds_GetHeight
    mvn r1, #0x1
    bl func_020adae4
    ldrsb r2, [sp, #0x20]
    mov r4, r0
    ldrsb r1, [sp, #0x21]
    add r3, r2, r6
    add r0, r5, #0x4
    add r2, r1, r4
    mov r1, r3, lsl #0x18
    mov r2, r2, lsl #0x18
    mov r1, r1, asr #0x18
    mov r2, r2, asr #0x18
    bl ActorBounds_SetMinimum
    b .L_0203372c
.L_0203338c:
    add r0, sp, #0x14
    add r1, r5, #0x4
    bl BoundsCenterSnapshot_Init
    add r0, r5, #0x4
    bl ActorBounds_GetWidth
    mov r3, r0
    mov r0, r4, lsl #0x18
    mov r2, r0, asr #0x18
    mov r1, #0x0
    str r2, [sp, #0x0]
    add r0, sp, #0x4
    mov r2, r1
    bl ActorBounds_Set
    add r1, sp, #0x4
    add r0, r5, #0x4
    bl ActorBounds_Copy
    add r0, r5, #0x4
    bl ActorBounds_GetWidth
    mvn r1, #0x1
    bl func_020adae4
    mov r6, r0
    mov r0, r4
    mvn r1, #0x1
    bl func_020adae4
    ldrsb r2, [sp, #0x18]
    mov r4, r0
    ldrsb r1, [sp, #0x19]
    add r3, r2, r6
    add r0, r5, #0x4
    add r2, r1, r4
    mov r1, r3, lsl #0x18
    mov r2, r2, lsl #0x18
    mov r1, r1, asr #0x18
    mov r2, r2, asr #0x18
    bl ActorBounds_SetMinimum
    b .L_0203372c
.L_0203341c:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x10
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x10
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_02033438:
    strb r4, [r5, #0xe7]
    b .L_0203372c
.L_02033440:
    mov r0, r4, lsl #0x10
    ldr r1, [r5, #0x54]
    mov r2, r0, asr #0x10
    strh r2, [r1, #0x32]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    strneh r2, [r0, #0x32]
    b .L_0203372c
.L_02033460:
    mov r0, r4, lsl #0x10
    ldr r1, [r5, #0x54]
    mov r2, r0, asr #0x10
    strh r2, [r1, #0x34]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    strneh r2, [r0, #0x34]
    b .L_0203372c
.L_02033480:
    mov r0, r4, lsl #0x8
    rsb r0, r0, #0x10000
    mov r0, r0, lsl #0x10
    ldr r1, [r5, #0x54]
    mov r2, r0, asr #0x10
    strh r2, [r1, #0x30]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    strneh r2, [r0, #0x30]
    b .L_0203372c
.L_020334a8:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x8000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x8000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_020334c4:
    mov r0, r4, lsl #0xc
    str r0, [r5, #0x2c]
    str r0, [r5, #0x1c]
    b .L_0203372c
.L_020334d4:
    mov r0, r4, lsl #0xc
    str r0, [r5, #0x30]
    str r0, [r5, #0x20]
    b .L_0203372c
.L_020334e4:
    mov r0, r4, lsl #0xc
    str r0, [r5, #0x34]
    str r0, [r5, #0x24]
    b .L_0203372c
.L_020334f4:
    ldr r0, [r5, #0x54]
    strh r4, [r0, #0x28]
    b .L_0203372c
.L_02033500:
    mov r0, r4, lsl #0x18
    ldr r1, [r5, #0x5c]
    mov r0, r0, asr #0x18
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r5, #0x5c]
    b .L_0203372c
.L_02033520:
    strb r4, [r5, #0x1e4]
    b .L_0203372c
.L_02033528:
    ldr r1, [r5, #0x54]
    cmp r4, #0x0
    ldrh r0, [r1, #0x24]
    beq .L_02033558
    orr r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x20
    strneh r0, [r1, #0x24]
    b .L_0203372c
.L_02033558:
    bic r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x20
    strneh r0, [r1, #0x24]
    b .L_0203372c
.L_02033578:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x100000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x100000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_02033594:
    strb r4, [r5, #0x1e7]
    b .L_0203372c
.L_0203359c:
    add r0, r5, #0x100
    strh r4, [r0, #0xe8]
    b .L_0203372c
.L_020335a8:
    ldr r2, [r0, #0x0]
    mov r1, r4, lsl #0x10
    ldr r2, [r2, #0x98]
    mov r1, r1, asr #0x10
    blx r2
    b .L_0203372c
.L_020335c0:
    ldr r0, [r5, #0x10]
    cmp r4, #0x0
    orrne r0, r0, #0x400
    strne r0, [r5, #0x10]
    biceq r0, r0, #0x400
    streq r0, [r5, #0x10]
    b .L_0203372c
.L_020335dc:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x2000000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x2000000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_020335f8:
    mov r0, r4, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    ldr r1, [r5, #0x54]
    mov r2, r0, lsr #0x10
    strh r2, [r1, #0x2a]
    ldr r0, [r5, #0x58]
    cmp r0, #0x0
    strneh r2, [r0, #0x2a]
    b .L_0203372c
.L_02033620:
    mov r1, r4
    bl Actor_SetAttachmentAnimation
    b .L_0203372c
.L_0203362c:
    str r4, [r5, #0xcc]
    str r4, [r5, #0xc8]
    b .L_0203372c
.L_02033638:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x1000000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x1000000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_02033654:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x4000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x4000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_02033670:
    ldr r1, [r5, #0x54]
    cmp r4, #0x0
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    beq .L_0203369c
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
.L_0203369c:
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_0203372c
.L_020336b4:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x2000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x2000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_020336d0:
    ldr r1, [r5, #0x54]
    cmp r1, #0x0
    beq .L_0203372c
    mov r1, r4
    bl Actor_SetAttachmentEnabled
    b .L_0203372c
.L_020336e8:
    add r0, r5, #0x18
    add r1, r5, #0x28
    bl func_020050a4
    b .L_0203372c
.L_020336f8:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x40000000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x40000000
    streq r0, [r5, #0x14]
    b .L_0203372c
.L_02033714:
    ldr r0, [r5, #0x14]
    cmp r4, #0x0
    orrne r0, r0, #0x1000
    strne r0, [r5, #0x14]
    biceq r0, r0, #0x1000
    streq r0, [r5, #0x14]
.L_0203372c:
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, r5, r6, pc}
    .size Actor_SetRuntimeProperty, . - Actor_SetRuntimeProperty

    .global func_02033734
