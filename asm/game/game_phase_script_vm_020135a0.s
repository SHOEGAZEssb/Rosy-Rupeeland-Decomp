; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern data_020d5af8
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020ae024

    .global func_020135a0
func_020135a0: ; 0x020135a0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    ldr r2, [r4, #0x84]
    ldr r1, [r2, #0x1c]
    ldr r2, [r2, #0x20]
    rsb r1, r1, r0, lsl #0xc
    rsb r0, r2, r5, lsl #0xc
    bl func_020ae024
    mov r0, r0, lsl #0x4
    ldr r1, L_020135f0
    mov r0, r0, lsr #0x10
    ldrsb r1, [r1, r0]
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_020135f0: .word data_020d5af8
    .size func_020135a0, . - func_020135a0

