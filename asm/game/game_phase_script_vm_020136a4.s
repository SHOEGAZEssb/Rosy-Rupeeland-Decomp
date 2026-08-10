; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern data_021052fc
.extern func_02005030
.extern func_02005058
.extern GamePhaseRuntime_GetActorCollection
.extern func_020127f8

    .global func_020136a4
func_020136a4: ; 0x020136a4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, L_020136f8
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02005030
    ldr r1, [sp, #0xc]
    mov r0, r4
    mov r1, r1, asr #0xc
    bl func_020127f8
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_020136f8: .word data_021052fc
    .size func_020136a4, . - func_020136a4

