; Matching retail form; see src/game/game_phase_script_vm_actor_position_opcodes.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseScriptVm_Pop
.extern Actor_AdjustPositionForTerrainHeight

    .global GamePhaseActorScriptVm_SetPositionFromCoordinates
GamePhaseActorScriptVm_SetPositionFromCoordinates: ; 0x0201409c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    add r0, sp, #0x0
    mov r1, r1, lsl #0xc
    mov r2, r4, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r0, [r5, #0x84]
    add r1, sp, #0x0
    add r0, r0, #0x28
    bl VecFx32Object_Assign
    ldr r2, [r5, #0x84]
    mov r1, r0
    add r0, r2, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [r5, #0x84]
    bl Actor_AdjustPositionForTerrainHeight
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_SetPositionFromCoordinates, . - GamePhaseActorScriptVm_SetPositionFromCoordinates
