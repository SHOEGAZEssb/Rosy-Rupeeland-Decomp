; Matching retail form; see src/game/game_phase_script_vm_packed_bit_grid_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020275b0
.global func_0201ad20
func_0201ad20: ; 0x0201ad20
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    bl func_020275b0
    ldr r1, [r0, #0x8]
    ldr r3, [r0, #0x0]
    mla ip, r6, r1, r5
    mov r0, ip, asr #0x2
    add r2, ip, r0, lsr #0x1d
    mov r1, ip, lsr #0x1f
    rsb r0, r1, ip, lsl #0x1d
    add r0, r1, r0, ror #0x1d
    ldrb r2, [r3, r2, asr #0x3]
    mov r1, #0x1
    and r1, r2, r1, lsl r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_0201ad20, . - func_0201ad20
