; Matching retail form; see src/game/game_phase_script_vm_utility_opcodes.c.
.text
.extern data_020d5b2c
.extern Heap_Alloc
.extern GamePhaseApplyScene_Init
.extern GamePhaseScriptVm_Pop
.extern func_02028388
.extern gHeapContext
.global GamePhaseActorScriptVm_CreateApplyScene
GamePhaseActorScriptVm_CreateApplyScene:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    ldr r1, L_02015e38
    ldr r3, L_02015e3c
    mov r0, #0x30
    mov r2, #4
    bl Heap_Alloc
    movs r4, r0
    beq L_02015e30
    sub r0, r5, #1
    bl func_02028388
    mov r1, r0
    mov r12, #0
    mov r0, r4
    mov r2, r6
    mov r3, r7
    str r12, [sp]
    bl GamePhaseApplyScene_Init
L_02015e30:
    mov r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02015e38: .word data_020d5b2c
L_02015e3c: .word gHeapContext
    .size GamePhaseActorScriptVm_CreateApplyScene, . - GamePhaseActorScriptVm_CreateApplyScene
