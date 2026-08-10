; Matching retail form; see src/game/actor_extended_table_lifecycle.c.
.text
.extern data_020e0d50
.extern data_020eb850
.extern ActorExtendedType2_Init
.global ActorExtendedTable_Init
.type ActorExtendedTable_Init, @function
.global ActorExtendedTable_InitDuplicate
.type ActorExtendedTable_InitDuplicate, @function
ActorExtendedTable_Init: ; 0x02044518
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_020445d0
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0x98]
    strh r2, [r1, #0x9c]
    strh r2, [r1, #0xa0]
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    mov ip, #0x0
    ldrsb r5, [sp, #0x25]
    ldr r3, .L_020445d4
    mov lr, ip
    mov r0, #0x32
.L_0204456c:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r5, r1
    addeq ip, r3, r2
    cmp lr, #0x43
    blt .L_0204456c
    cmp ip, #0x0
    str ip, [r4, #0x2a4]
    moveq r1, #0x0
    addeq r0, r4, #0x200
    streqh r1, [r0, #0x9e]
    streqh r1, [r0, #0xa2]
    streqh r1, [r0, #0x9a]
    beq .L_020445c4
    ldrsh r1, [ip, #0x22]
    add r0, r4, #0x200
    strh r1, [r0, #0x9a]
    ldrsh r1, [ip, #0x26]
    strh r1, [r0, #0xa2]
    ldrsh r1, [ip, #0x24]
    strh r1, [r0, #0x9e]
.L_020445c4:
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_020445d0: .word data_020e0d50
.L_020445d4: .word data_020eb850

.size ActorExtendedTable_Init, . - ActorExtendedTable_Init
ActorExtendedTable_InitDuplicate: ; 0x020445d8
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02044690
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0x98]
    strh r2, [r1, #0x9c]
    strh r2, [r1, #0xa0]
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    mov ip, #0x0
    ldrsb r5, [sp, #0x25]
    ldr r3, .L_02044694
    mov lr, ip
    mov r0, #0x32
.L_0204462c:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r5, r1
    addeq ip, r3, r2
    cmp lr, #0x43
    blt .L_0204462c
    cmp ip, #0x0
    str ip, [r4, #0x2a4]
    moveq r1, #0x0
    addeq r0, r4, #0x200
    streqh r1, [r0, #0x9e]
    streqh r1, [r0, #0xa2]
    streqh r1, [r0, #0x9a]
    beq .L_02044684
    ldrsh r1, [ip, #0x22]
    add r0, r4, #0x200
    strh r1, [r0, #0x9a]
    ldrsh r1, [ip, #0x26]
    strh r1, [r0, #0xa2]
    ldrsh r1, [ip, #0x24]
    strh r1, [r0, #0x9e]
.L_02044684:
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_02044690: .word data_020e0d50
.L_02044694: .word data_020eb850
.size ActorExtendedTable_InitDuplicate, . - ActorExtendedTable_InitDuplicate
