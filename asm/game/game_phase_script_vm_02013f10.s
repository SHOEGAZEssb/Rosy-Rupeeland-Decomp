; Matching retail form; see src/game/game_phase_script_vm_effect_spawn_opcode.c.
.text
.extern Heap_Alloc
.extern data_020d5b2c
.extern data_021052fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern GamePhaseScriptVm_Pop
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_GetOwningCollection
.extern func_ov062_0220fe78
.extern func_ov062_02210674
.extern gHeapContext

    .global GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect
GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect: ; 0x02013f10
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    bne L_02013f8c
    ldr r0, [r10, #0x84]
    mov r1, r5, lsl #0x4
    str r1, [r0, #0x44]
    ldr r1, [r10, #0x84]
    ldr r0, [r1, #0x10]
    orr r0, r0, #0x400
    str r0, [r1, #0x10]
    b L_02014080
L_02013f8c:
    add r0, sp, #0xc
    mov r1, r5, lsl #0xc
    mov r2, r6, lsl #0xc
    mov r3, r7, lsl #0xc
    bl VecFx32Object_InitComponents
    cmp r4, #0x0
    bne L_0201400c
    bl OverlayManager_GetGlobal
    ldr r2, L_0201408c
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, L_02014090
    ldr r3, L_02014094
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02014078
    ldr r1, L_02014098
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r1, #0x0]
    add r1, sp, #0xc
    add r2, r2, #0x2000
    ldr r4, [r2, #0xea4]
    mov r2, r9
    str r4, [sp, #0x4]
    mov r4, #0x1
    mov r3, r8
    str r4, [sp, #0x8]
    bl func_ov062_0220fe78
    b L_02014078
L_0201400c:
    ldr r0, [r10, #0x84]
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    mov r5, r0
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    ldr r2, L_0201408c
    bl OverlayManager_LoadOverlay
    mov r0, #0x40
    ldr r1, L_02014090
    mov r2, #0x4
    ldr r3, L_02014094
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201406c
    str r8, [sp, #0x0]
    mov r4, #0x0
    str r4, [sp, #0x4]
    add r2, sp, #0xc
    mov r1, r5
    mov r3, r9
    str r4, [sp, #0x8]
    bl func_ov062_02210674
L_0201406c:
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x400
    str r0, [r5, #0x10]
L_02014078:
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
L_02014080:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_0201408c: .word 0x3e
L_02014090: .word data_020d5b2c
L_02014094: .word gHeapContext
L_02014098: .word data_021052fc
    .size GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect, . - GamePhaseActorScriptVm_ConfigureOrSpawnOverlay62Effect

