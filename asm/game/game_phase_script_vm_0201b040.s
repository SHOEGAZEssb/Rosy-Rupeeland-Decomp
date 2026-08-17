; Matching retail form; see src/game/game_phase_script_vm_global_state_query_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult
.extern ActorDescriptorState_CountInactiveKind1Subtype1
.extern data_021e9ac0
.global func_0201b040
func_0201b040: ; 0x0201b040
    stmdb sp!, {r4, lr}
    ldr r1, L_0201b06c
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x34
    bl ActorDescriptorState_CountInactiveKind1Subtype1
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201b06c: .word data_021e9ac0
.size func_0201b040, . - func_0201b040
