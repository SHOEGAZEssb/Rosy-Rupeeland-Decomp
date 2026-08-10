; Matching retail form; see src/game/actor_extended_type2_proximity_callback.c.
.text
.extern data_020df9e8
.extern ActorExtendedType2_IsDirectionToActorAccepted
.global ActorExtendedType2_DispatchProximityCallback
.type ActorExtendedType2_DispatchProximityCallback, @function
ActorExtendedType2_DispatchProximityCallback: ; 0x02040284
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    ldrh r3, [r4, #0x1e]
    mov r5, r1
    mov r2, r5
    mov r1, r3, lsl #0x1e
    mov r1, r1, lsr #0x1e
    mov r6, r0
    bl ActorExtendedType2_IsDirectionToActorAccepted
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xd0]
    tst r0, #0x100
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, [r6, #0x20]
    ldr r1, [r5, #0x20]
    ldrsh r0, [r4, #0xa]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r3, [r6, #0x1c]
    ldr r2, [r5, #0x1c]
    smulbb r0, r0, r0
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, r0
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r0, r6
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0xdc]
    blx r2
    ldr r1, .L_02040330
    mov r0, #0x1
    ldr r2, [r1, #0x10]
    ldr r1, [r1, #0x14]
    str r2, [r6, #0x220]
    str r1, [r6, #0x224]
    ldmia sp!, {r4, r5, r6, pc}
.L_02040330: .word data_020df9e8
.size ActorExtendedType2_DispatchProximityCallback, . - ActorExtendedType2_DispatchProximityCallback

