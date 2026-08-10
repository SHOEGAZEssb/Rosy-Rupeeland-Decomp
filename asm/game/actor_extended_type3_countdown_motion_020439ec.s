; Matching retail form; see src/game/actor_extended_type3_countdown_motion.c.
.text
.extern data_020e0224
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorExtendedType3_ResetInteractionState
.global ActorExtendedType3_UpdateCountdownMotion
.type ActorExtendedType3_UpdateCountdownMotion, @function
ActorExtendedType3_UpdateCountdownMotion: ; 0x020439ec
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r2, r5, #0x200
    ldrsh r3, [r2, #0x9a]
    mov r4, r1
    sub r1, r3, #0x1
    strh r1, [r2, #0x9a]
    ldrsh r1, [r2, #0x9a]
    cmp r1, #0x0
    bgt .L_02043a24
    bl ActorExtendedType3_ResetInteractionState
    mov r0, #0x0
    b .L_02043b14
.L_02043a24:
    ldr r2, [r5, #0x260]
    mov r1, #0x2
    orr r2, r2, #0x20
    str r2, [r5, #0x260]
    strb r1, [r5, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02043b14
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02043a78
    ldr r1, .L_02043b1c
    mov r0, #0x0
    ldr r2, [r1, #0x10]
    ldr r1, [r1, #0x14]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    b .L_02043b14
.L_02043a78:
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldr r3, [r5, #0x228]
    ldr r2, [r5, #0x20]
    ldr r1, [r3, #0x20]
    ldrsh r0, [r4, #0x12]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r4, [r5, #0x1c]
    ldr r3, [r3, #0x1c]
    smulbb r0, r0, r0
    sub r3, r4, r3
    mov r3, r3, asr #0xc
    mla r1, r3, r3, r1
    cmp r1, r0
    bge .L_02043adc
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r3, lsl #0xc
    add r0, r0, r2, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_02043af4
.L_02043adc:
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r3, lsl #0xc
    sub r0, r0, r2, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_02043af4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02043b14:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02043b1c: .word data_020e0224

    .global ActorExtendedType3_UpdateCountdownApproach
.size ActorExtendedType3_UpdateCountdownMotion, . - ActorExtendedType3_UpdateCountdownMotion
