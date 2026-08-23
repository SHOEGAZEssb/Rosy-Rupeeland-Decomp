; Matching retail form; see src/game/tracked_resource_actor_impulse_update.c.
.extern Actor_SynchronizeStatePresentation
.extern Actor_GetCachedTerrainHeight
.extern func_020adae4
.text
    .global TrackedResourceActorImpulse_Update
TrackedResourceActorImpulse_Update:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    add r1, r4, #0x100
    ldrh r0, [r1, #0xf0]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x11
    beq .L_02051e40
    cmp r0, #0x1
    beq .L_02051ef8
    cmp r0, #0x2
    beq .L_02051f0c
    b .L_02051f20
.L_02051e40:
    ldrsh r0, [r1, #0xf8]
    add r0, r0, #0x1
    strh r0, [r1, #0xf8]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldrb r0, [r4, #0x4b]
    tst r0, #0xf
    beq .L_02051e7c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    b .L_02051f20
.L_02051e7c:
    ldr r2, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r0, r2
    bgt .L_02051ecc
    str r2, [r4, #0x24]
    ldrh r2, [r1, #0xf0]
    mov r0, #0x8000
    rsb r0, r0, #0x0
    and r0, r2, r0
    orr r0, r0, #0x1
    strh r0, [r1, #0xf0]
    ldr r0, [r4, #0x3c]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x40]
    b .L_02051f20
.L_02051ecc:
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
    b .L_02051f20
.L_02051ef8:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe0]
    blx r1
    b .L_02051f20
.L_02051f0c:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02051f20:
    ldr r0, [r4, #0x1fc]
    add r1, r4, #0x100
    ldrsh r2, [r1, #0xf8]
    ldrsh r0, [r0, #0x28]
    cmp r2, r0
    bge .L_02051f54
    add r2, r2, #0x1
    mov r0, r4
    strh r2, [r1, #0xf8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd8]
    blx r1
    b .L_02051f68
.L_02051f54:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xdc]
    blx r1
    ldmia sp!, {r4, pc}
.L_02051f68:
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
    .size TrackedResourceActorImpulse_Update, . - TrackedResourceActorImpulse_Update
