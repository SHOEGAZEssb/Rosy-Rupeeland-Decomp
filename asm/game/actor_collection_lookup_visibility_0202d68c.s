; Matching retail form; see src/game/actor_collection_lookup_visibility.c.
.text
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

    .global ActorCollection_SetEnabled
    .type ActorCollection_SetEnabled, @function
ActorCollection_SetEnabled: ; 0x0202d68c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    cmp r1, #0x0
    ldr r0, [r4, #0xe00]
    mov r7, #0x0
    beq .L_0202d728
    mov r1, #0x1
    str r1, [r0, #0x20]
    add r5, r4, #0x2000
    mov r6, r1
    b .L_0202d6d8
.L_0202d6b8:
    ldr r0, [r4, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202d6d4
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0x54]
    blx r2
.L_0202d6d4:
    add r7, r7, #0x1
.L_0202d6d8:
    ldr r0, [r5, #0xe74]
    cmp r7, r0
    blt .L_0202d6b8
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe7c]
    cmp r0, #0x0
    ldrne r0, [r0, #0x26c]
    cmpne r0, #0x0
    ldrne r0, [r0, #0xc]
    movne r1, #0x1
    strne r1, [r0, #0x20]
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe80]
    cmp r0, #0x0
    ldrne r0, [r0, #0x234]
    cmpne r0, #0x0
    ldrne r0, [r0, #0xc]
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0202d728:
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    add r5, r4, #0x2000
    mov r6, r7
    b .L_0202d758
.L_0202d738:
    ldr r0, [r4, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_0202d754
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0x54]
    blx r2
.L_0202d754:
    add r7, r7, #0x1
.L_0202d758:
    ldr r0, [r5, #0xe74]
    cmp r7, r0
    blt .L_0202d738
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe7c]
    cmp r0, #0x0
    ldrne r0, [r0, #0x26c]
    cmpne r0, #0x0
    beq .L_0202d784
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
.L_0202d784:
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe80]
    cmp r0, #0x0
    ldrne r0, [r0, #0x234]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size ActorCollection_SetEnabled, . - ActorCollection_SetEnabled
