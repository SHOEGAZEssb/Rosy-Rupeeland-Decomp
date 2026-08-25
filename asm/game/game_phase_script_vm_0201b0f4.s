; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern GamePhaseScriptVm_Init
.extern GamePhaseActorScriptVm_ResetState
.extern gGamePhaseActorScriptVmVTable
.global GamePhaseActorScriptVm_Init
GamePhaseActorScriptVm_Init: ; 0x0201b0f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Init
    ldr r1, L_0201b120
    mov r0, r4
    str r1, [r4, #0x0]
    bl GamePhaseActorScriptVm_ResetState
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x84]
    ldmia sp!, {r4, pc}
L_0201b120: .word gGamePhaseActorScriptVmVTable
.size GamePhaseActorScriptVm_Init, . - GamePhaseActorScriptVm_Init
