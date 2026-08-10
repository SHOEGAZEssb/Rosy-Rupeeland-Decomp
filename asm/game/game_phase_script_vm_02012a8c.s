; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseScriptVm_Pop

    .global GamePhaseActorScriptVm_SetPositionFromCoordinates3D
GamePhaseActorScriptVm_SetPositionFromCoordinates3D: ; 0x02012a8c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0xc
    mov r2, r4, lsl #0xc
    mov r3, r5, lsl #0xc
    add r0, sp, #0x0
    bl VecFx32Object_InitComponents
    ldr r0, [r6, #0x84]
    add r1, sp, #0x0
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    ldr r1, [r6, #0x84]
    add r0, r1, #0x28
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size GamePhaseActorScriptVm_SetPositionFromCoordinates3D, . - GamePhaseActorScriptVm_SetPositionFromCoordinates3D

