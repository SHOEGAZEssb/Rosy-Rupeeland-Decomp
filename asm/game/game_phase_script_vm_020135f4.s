; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern data_021052fc
.extern func_02005030
.extern func_02005058
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseScriptVm_SetResult

    .global func_020135f4
func_020135f4: ; 0x020135f4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, L_02013648
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02005030
    ldr r1, [sp, #0x4]
    mov r0, r4
    mov r1, r1, asr #0xc
    bl GamePhaseScriptVm_SetResult
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_02013648: .word data_021052fc
    .size func_020135f4, . - func_020135f4

