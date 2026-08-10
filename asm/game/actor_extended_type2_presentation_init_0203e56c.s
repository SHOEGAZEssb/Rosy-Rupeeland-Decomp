; Matching retail form; see src/game/actor_extended_type2_presentation_init.c.
.text
.extern Heap_Alloc
.extern data_020e00c0
.extern data_020e7570
.extern data_020e78f4
.extern data_020e7c78
.extern data_020e7ffc
.extern data_020e8394
.extern func_02005580
.extern ActorCollection_GetSpriteOwner
.extern func_020313b4
.extern Actor_GetCollection
.extern func_02072b68
.extern func_02073fc4
.extern genrand_int32
.extern gHeapContext
    .global ActorExtendedType2_InitializePresentation
    .type ActorExtendedType2_InitializePresentation, @function
ActorExtendedType2_InitializePresentation: ; 0x0203e56c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrh r4, [r7, #0x4e]
    mov r6, r1
    ldr r5, .L_0203e7ac
    add r8, r4, r4, lsl #0x1
    ldr r1, .L_0203e7b0
    ldr r3, .L_0203e7b4
    mov r0, #0x10
    mov r2, #0x4
    add r5, r5, r8, lsl #0x1
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203e5b8
    ldrh r1, [r5, #0x0]
    ldrh r2, [r5, #0x2]
    ldrh r3, [r5, #0x4]
    bl func_02005580
.L_0203e5b8:
    ldr r5, .L_0203e7b8
    str r0, [r7, #0x208]
    ldr r1, .L_0203e7b0
    ldr r3, .L_0203e7b4
    mov r0, #0x10
    mov r2, #0x4
    add r5, r5, r8, lsl #0x1
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203e5f0
    ldrh r1, [r5, #0x0]
    ldrh r2, [r5, #0x2]
    ldrh r3, [r5, #0x4]
    bl func_02005580
.L_0203e5f0:
    mov r1, #0x6
    mul r5, r4, r1
    ldr r1, .L_0203e7bc
    str r0, [r7, #0x20c]
    ldrh r0, [r1, r5]
    add r4, r1, r5
    cmp r0, #0x0
    beq .L_0203e644
    ldr r1, .L_0203e7b0
    ldr r3, .L_0203e7b4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203e63c
    ldrh r1, [r4, #0x0]
    ldrh r2, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    bl func_02005580
.L_0203e63c:
    str r0, [r7, #0x210]
    b .L_0203e64c
.L_0203e644:
    mov r0, #0x0
    str r0, [r7, #0x210]
.L_0203e64c:
    ldr r1, .L_0203e7c0
    ldrh r0, [r1, r5]
    add r4, r1, r5
    cmp r0, #0x0
    beq .L_0203e694
    ldr r1, .L_0203e7b0
    ldr r3, .L_0203e7b4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203e68c
    ldrh r1, [r4, #0x0]
    ldrh r2, [r4, #0x2]
    ldrh r3, [r4, #0x4]
    bl func_02005580
.L_0203e68c:
    str r0, [r7, #0x214]
    b .L_0203e69c
.L_0203e694:
    mov r0, #0x0
    str r0, [r7, #0x214]
.L_0203e69c:
    mov r0, r7
    ldr r4, [r7, #0x208]
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r4, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r7, #0x54]
    ldrh r0, [r7, #0x4e]
    cmp r0, #0x30
    bne .L_0203e710
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    add r0, r2, #0x1000
    mov r0, r0, lsl #0x10
    str r2, [r7, #0xcc]
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0xd
    str r2, [r7, #0xc8]
    and r0, r1, #0xff
    strb r1, [r7, #0xd5]
    add r1, r0, #0x8
    strb r0, [r7, #0xd4]
    ldr r0, [r7, #0x54]
    and r1, r1, #0xff
    bl func_02072b68
    b .L_0203e71c
.L_0203e710:
    ldr r0, [r7, #0x54]
    mov r1, #0x8
    bl func_02072b68
.L_0203e71c:
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldrb r2, [r6, #0x10]
    ldr r1, [r7, #0x208]
    mov r0, r7
    bl func_020313b4
    ldr r0, [r7, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r6, #0x3c]
    ldrne r0, [r7, #0x54]
    strneb r1, [r0, #0x3a]
    add r0, r7, #0x200
    ldrh r1, [r0, #0x72]
    tst r1, #0x1800
    bne .L_0203e76c
    ldrsh r1, [r0, #0x50]
    cmp r1, #0x0
    bne .L_0203e79c
.L_0203e76c:
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xfc]
    blx r1
    ldrh r2, [r7, #0x4e]
    mov r0, #0x30
    ldr r1, .L_0203e7c4
    mul r0, r2, r0
    ldrh r1, [r1, r0]
    add r0, r7, #0x200
    strh r1, [r0, #0x4e]
    b .L_0203e7a4
.L_0203e79c:
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x50]
.L_0203e7a4:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0203e7ac: .word data_020e78f4
.L_0203e7b0: .word data_020e00c0
.L_0203e7b4: .word gHeapContext
.L_0203e7b8: .word data_020e7c78
.L_0203e7bc: .word data_020e7570
.L_0203e7c0: .word data_020e7ffc
.L_0203e7c4: .word data_020e8394
    .size ActorExtendedType2_InitializePresentation, . - ActorExtendedType2_InitializePresentation

