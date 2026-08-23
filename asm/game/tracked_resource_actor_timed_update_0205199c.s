; Matching retail form; see src/game/tracked_resource_actor_timed_update.c.
.extern Actor_SynchronizeStatePresentation
.extern Actor_GetCachedTerrainHeight
.extern func_020adae4
.text
    .global TrackedResourceActorType26_Update
TrackedResourceActorType26_Update:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x18]
    blx r1
    ldrh r0, [r4, #0x4e]
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x0]
    cmp r0, #0x19
    moveq r0, #0x1
    movne r0, #0x0
    cmp r2, #0x0
    subgt r2, r2, #0x1
    strgth r2, [r1, #0x0]
    add r1, r4, #0x100
    ldrh r2, [r1, #0xf0]
    mov r2, r2, lsl #0x11
    movs r2, r2, lsr #0x11
    beq .L_020519fc
    cmp r2, #0x1
    beq .L_02051adc
    cmp r2, #0x2
    beq .L_02051af8
    b .L_02051b0c
.L_020519fc:
    ldrsh r2, [r1, #0xf8]
    add r2, r2, #0x1
    strh r2, [r1, #0xf8]
    ldr r3, [r4, #0x54]
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldrb r2, [r4, #0x4b]
    tst r2, #0xf
    beq .L_02051a38
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    b .L_02051b0c
.L_02051a38:
    ldr r3, [r4, #0x1dc]
    ldr r2, [r4, #0x24]
    cmp r2, r3
    bgt .L_02051ab0
    cmp r0, #0x0
    beq .L_02051a68
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
    b .L_02051b0c
.L_02051a68:
    str r3, [r4, #0x24]
    ldrh r2, [r1, #0xf0]
    mov r0, #0x8000
    rsb r0, r0, #0x0
    and r0, r2, r0
    orr r0, r0, #0x1
    strh r0, [r1, #0xf0]
    mov r0, #0x0
    strh r0, [r1, #0xf8]
    ldr r0, [r4, #0x8c]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x90]
    mov r1, #0x4
    bl func_020adae4
    str r0, [r4, #0x90]
    b .L_02051b0c
.L_02051ab0:
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
    b .L_02051b0c
.L_02051adc:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    movle r0, #0x0
    strle r0, [r4, #0x40]
    strle r0, [r4, #0x3c]
    b .L_02051b0c
.L_02051af8:
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02051b0c:
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
    .size TrackedResourceActorType26_Update, . - TrackedResourceActorType26_Update
