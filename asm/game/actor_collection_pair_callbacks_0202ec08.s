; Matching retail form; see src/game/actor_collection_pair_callbacks.c.
.text
.extern func_0203b9dc

    .global ActorCollection_NotifyPairActive
    .type ActorCollection_NotifyPairActive, @function
ActorCollection_NotifyPairActive: ; 0x0202ec08
    stmdb sp!, {r3, lr}
    ldr r0, [r1, #0x10]
    tst r0, #0x1000000
    beq .L_0202ec58
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x2
    cmpne r0, #0x7
    cmpne r0, #0x1
    mov r0, r1
    bne .L_0202ec40
    mov r1, r2
    mov r2, r3
    bl func_0203b9dc
    ldmia sp!, {r3, pc}
.L_0202ec40:
    ldr ip, [r0, #0x0]
    mov r1, r2
    ldr ip, [ip, #0x28]
    mov r2, r3
    blx ip
    ldmia sp!, {r3, pc}
.L_0202ec58:
    mov r0, r1
    ldr ip, [r0, #0x0]
    mov r1, r2
    ldr ip, [ip, #0x28]
    mov r2, r3
    blx ip
    ldmia sp!, {r3, pc}
    .size ActorCollection_NotifyPairActive, . - ActorCollection_NotifyPairActive
