; Matching retail form; see src/game/game_phase_script_vm_actor_presentation_opcodes.c.
.text
.extern data_02105310
.extern ActorRuntimeCollection_SetPendingValue
.extern GamePhaseScriptVm_Pop

    .global func_020142cc
func_020142cc: ; 0x020142cc
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_020142e8
    bl ActorRuntimeCollection_SetPendingValue
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020142e8: .word data_02105310
    .size func_020142cc, . - func_020142cc

