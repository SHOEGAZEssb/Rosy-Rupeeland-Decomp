; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global GamePhaseActorScriptVm_SetField3c
GamePhaseActorScriptVm_SetField3c: ; 0x02013568
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r4, #0x84]
    str r0, [r1, #0x3c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetField3c, . - GamePhaseActorScriptVm_SetField3c

