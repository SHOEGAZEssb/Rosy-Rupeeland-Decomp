; Matching retail form; see src/game/game_phase_script_vm_sound_utility_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern func_020570b0
.global func_0201a50c
func_0201a50c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020570b0
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201a50c, . - func_0201a50c
