; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_position_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult
.extern data_021052fc
.global func_0201ae98
func_0201ae98: ; 0x0201ae98
    stmdb sp!, {r3, lr}
    ldr r2, L_0201aec8
    mov r1, #0x0
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea8]
    cmp r2, #0x0
    ldrne r1, [r2, #0x20]
    movne r1, r1, asr #0xc
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201aec8: .word data_021052fc
.size func_0201ae98, . - func_0201ae98
