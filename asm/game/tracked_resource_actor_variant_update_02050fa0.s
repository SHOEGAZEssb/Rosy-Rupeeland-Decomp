; Matching retail form; see src/game/tracked_resource_actor_variant_update.c.
.extern ActorCollection_QueueActorForRemoval
.extern Actor_UpdateAnimationState
.extern Actor_GetCollection
.extern Actor_GetCachedTerrainHeight
.extern func_020adae4
.text
    .global TrackedResourceActorType22And25_Update
TrackedResourceActorType22And25_Update:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    add r1, r4, #0x100
    ldrh r0, [r4, #0x4e]
    ldrh r2, [r1, #0xf0]
    cmp r0, #0x19
    moveq r0, #0x1
    mov r2, r2, lsl #0x11
    movne r0, #0x0
    movs r2, r2, lsr #0x11
    beq .L_02050fec
    cmp r2, #0x1
    beq .L_020510cc
    cmp r2, #0x2
    beq .L_02051154
    b .L_02051168
.L_02050fec:
    ldrsh r2, [r1, #0xf8]
    add r2, r2, #0x1
    strh r2, [r1, #0xf8]
    ldr r3, [r4, #0x54]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldrb r2, [r4, #0x4b]
    tst r2, #0xf
    beq .L_02051028
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    b .L_02051168
.L_02051028:
    ldr r3, [r4, #0x1dc]
    ldr r2, [r4, #0x24]
    cmp r2, r3
    bgt .L_020510a0
    cmp r0, #0x0
    beq .L_02051058
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
    b .L_02051168
.L_02051058:
    str r3, [r4, #0x24]
    ldrh r2, [r1, #0xf0]
    mov r0, #0x8000
    rsb r0, r0, #0x0
    and r0, r2, r0
    orr r0, r0, #0x1
    strh r0, [r1, #0xf0]
    mov r0, #0x0
    strh r0, [r1, #0xf8]
    ldr r0, [r4, #0x3c]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x40]
    b .L_02051168
.L_020510a0:
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    sub r0, r1, r0
    cmp r0, #0x20000
    ldr r0, [r4, #0x14]
    bicgt r0, r0, #0x800000
    strgt r0, [r4, #0x14]
    orrle r0, r0, #0x800000
    strle r0, [r4, #0x14]
    b .L_02051168
.L_020510cc:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    movle r0, #0x0
    strle r0, [r4, #0x40]
    strle r0, [r4, #0x3c]
    add r0, r4, #0x100
    ldrsh r1, [r0, #0xf8]
    add r1, r1, #0x1
    strh r1, [r0, #0xf8]
    ldrsh r0, [r0, #0xf8]
    cmp r0, #0x1e
    bge .L_02051124
    ldr r1, [r4, #0x54]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    b .L_02051168
.L_02051124:
    mov r0, r4
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    add r1, r4, #0x100
    mov r0, #0x8000
    ldrh r2, [r1, #0xf0]
    rsb r0, r0, #0x0
    and r0, r2, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    b .L_02051168
.L_02051154:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02051168:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_UpdateAnimationState
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType22And25_Update, . - TrackedResourceActorType22And25_Update
