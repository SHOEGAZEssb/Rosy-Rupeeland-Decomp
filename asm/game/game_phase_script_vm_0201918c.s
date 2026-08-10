; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_SetResult
.extern func_0207f80c
.extern gRuntimeContext
.global func_0201918c
func_0201918c:
    stmdb sp!, {r4, lr}
    ldr r2, L_020191c0
    mov r4, r0
    mov r1, #0x0
    ldr r0, [r2, #0x0]
    mov r2, r1
    mov r3, #0x1
    bl func_0207f80c
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_020191c0: .word gRuntimeContext
.size func_0201918c, . - func_0201918c
