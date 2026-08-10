; Matching retail form; see src/game/actor_extended_type2_random_waypoint.c.
.text
.extern data_020df9e8
.extern func_020ada8c
.extern genrand_int32
.global ActorExtendedType2_UpdateRandomWaypoint
.type ActorExtendedType2_UpdateRandomWaypoint, @function
ActorExtendedType2_UpdateRandomWaypoint: ; 0x02041e9c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    add r2, r6, #0x200
    ldrsh r3, [r2, #0x5a]
    mov r5, r1
    cmp r3, #0x0
    bne .L_02041fa0
    bl genrand_int32
    ldrh r1, [r5, #0x18]
    bic r4, r0, #0x80000000
    and r0, r1, #0x1e
    cmp r0, #0x2
    beq .L_02041ee4
    cmp r0, #0x4
    beq .L_02041f00
    cmp r0, #0x8
    beq .L_02041f1c
    b .L_02041f38
.L_02041ee4:
    mov r0, r4
    mov r1, #0x78
    bl func_020ada8c
    add r1, r0, #0x78
    add r0, r6, #0x200
    strh r1, [r0, #0x58]
    b .L_02041f50
.L_02041f00:
    mov r0, r4
    mov r1, #0xf0
    bl func_020ada8c
    add r1, r0, #0xf0
    add r0, r6, #0x200
    strh r1, [r0, #0x58]
    b .L_02041f50
.L_02041f1c:
    mov r0, r4
    mov r1, #0x78
    bl func_020ada8c
    add r1, r0, #0xb4
    add r0, r6, #0x200
    strh r1, [r0, #0x58]
    b .L_02041f50
.L_02041f38:
    mov r0, r4
    mov r1, #0x78
    bl func_020ada8c
    add r1, r0, #0x78
    add r0, r6, #0x200
    strh r1, [r0, #0x58]
.L_02041f50:
    ldrsh r1, [r5, #0x8]
    mov r4, r4, asr #0x8
    mov r0, r4
    mov r7, r1, lsl #0x1
    mov r1, r7
    bl func_020ada8c
    ldrsh r2, [r5, #0x8]
    ldr r3, [r6, #0x230]
    mov r1, r7
    sub r0, r0, r2
    add r0, r3, r0, lsl #0xc
    str r0, [r6, #0x7c]
    mov r0, r4, asr #0x8
    bl func_020ada8c
    ldrsh r1, [r5, #0x8]
    ldr r2, [r6, #0x234]
    sub r0, r0, r1
    add r0, r2, r0, lsl #0xc
    str r0, [r6, #0x80]
    b .L_02042018
.L_02041fa0:
    ldrh r1, [r2, #0x58]
    cmp r3, r1
    blt .L_02041fc4
    ldr r0, .L_02042030
    ldr r1, [r0, #0x210]
    ldr r0, [r0, #0x214]
    str r1, [r6, #0x220]
    str r0, [r6, #0x224]
    b .L_02042018
.L_02041fc4:
    ldr r2, [r6, #0x20]
    ldr r1, [r6, #0x80]
    ldr r3, [r6, #0x1c]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r2, [r6, #0x7c]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, #0x40
    ldrle r0, .L_02042030
    ldrle r1, [r0, #0x208]
    ldrle r0, [r0, #0x20c]
    strle r1, [r6, #0x220]
    strle r0, [r6, #0x224]
    ble .L_02042018
    ldr r2, [r0, #0x0]
    add r1, r6, #0x78
    ldr r2, [r2, #0xd0]
    blx r2
.L_02042018:
    add r1, r6, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02042030: .word data_020df9e8
.size ActorExtendedType2_UpdateRandomWaypoint, . - ActorExtendedType2_UpdateRandomWaypoint
