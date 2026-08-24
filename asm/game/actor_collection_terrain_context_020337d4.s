; Matching retail form; see src/game/actor_collection_terrain_context.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection

    .global Actor_GetOwningCollection
    .type Actor_GetOwningCollection, @function
Actor_GetOwningCollection: ; 0x020337d4
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x14]
    tst r0, #0x4000000
    beq .L_020337f8
    ldr r0, .L_0203380c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldmia sp!, {r3, pc}
.L_020337f8:
    ldr r0, .L_0203380c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldmia sp!, {r3, pc}
.L_0203380c: .word gGamePhaseRuntime
    .size Actor_GetOwningCollection, . - Actor_GetOwningCollection

    .global Actor_GetGlobalCollectionBySlot
