; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text
.extern func_02012584

    .global func_02012628
func_02012628: ; 0x02012628
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02012584
    str r5, [r6, #0x8]
    str r5, [r6, #0x4]
    str r4, [r6, #0x80]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02012628, . - func_02012628

