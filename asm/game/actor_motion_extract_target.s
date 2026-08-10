; Matching retail form; see src/game/actor_motion_extract_target.c for
; the documented portable implementation and recovered behavior.
.text
.extern VecFx32Object_Init
.extern VecFx32Object_Add
.extern Actor_GetCachedTerrainHeight
.global ActorMotion_GetBoundActorTargetPosition
ActorMotion_GetBoundActorTargetPosition: ; 0x02009514
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    bl VecFx32Object_Init
    ldr r0, [r4, #0x4]
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq L_020095a8
    ldr r2, [r0, #0x1c]
    ldr r1, [r0, #0x23c]
    add r1, r2, r1
    str r1, [r5, #0x4]
    ldr r1, [r4, #0x30]
    tst r1, #0x8
    beq L_02009574
    ldr r6, [r0, #0x240]
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x4]
    ldr r1, [r1, #0x20]
    add r1, r1, r6
    b L_02009590
L_02009574:
    ldr r2, [r4, #0x4]
    ldr r1, [r0, #0x240]
    ldr r3, [r2, #0x20]
    ldr r2, [r2, #0x24]
    ldr r0, [r0, #0x244]
    sub r2, r3, r2
    add r1, r2, r1
L_02009590:
    sub r0, r1, r0
    str r0, [r5, #0x8]
    mov r0, r5
    add r1, r4, #0x34
    bl VecFx32Object_Add
    ldmia sp!, {r4, r5, r6, pc}
L_020095a8:
    ldr r1, [r0, #0x1c]
    mov r0, r5
    str r1, [r5, #0x4]
    ldr r2, [r4, #0x4]
    add r1, r4, #0x34
    ldr r2, [r2, #0x20]
    str r2, [r5, #0x8]
    bl VecFx32Object_Add
    ldmia sp!, {r4, r5, r6, pc}
    .size ActorMotion_GetBoundActorTargetPosition, .-ActorMotion_GetBoundActorTargetPosition

