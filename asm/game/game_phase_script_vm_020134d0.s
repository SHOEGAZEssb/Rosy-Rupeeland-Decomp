; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global GamePhaseActorScriptVm_SetField5cLowHalfword
GamePhaseActorScriptVm_SetField5cLowHalfword: ; 0x020134d0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    ldr r3, [r4, #0x84]
    mov r0, #0x10000
    mov r1, r1, asr #0x10
    ldr r2, [r3, #0x5c]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r3, #0x5c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetField5cLowHalfword, . - GamePhaseActorScriptVm_SetField5cLowHalfword

