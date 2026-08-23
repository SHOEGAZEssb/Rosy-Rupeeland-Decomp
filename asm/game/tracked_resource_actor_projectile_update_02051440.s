; Matching retail form; see src/game/tracked_resource_actor_projectile_update.c.
.extern ActorCollection_QueueActorForRemoval
.extern Actor_SynchronizeStatePresentation
.extern Actor_GetOwningCollection
.extern Actor_GetCachedTerrainHeight
.text
    .global TrackedResourceActorType24_Update
TrackedResourceActorType24_Update:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    mov r1, r1, lsl #0x11
    movs r1, r1, lsr #0x11
    beq .L_0205147c
    cmp r1, #0x1
    beq .L_02051524
    cmp r1, #0x2
    beq .L_020515ac
    b .L_020515c0
.L_0205147c:
    ldrsh r1, [r0, #0xf8]
    add r1, r1, #0x1
    strh r1, [r0, #0xf8]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x1fc]
    ldr r0, [r4, #0x44]
    ldrsh r1, [r1, #0xa]
    mov r1, r1, lsl #0x4
    rsb r1, r1, #0x0
    cmp r0, r1
    strlt r1, [r4, #0x44]
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    bgt .L_020514f8
    ldr r1, [r4, #0x1dc]
    mov r0, #0x8000
    str r1, [r4, #0x24]
    add r1, r4, #0x100
    ldrh r3, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r2, #0x0
    and r0, r3, r0
    orr r0, r0, #0x1
    strh r0, [r1, #0xf0]
    strh r2, [r1, #0xf8]
    b .L_020515c0
.L_020514f8:
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
    b .L_020515c0
.L_02051524:
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
    bge .L_0205157c
    ldr r1, [r4, #0x54]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    b .L_020515c0
.L_0205157c:
    mov r0, r4
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    add r1, r4, #0x100
    mov r0, #0x8000
    ldrh r2, [r1, #0xf0]
    rsb r0, r0, #0x0
    and r0, r2, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    b .L_020515c0
.L_020515ac:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_020515c0:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd4]
    blx r1
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r4
    bl Actor_SynchronizeStatePresentation
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    ldmia sp!, {r4, pc}
    .size TrackedResourceActorType24_Update, . - TrackedResourceActorType24_Update
