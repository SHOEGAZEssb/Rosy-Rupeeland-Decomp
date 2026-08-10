; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Actor_SetAttachmentEnabled

    .global GamePhaseActorScriptVm_SetAttachmentEnabledIfPresent
GamePhaseActorScriptVm_SetAttachmentEnabledIfPresent: ; 0x02012cd4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, [r4, #0x84]
    ldr r2, [r0, #0x54]
    cmp r2, #0x0
    beq L_02012cf8
    bl Actor_SetAttachmentEnabled
L_02012cf8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetAttachmentEnabledIfPresent, . - GamePhaseActorScriptVm_SetAttachmentEnabledIfPresent
