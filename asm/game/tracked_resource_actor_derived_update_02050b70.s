; Matching retail form; see src/game/tracked_resource_actor_derived_update.c.
.extern ActorCollection_QueueActorForRemoval
.extern Actor_SynchronizeStatePresentation
.extern Actor_GetOwningCollection
.text
    .global TrackedResourceActorType21_Update
TrackedResourceActorType21_Update:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    add r0, r4, #0x100
    ldrh r1, [r0, #0xf0]
    mov r1, r1, lsl #0x11
    movs r1, r1, lsr #0x11
    beq .L_02050bac
    cmp r1, #0x1
    beq .L_02050c50
    cmp r1, #0x2
    beq .L_02050cbc
    b .L_02050cd0
.L_02050bac:
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldrsh r1, [r0, #0xf8]
    add r1, r1, #0x1
    strh r1, [r0, #0xf8]
    ldr r1, [r4, #0x14]
    tst r1, #0x40
    beq .L_02050bf4
    ldrb r0, [r4, #0x4b]
    tst r0, #0xf
    beq .L_02050cd0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    b .L_02050cd0
.L_02050bf4:
    ldr r2, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r0, r2
    ble .L_02050c18
    tst r1, #0x1
    bne .L_02050cd0
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    bne .L_02050cd0
.L_02050c18:
    str r2, [r4, #0x24]
    add r1, r4, #0x100
    mov r0, #0x8000
    ldrh r3, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r2, #0x0
    and r0, r3, r0
    orr r0, r0, #0x1
    strh r0, [r1, #0xf0]
    strh r2, [r1, #0xf8]
    str r2, [r4, #0x44]
    str r2, [r4, #0x40]
    str r2, [r4, #0x3c]
    b .L_02050cd0
.L_02050c50:
    ldrsh r1, [r0, #0xf8]
    add r1, r1, #0x1
    strh r1, [r0, #0xf8]
    ldrsh r0, [r0, #0xf8]
    cmp r0, #0x1e
    bge .L_02050c8c
    ldr r1, [r4, #0x54]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    b .L_02050cd0
.L_02050c8c:
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
    b .L_02050cd0
.L_02050cbc:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02050cd0:
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
    .size TrackedResourceActorType21_Update, . - TrackedResourceActorType21_Update
