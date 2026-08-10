; Matching retail form; see src/game/actor_extended_type2_target_transform_dispatch.c.
.text
.extern data_020df9e8
.global ActorExtendedType2_DispatchTargetTransform
.type ActorExtendedType2_DispatchTargetTransform, @function
ActorExtendedType2_DispatchTargetTransform: ; 0x0204194c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    bic r1, r2, #0x1
    str r1, [r5, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x7
    strneb r0, [r5, #0x24c]
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_020419a8
    ldr r0, .L_02041ae8
    ldr r1, [r0, #0x250]
    ldr r0, [r0, #0x254]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_02041ae0
.L_020419a8:
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
    ldr r2, [r2, #0x130]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x7
    strb r0, [r5, #0x24c]
    ldr r1, [r5, #0x228]
    ldr r3, [r5, #0x20]
    ldrb r0, [r1, #0x4d]
    ldr r2, [r1, #0x20]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02041a8c
    sub r2, r3, r2
    mov r3, r2, asr #0xc
    mul r2, r3, r3
    ldrsh r0, [r4, #0xe]
    ldr r4, [r5, #0x1c]
    ldr r3, [r1, #0x1c]
    smulbb r0, r0, r0
    sub r3, r4, r3
    mov r3, r3, asr #0xc
    mla r2, r3, r3, r2
    cmp r2, r0
    mov r0, r5
    ble .L_02041a78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02041ae0
.L_02041a78:
    ldr r2, [r0, #0x0]
    add r1, r1, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    b .L_02041ae0
.L_02041a8c:
    sub r2, r3, r2
    mov r3, r2, asr #0xc
    mul r2, r3, r3
    ldrsh r0, [r4, #0xe]
    ldr r4, [r5, #0x1c]
    ldr r3, [r1, #0x1c]
    smulbb r0, r0, r0
    sub r3, r4, r3
    mov r3, r3, asr #0xc
    mla r2, r3, r3, r2
    cmp r2, r0
    mov r0, r5
    ble .L_02041ad0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_02041ae0
.L_02041ad0:
    ldr r2, [r0, #0x0]
    add r1, r1, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
.L_02041ae0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02041ae8: .word data_020df9e8
.size ActorExtendedType2_DispatchTargetTransform, . - ActorExtendedType2_DispatchTargetTransform
