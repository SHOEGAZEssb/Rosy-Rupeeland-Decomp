; Matching retail form; see src/game/actor_extended_type2_target_approach.c.
.text
.extern data_020df9e8
.extern data_021052fc
.extern func_02005030
.extern func_02005058
.extern func_02007f0c
.global ActorExtendedType2_UpdateTargetApproach
.type ActorExtendedType2_UpdateTargetApproach, @function
ActorExtendedType2_UpdateTargetApproach: ; 0x020412a8
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r2, [r6, #0x260]
    mov r4, r1
    orr r1, r2, #0x3
    str r1, [r6, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02041414
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02041300
    ldr r0, .L_0204141c
    ldr r1, [r0, #0x290]
    ldr r0, [r0, #0x294]
    str r1, [r6, #0x218]
    str r0, [r6, #0x21c]
    b .L_02041410
.L_02041300:
    ldr r0, .L_02041420
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    mov r0, r6
    bne .L_02041404
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x11c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02041414
    add r0, r6, #0x200
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_020413f8
    ldr ip, [r6, #0x228]
    ldrsh r0, [r4, #0xa]
    ldr r3, [r6, #0x20]
    ldr r1, [ip, #0x20]
    add r2, r0, #0x20
    sub r0, r3, r1
    mov r5, r0, asr #0xc
    mul r1, r5, r5
    ldr r4, [r6, #0x1c]
    ldr r3, [ip, #0x1c]
    mul r0, r2, r2
    sub r2, r4, r3
    mov r4, r2, asr #0xc
    mla r1, r4, r4, r1
    cmp r1, r0
    bge .L_020413e4
    add r0, sp, #0x0
    add r1, r6, #0x18
    bl func_02005030
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    add r0, r0, r5, lsl #0xc
    add r1, r1, r4, lsl #0xc
    str r0, [sp, #0x8]
    str r1, [sp, #0x4]
    ldr r1, [r6, #0xd0]
    mov r0, r6
    orr r1, r1, #0x2
    str r1, [r6, #0xd0]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl func_02005058
    b .L_02041410
.L_020413e4:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02041410
.L_020413f8:
    sub r1, r1, #0x1
    strh r1, [r0, #0x5a]
    b .L_02041410
.L_02041404:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_02041410:
    mov r0, #0x0
.L_02041414:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0204141c: .word data_020df9e8
.L_02041420: .word data_021052fc
.size ActorExtendedType2_UpdateTargetApproach, . - ActorExtendedType2_UpdateTargetApproach
