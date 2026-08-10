; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern data_021e9ac0
.extern GamePhaseScriptVm_Pop
.extern func_02065270
.global GamePhaseActorScriptVm_RepeatGlobalState34Operation
GamePhaseActorScriptVm_RepeatGlobalState34Operation:
    stmdb sp!, {r4, r5, r6, lr}
    bl GamePhaseScriptVm_Pop
    mov r4, r0, lsl #0x10
    mov r6, #0x0
    ldr r5, L_02019160
    b L_02019150
L_02019140:
    ldr r0, [r5, #0x0]
    add r0, r0, #0x34
    bl func_02065270
    add r6, r6, #0x1
L_02019150:
    cmp r6, r4, lsr #0x10
    blt L_02019140
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02019160: .word data_021e9ac0
.size GamePhaseActorScriptVm_RepeatGlobalState34Operation, . - GamePhaseActorScriptVm_RepeatGlobalState34Operation
