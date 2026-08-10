; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text
.extern OverlaySlot_Init
.extern ActorPairMatrix_ClearAll

    .global ActorCollection_Init
    .type ActorCollection_Init, @function
ActorCollection_Init: ; 0x0202cf2c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x204
    mov r1, #0x0
    add r0, r0, #0xc00
    str r1, [r4, #0xe00]
    bl OverlaySlot_Init
    add r0, r4, #0xe10
    bl OverlaySlot_Init
    add r0, r4, #0x234
    add r0, r0, #0xc00
    bl ActorPairMatrix_ClearAll
    mov r3, #0x0
    add r0, r4, #0x2000
    ldr r1, [r0, #0xe78]
    mov lr, r3
    orr r1, r1, #0x2
    str r1, [r0, #0xe78]
    str r3, [r0, #0xe84]
    mov r1, #0x1000
    str r1, [r0, #0xe88]
    mov r2, r3
.L_0202cf84:
    mov ip, r2
    str r2, [r4, r3, lsl #0x2]
    add r1, r4, r3, lsl #0x2
.L_0202cf90:
    add r0, r1, ip, lsl #0x9
    add ip, ip, #0x1
    str lr, [r0, #0x200]
    cmp ip, #0x5
    blt .L_0202cf90
    add r3, r3, #0x1
    str lr, [r1, #0xc00]
    cmp r3, #0x80
    blt .L_0202cf84
    mov r2, #0x0
.L_0202cfb8:
    add r0, r4, lr, lsl #0x2
    add lr, lr, #0x1
    str r2, [r0, #0xe20]
    cmp lr, #0x5
    blt .L_0202cfb8
    mov r1, #0x2
    str r1, [r4, #0xe1c]
    add r0, r4, #0x2000
    str r1, [r0, #0xe74]
    ldr r1, [r0, #0xe78]
    bic r1, r1, #0x1
    str r1, [r0, #0xe78]
    str r2, [r0, #0xe7c]
    str r2, [r0, #0xe80]
    mvn r1, #0x0
.L_0202cff4:
    add r0, r4, r2, lsl #0x2
    add r0, r0, #0x2000
    add r2, r2, #0x1
    str r1, [r0, #0xe90]
    cmp r2, #0x4
    blt .L_0202cff4
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size ActorCollection_Init, . - ActorCollection_Init
