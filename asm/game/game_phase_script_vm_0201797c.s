; Matching retail form; see src/game/game_phase_script_vm_conditional_actor_object_opcode.c.
.text
.extern Heap_Alloc
.extern data_020d5b34
.extern data_021052fc
.extern GameWork_SetFlag
.extern GamePhaseRuntime_GetActorCollection
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseScriptVm_Pop
.extern func_0201ded4
.extern RisingSpriteSwarmPresentation_Init
.extern ActorCollection_FindActorByDescriptorValue
.extern gGameWork
.extern gHeapContext
.global GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled
GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    cmp r0, #0
    beq L_02017a28
    ldr r0, L_02017a40
    mov r1, #1
    ldr r0, [r0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    mov r4, r0
    ldr r1, L_02017a44
    ldr r3, L_02017a48
    mov r0, #0x4c
    mov r2, #4
    bl Heap_Alloc
    movs r6, r0
    beq L_02017a0c
    ldr r0, L_02017a40
    ldr r0, [r0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    mov r0, r6
    mov r2, r4
    mov r3, r5
    bl RisingSpriteSwarmPresentation_Init
    mov r6, r0
L_02017a0c:
    ldr r0, L_02017a40
    mov r1, r6
    ldr r0, [r0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    b L_02017a38
L_02017a28:
    ldr r0, L_02017a4c
    ldr r1, L_02017a50
    ldr r0, [r0]
    bl GameWork_SetFlag
L_02017a38:
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02017a40: .word data_021052fc
L_02017a44: .word data_020d5b34
L_02017a48: .word gHeapContext
L_02017a4c: .word gGameWork
L_02017a50: .word 0x00000408
    .size GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled, . - GamePhaseActorScriptVm_SetRisingSpriteSwarmEnabled
