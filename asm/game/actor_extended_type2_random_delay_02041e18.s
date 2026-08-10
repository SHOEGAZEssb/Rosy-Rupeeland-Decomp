; Matching retail form; see src/game/actor_extended_type2_random_delay.c.
.text
.extern data_020df9e8
.extern func_020050a4
.extern func_020ada8c
.extern genrand_int32
.global ActorExtendedType2_UpdateRandomCallbackDelay
.type ActorExtendedType2_UpdateRandomCallbackDelay, @function
ActorExtendedType2_UpdateRandomCallbackDelay: ; 0x02041e18
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, #0x2
    add r0, r4, #0x78
    add r1, r4, #0x18
    strh r2, [r4, #0xd6]
    bl func_020050a4
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x5a]
    cmp r1, #0x0
    bne .L_02041e64
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x78
    bl func_020ada8c
    add r1, r0, #0x78
    add r0, r4, #0x200
    strh r1, [r0, #0x58]
    b .L_02041e80
.L_02041e64:
    ldrh r0, [r0, #0x58]
    cmp r1, r0
    ldrge r0, .L_02041e98
    ldrge r1, [r0, #0x218]
    ldrge r0, [r0, #0x21c]
    strge r1, [r4, #0x220]
    strge r0, [r4, #0x224]
.L_02041e80:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldmia sp!, {r4, pc}
.L_02041e98: .word data_020df9e8
.size ActorExtendedType2_UpdateRandomCallbackDelay, . - ActorExtendedType2_UpdateRandomCallbackDelay
