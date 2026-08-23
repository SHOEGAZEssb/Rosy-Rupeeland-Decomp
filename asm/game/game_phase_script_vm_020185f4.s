; Matching retail form; see src/game/game_phase_script_vm_actor_runtime_display_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_EnsureInteractionIcon
.extern Actor_DestroyInteractionIcon
.global GamePhaseActorScriptVm_SetInteractionIconEnabled
GamePhaseActorScriptVm_SetInteractionIconEnabled:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x0
    ldr r0, [r4, #0x84]
    beq L_02018620
    bl Actor_EnsureInteractionIcon
    ldr r1, [r4, #0x84]
    ldr r0, [r1, #0x14]
    orr r0, r0, #0x8000000
    b L_02018630
L_02018620:
    bl Actor_DestroyInteractionIcon
    ldr r1, [r4, #0x84]
    ldr r0, [r1, #0x14]
    bic r0, r0, #0x8000000
L_02018630:
    str r0, [r1, #0x14]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size GamePhaseActorScriptVm_SetInteractionIconEnabled, . - GamePhaseActorScriptVm_SetInteractionIconEnabled
