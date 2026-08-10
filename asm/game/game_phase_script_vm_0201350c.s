; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern data_021052fc
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_02029a00

    .global func_0201350c
func_0201350c: ; 0x0201350c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r2, r4
    mov r3, r5
    mov r1, r0
    ldr r0, L_02013564
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    bl func_02029a00
    mov r1, r0
    mov r0, r6
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02013564: .word data_021052fc
    .size func_0201350c, . - func_0201350c

