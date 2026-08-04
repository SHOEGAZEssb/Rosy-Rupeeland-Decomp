; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern func_02012668

    .global func_0201264c
func_0201264c: ; 0x0201264c
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, r1
    ldmeqia sp!, {r4, pc}
    bl func_02012668
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201264c, . - func_0201264c

