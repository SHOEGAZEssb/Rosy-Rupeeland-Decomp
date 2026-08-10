; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult

    .global GamePhaseActorScriptVm_IsActorFlag1Set
GamePhaseActorScriptVm_IsActorFlag1Set: ; 0x02012f40
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x84]
    ldr r1, [r1, #0x10]
    tst r1, #0x1
    movne r1, #0x1
    moveq r1, #0x0
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size GamePhaseActorScriptVm_IsActorFlag1Set, . - GamePhaseActorScriptVm_IsActorFlag1Set

