; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern data_020d56b4
.extern func_02012628

    .global func_02012608
func_02012608: ; 0x02012608
    stmdb sp!, {r4, lr}
    ldr r3, L_02012624
    mov r4, r0
    str r3, [r4, #0x0]
    bl func_02012628
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02012624: .word data_020d56b4
    .size func_02012608, . - func_02012608

