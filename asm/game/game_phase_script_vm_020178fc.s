; Matching retail form; see src/game/game_phase_script_vm_conditional_global_command_opcode.c.
.text
.extern gActorRuntimeFlags
.extern GamePhaseScriptVm_Pop
.extern ActorRuntimeFlags_Set
.global GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero
GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    cmp r0, #0
    bne L_0201792c
    ldr r0, L_02017934
    mov r1, #0x100
    bl ActorRuntimeFlags_Set
L_0201792c:
    mov r0, #0
    ldmia sp!, {r4, pc}
L_02017934: .word gActorRuntimeFlags
    .size GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero, . - GamePhaseActorScriptVm_SetActorRuntimeFlag100WhenZero
