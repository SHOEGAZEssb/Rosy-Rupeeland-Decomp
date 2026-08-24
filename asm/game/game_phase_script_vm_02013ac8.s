; Matching retail form; see src/game/game_phase_script_vm_actor_bit_query_opcodes.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_GetOwningCollection

    .global GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0
GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0: ; 0x02013ac8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    movs r5, r0
    ldr r0, [r4, #0x84]
    bne L_02013b4c
    bl Actor_GetOwningCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne L_02013b20
    ldr r0, L_02013b70
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    mov r0, r4
    ldrb r1, [r1, #0x169]
    and r1, r1, #0x1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02013b68
L_02013b20:
    ldr r1, L_02013b70
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xfb8]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xebc]
    ldrb r1, [r1, #0x169]
    and r1, r1, #0x1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02013b68
L_02013b4c:
    bl Actor_GetOwningCollection
    mov r1, r5
    bl ActorCollection_FindActorByRuntimeId
    ldrb r1, [r0, #0x169]
    mov r0, r4
    and r1, r1, #0x1
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
L_02013b68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02013b70: .word gGamePhaseRuntime
    .size GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0, . - GamePhaseActorScriptVm_GetSelectedActorFlag169Bit0

