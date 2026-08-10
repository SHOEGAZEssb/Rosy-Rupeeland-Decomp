; Matching retail form; see src/game/actor_extended_table_counter_dispatch.c.
.text
.extern ActorExtendedType2_UpdateTargetValidationMotion
.global ActorExtendedTable_UpdateStagedCounters
.type ActorExtendedTable_UpdateStagedCounters, @function
ActorExtendedTable_UpdateStagedCounters: ; 0x0204497c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x2a4]
    mov r4, r1
    cmp r2, #0x0
    beq .L_02044ac4
    ldr r2, [r5, #0x260]
    add r1, r5, #0x200
    bic r2, r2, #0x20
    str r2, [r5, #0x260]
    ldrsh ip, [r1, #0x98]
    ldrsh r2, [r1, #0x9a]
    cmp ip, r2
    bne .L_02044a10
    mov r2, #0x0
    strh r2, [r1, #0x98]
    strh r2, [r1, #0x9c]
    strh r2, [r1, #0xa0]
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x9e]
    cmp r0, #0x0
    bne .L_020449f8
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldrsb r1, [r4, #0x25]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_020449f8:
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044a10:
    ldrsh r3, [r1, #0x9c]
    ldrsh r2, [r1, #0x9e]
    cmp r3, r2
    bge .L_02044a7c
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    ldrsh r1, [r0, #0x9c]
    ldrsh r0, [r0, #0x9e]
    cmp r1, r0
    bne .L_02044a64
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldrsb r1, [r4, #0x25]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_02044a64:
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044a7c:
    ldrsh r3, [r1, #0xa0]
    ldrsh r2, [r1, #0xa2]
    cmp r3, r2
    bge .L_02044abc
    add r2, r3, #0x1
    strh r2, [r1, #0xa0]
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044abc:
    add r0, ip, #0x1
    strh r0, [r1, #0x98]
.L_02044ac4:
    ldr r1, [r5, #0x260]
    mov r0, r5
    orr r2, r1, #0x20
    mov r1, r4
    str r2, [r5, #0x260]
    bl ActorExtendedType2_UpdateTargetValidationMotion
    ldmia sp!, {r3, r4, r5, pc}
.size ActorExtendedTable_UpdateStagedCounters, . - ActorExtendedTable_UpdateStagedCounters
