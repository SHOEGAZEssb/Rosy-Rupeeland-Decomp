    .text
    .extern GameWork_SetFlag
    .extern gGamePhaseRuntime
    .extern ActorMotion_SetMode2
    .extern GridEffectActorRegistry_FinalizeDepartingActors
    .extern Overlay013_UpdateSceneRuntime
    .extern gGameWork

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_terminal_states.c. */
    .global Overlay013_UpdateCompletionPhase

Overlay013_UpdateCompletionPhase:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fe9e4
    cmp r0, #0x1
    b L_021feaac
L_021fe9e4:
    ldr r0, [r4, #0x96c]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_021fea98
L_021fe9f4: ; jump table
    b L_021fea10 ; case 0
    b L_021fea1c ; case 1
    b L_021fea98 ; case 2
    b L_021fea58 ; case 3
    b L_021fea90 ; case 4
    b L_021fea40 ; case 5
    b L_021fea4c ; case 6
L_021fea10:
    mov r0, #0x4
    str r0, [r4, #0x980]
    b L_021fea98
L_021fea1c:
    ldr r0, [r4, #0x97c]
    cmp r0, #0x0
    movne r0, #0x9
    strne r0, [r4, #0x980]
    bne L_021fea98
    mov r0, #0x8
    str r0, [r4, #0x980]
    bl GridEffectActorRegistry_FinalizeDepartingActors
    b L_021fea98
L_021fea40:
    mov r0, #0xc
    str r0, [r4, #0x980]
    b L_021fea98
L_021fea4c:
    mov r0, #0xe
    str r0, [r4, #0x980]
    b L_021fea98
L_021fea58:
    ldr r0, L_021feabc
    ldr r1, L_021feac0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_021feabc
    ldr r1, L_021feac4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_021feac8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetMode2
    b L_021fea98
L_021fea90:
    mov r0, #0xf
    str r0, [r4, #0x980]
L_021fea98:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021feaac:
    mov r0, r4
    bl Overlay013_UpdateSceneRuntime
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021feabc: .word gGameWork
L_021feac0: .word 0x3f2
L_021feac4: .word 0x393
L_021feac8: .word gGamePhaseRuntime
    .size Overlay013_UpdateCompletionPhase, . - Overlay013_UpdateCompletionPhase
