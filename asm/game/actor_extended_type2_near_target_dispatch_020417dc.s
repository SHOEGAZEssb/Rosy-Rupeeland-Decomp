; Matching retail form; see src/game/actor_extended_type2_near_target_dispatch.c.
.text
.extern data_020df9e8
.global ActorExtendedType2_DispatchNearTargetState
.type ActorExtendedType2_DispatchNearTargetState, @function
ActorExtendedType2_DispatchNearTargetState: ; 0x020417dc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r5, r0
    ldr r2, [r2, #0x38]
    mov r4, r1
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x134]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x260]
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r5, #0x260]
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02041854
    ldr r0, .L_02041948
    ldr r1, [r0, #0x268]
    ldr r0, [r0, #0x26c]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_02041940
.L_02041854:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x11c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x124]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x12c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x130]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x234]
    ldr r2, [r5, #0x1c]
    sub r0, r1, r0
    mov r1, r0, asr #0xc
    mul r0, r1, r1
    ldr r1, [r5, #0x230]
    sub r1, r2, r1
    mov r1, r1, asr #0xc
    mla r0, r1, r1, r0
    cmp r0, #0x24
    bge .L_0204192c
    ldr r0, .L_02041948
    ldr r2, [r0, #0x260]
    ldr r1, [r0, #0x264]
    str r2, [r5, #0x218]
    str r1, [r5, #0x21c]
    ldr r1, [r0, #0x258]
    ldr r0, [r0, #0x25c]
    str r1, [r5, #0x220]
    str r0, [r5, #0x224]
    b .L_02041940
.L_0204192c:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x22c
    ldr r2, [r2, #0xd0]
    blx r2
.L_02041940:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02041948: .word data_020df9e8
.size ActorExtendedType2_DispatchNearTargetState, . - ActorExtendedType2_DispatchNearTargetState
