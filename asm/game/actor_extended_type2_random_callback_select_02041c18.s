; Matching retail form; see src/game/actor_extended_type2_random_callback_select.c.
.text
.extern data_020df9e8
.extern VecFx32Object_Assign
.extern ActorExtendedType2_PlayDescriptorSoundIfEnabled
.extern InteractionWaypointCursor_GetCurrentDurationFrames
.extern func_020ada8c
.extern genrand_int32
.global ActorExtendedType2_CancelTargetState
.type ActorExtendedType2_CancelTargetState, @function
ActorExtendedType2_CancelTargetState: ; 0x02041c18
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x1
    str r1, [r4, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    add r1, r4, #0x200
    mov r0, #0x0
    strh r0, [r1, #0x54]
    ldmia sp!, {r4, pc}
.size ActorExtendedType2_CancelTargetState, . - ActorExtendedType2_CancelTargetState

.global ActorExtendedType2_SelectRandomDescriptorCallback
.type ActorExtendedType2_SelectRandomDescriptorCallback, @function
ActorExtendedType2_SelectRandomDescriptorCallback: ; 0x02041c48
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    mov r5, r0
    ldr r0, [r5, #0x26c]
    mov r4, r1
    cmp r0, #0x0
    beq .L_02041cb8
    add r1, r5, #0x200
    ldrh r1, [r1, #0x6a]
    cmp r1, #0x0
    bne .L_02041cb8
    bl InteractionWaypointCursor_GetCurrentDurationFrames
    add r1, r5, #0x200
    strh r0, [r1, #0x6a]
    ldrsh r0, [r1, #0x80]
    cmp r0, #0x0
    bne .L_02041cb8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x138]
    blx r1
    mov r0, r5
    bl ActorExtendedType2_PlayDescriptorSoundIfEnabled
    ldr r0, .L_02041e14
    ldr r1, [r0, #0xf8]
    ldr r0, [r0, #0xfc]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
.L_02041cb8:
    add r0, r5, #0x78
    add r1, r5, #0x18
    bl VecFx32Object_Assign
    ldrh r2, [r4, #0x18]
    mov r4, #0x0
    tst r2, #0x1
    movne r0, #0x1
    strne r0, [sp, #0x0]
    addne r4, r4, #0x1
    tst r2, #0x1e
    addne r0, sp, #0x0
    movne r1, #0x1e
    strne r1, [r0, r4, lsl #0x2]
    addne r4, r4, #0x1
    tst r2, #0x20
    addne r0, sp, #0x0
    movne r1, #0x20
    strne r1, [r0, r4, lsl #0x2]
    ldr r0, [r5, #0x260]
    addne r4, r4, #0x1
    tst r0, #0x400000
    bne .L_02041d24
    tst r2, #0x100
    addne r0, sp, #0x0
    movne r1, #0x100
    strne r1, [r0, r4, lsl #0x2]
    addne r4, r4, #0x1
.L_02041d24:
    bl genrand_int32
    mov r1, r4
    bic r0, r0, #0x80000000
    bl func_020ada8c
    add r1, sp, #0x0
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1e
    bgt .L_02041d64
    bge .L_02041da8
    cmp r0, #0x1
    bgt .L_02041df0
    cmp r0, #0x0
    blt .L_02041df0
    cmpne r0, #0x1
    beq .L_02041d90
    b .L_02041df0
.L_02041d64:
    cmp r0, #0x20
    bgt .L_02041d74
    beq .L_02041dc8
    b .L_02041df0
.L_02041d74:
    cmp r0, #0x100
    ldreq r0, .L_02041e14
    ldreq r1, [r0, #0x220]
    ldreq r0, [r0, #0x224]
    streq r1, [r5, #0x220]
    streq r0, [r5, #0x224]
    b .L_02041df0
.L_02041d90:
    ldr r0, .L_02041e14
    ldr r1, [r0, #0x238]
    ldr r0, [r0, #0x23c]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_02041df0
.L_02041da8:
    mov r0, r5
    bl ActorExtendedType2_PlayDescriptorSoundIfEnabled
    ldr r0, .L_02041e14
    ldr r1, [r0, #0x230]
    ldr r0, [r0, #0x234]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_02041df0
.L_02041dc8:
    mov r0, r5
    add r1, r5, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x56]
    bl ActorExtendedType2_PlayDescriptorSoundIfEnabled
    ldr r0, .L_02041e14
    ldr r1, [r0, #0x228]
    ldr r0, [r0, #0x22c]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
.L_02041df0:
    add r1, r5, #0x200
    mov r0, #0x0
    strh r0, [r1, #0x5a]
    strh r0, [r1, #0x56]
    ldr r1, [r5, #0x260]
    bic r1, r1, #0x400000
    str r1, [r5, #0x260]
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
.L_02041e14: .word data_020df9e8
.size ActorExtendedType2_SelectRandomDescriptorCallback, . - ActorExtendedType2_SelectRandomDescriptorCallback
