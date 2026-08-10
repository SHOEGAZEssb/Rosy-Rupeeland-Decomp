; Matching retail form; see src/game/actor_runtime_scene_actor_sets.c for
; the documented portable implementation and recovered behavior.
.text
.extern GamePhaseRuntime_GetActorCollection
.extern Actor_SetActive
.extern data_021052fc
.global ActorRuntimeScene_ActivateFlaggedActors
ActorRuntimeScene_ActivateFlaggedActors:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, L_0200bac0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r6, r0
    mov r7, #0x0
    add r4, r6, #0x2000
    mov r5, #0x1
    b L_0200ba54
L_0200ba28:
    ldr r0, [r6, r7, lsl #0x2]
    cmp r0, #0x0
    ldrneb r1, [r0, #0x4d]
    cmpne r1, #0x1
    beq L_0200ba50
    ldr r1, [r0, #0x14]
    tst r1, #0x8000
    beq L_0200ba50
    mov r1, r5
    bl Actor_SetActive
L_0200ba50:
    add r7, r7, #0x1
L_0200ba54:
    ldr r0, [r4, #0xe74]
    cmp r7, r0
    blt L_0200ba28
    ldr r0, L_0200bac0
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r7, r0
    mov r6, #0x0
    add r4, r7, #0x2000
    mov r5, #0x1
    b L_0200bab0
L_0200ba84:
    ldr r0, [r7, r6, lsl #0x2]
    cmp r0, #0x0
    ldrneb r1, [r0, #0x4d]
    cmpne r1, #0x1
    beq L_0200baac
    ldr r1, [r0, #0x14]
    tst r1, #0x8000
    beq L_0200baac
    mov r1, r5
    bl Actor_SetActive
L_0200baac:
    add r6, r6, #0x1
L_0200bab0:
    ldr r0, [r4, #0xe74]
    cmp r6, r0
    blt L_0200ba84
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0200bac0: .word data_021052fc
.size ActorRuntimeScene_ActivateFlaggedActors, . - ActorRuntimeScene_ActivateFlaggedActors
