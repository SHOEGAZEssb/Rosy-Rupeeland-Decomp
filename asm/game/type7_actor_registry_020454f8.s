; Matching retail form; see src/game/type7_actor_registry.c.
.text
.extern gGamePhaseRuntime
.extern gType7ActorRegistry
.extern GamePhaseRuntime_GetActorCollection
.global Type7ActorRegistry_Populate
.type Type7ActorRegistry_Populate, @function
.global Type7ActorRegistry_Clear
.type Type7ActorRegistry_Clear, @function
Type7ActorRegistry_Populate: ; 0x020454f8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, #0x0
    mov r7, #0x1
    mov r9, r8
    ldr r6, .L_02045590
    mov r5, r7
    ldr r4, .L_02045594
    b .L_02045550
.L_02045518:
    ldr r0, [r4, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r2, [r0, r9, lsl #0x2]
    cmp r2, #0x0
    beq .L_0204554c
    ldrb r0, [r2, #0x4d]
    cmp r0, #0x7
    addeq r1, r8, r8, lsl #0x2
    addeq r0, r2, #0x200
    streqh r1, [r0, #0x7c]
    streq r2, [r6, r8, lsl #0x2]
    addeq r8, r8, #0x1
.L_0204554c:
    add r9, r9, #0x1
.L_02045550:
    ldr r0, [r4, #0x0]
    mov r1, r5
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    cmplt r8, #0x3
    blt .L_02045518
    mov r1, #0x0
    ldr r0, .L_02045590
    b .L_02045584
.L_0204557c:
    str r1, [r0, r8, lsl #0x2]
    add r8, r8, #0x1
.L_02045584:
    cmp r8, #0x3
    blt .L_0204557c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02045590: .word gType7ActorRegistry
.L_02045594: .word gGamePhaseRuntime

.size Type7ActorRegistry_Populate, . - Type7ActorRegistry_Populate
Type7ActorRegistry_Clear: ; 0x02045598
    mov r2, #0x0
    ldr r0, .L_020455b8
    mov r1, r2
.L_020455a4:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x3
    blt .L_020455a4
    bx lr
.L_020455b8: .word gType7ActorRegistry
.size Type7ActorRegistry_Clear, . - Type7ActorRegistry_Clear
