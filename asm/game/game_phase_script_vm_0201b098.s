; Matching retail form; see src/game/game_phase_script_vm_final_runtime_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_FindActorByDescriptorValue
.extern func_020330fc
.extern data_021052fc
.global GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0
GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0: ; 0x0201b098
    stmdb sp!, {r4, lr}
    bl GamePhaseScriptVm_Pop
    ldr r1, L_0201b0d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x0
    bl ActorCollection_FindActorByDescriptorValue
    mov r2, r4
    mov r1, #0x2a
    bl func_020330fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201b0d0: .word data_021052fc
.size GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0, . - GamePhaseActorScriptVm_SendCommand2aToCollection2Actor0
