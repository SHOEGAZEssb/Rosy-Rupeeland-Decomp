; Matching retail form; see src/game/game_phase_script_vm_runtime_misc_opcodes.c.
.text
.extern data_021052fc
.extern GamePhaseScriptVm_SetResult
.extern Actor_GetCachedTerrainHeight
.global func_020168d0
func_020168d0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0201692c
    mov r5, r0
    ldr r0, [r1]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0xd0]
    tst r1, #0x10
    bne L_02016908
    ldr r1, [r0, #0x24]
    mov r4, r1, asr #12
    bl Actor_GetCachedTerrainHeight
    cmp r4, r0, asr #12
    ble L_02016918
L_02016908:
    mov r0, r5
    mov r1, #1
    bl GamePhaseScriptVm_SetResult
    b L_02016924
L_02016918:
    mov r0, r5
    mov r1, #0
    bl GamePhaseScriptVm_SetResult
L_02016924:
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_0201692c: .word data_021052fc
    .size func_020168d0, . - func_020168d0
