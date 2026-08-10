; Matching retail form; see src/game/game_phase_script_vm_actor_grid_placement_opcode.c.
.text
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseScriptVm_Pop
.extern Actor_AdjustPositionForTerrainHeight
.global GamePhaseActorScriptVm_PlaceActorOnGridAndSetBounds
GamePhaseActorScriptVm_PlaceActorOnGridAndSetBounds:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0, lsl #4
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r6, r0, lsl #4
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    add r1, r6, r6, lsr #31
    mov r2, r0
    mov r1, r1, asr #1
    add r1, r1, r2, lsl #4
    add r2, r5, r5, lsr #31
    mov r2, r2, asr #1
    add r2, r2, r4, lsl #4
    add r0, sp, #4
    mov r1, r1, lsl #12
    mov r2, r2, lsl #12
    mov r3, #0
    bl VecFx32Object_InitComponents
    ldr r0, [r7, #0x84]
    add r1, sp, #4
    add r0, r0, #0x28
    bl VecFx32Object_Assign
    mov r1, r0
    ldr r0, [r7, #0x84]
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    add r0, sp, #4
    bl VecFx32Object_Destroy
    ldr r0, [r7, #0x84]
    bl Actor_AdjustPositionForTerrainHeight
    rsb r2, r6, #0
    add r3, r2, r2, lsr #31
    rsb r4, r5, #0
    mov r2, r5, lsl #24
    ldr r7, [r7, #0x84]
    mov r0, #0
    mov r1, r6, lsl #24
    mov r5, r3, asr #1
    add r5, r5, r1, asr #24
    add r1, r0, r3, asr #1
    add r4, r4, r4, lsr #31
    strb r1, [r7, #8]
    mov r1, r4, asr #1
    add r1, r1, r2, asr #24
    add r2, r0, r4, asr #1
    strb r2, [r7, #9]
    strb r5, [r7, #0xa]
    strb r1, [r7, #0xb]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
    .size GamePhaseActorScriptVm_PlaceActorOnGridAndSetBounds, . - GamePhaseActorScriptVm_PlaceActorOnGridAndSetBounds
