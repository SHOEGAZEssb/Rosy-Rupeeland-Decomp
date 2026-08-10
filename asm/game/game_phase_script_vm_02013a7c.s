; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorCollection_FindActorByDescriptorValue
.extern func_020330fc
.extern Actor_GetCollection

    .global func_02013a7c
func_02013a7c: ; 0x02013a7c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, [r7, #0x84]
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    mov r1, r5
    mov r2, r6
    bl func_020330fc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_02013a7c, . - func_02013a7c

