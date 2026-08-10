; Matching retail form; see src/game/game_phase_script_vm_gamework_flag_opcodes.c.
.text
.extern GameWork_SetFlag
.extern GamePhaseScriptVm_Pop
.extern gGameWork

    .global func_02013c7c
func_02013c7c: ; 0x02013c7c
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02013c9c
    mov r1, r0
    ldr r0, [r2, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02013c9c: .word gGameWork
    .size func_02013c7c, . - func_02013c7c

