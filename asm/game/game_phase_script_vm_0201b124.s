; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern func_02012608
.extern func_0201b15c
.extern data_020d5b20
.global func_0201b124
func_0201b124: ; 0x0201b124
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, r2
    mov r2, r3
    mov r5, r0
    bl func_02012608
    ldr r1, L_0201b158
    mov r0, r5
    str r1, [r5, #0x0]
    bl func_0201b15c
    mov r0, r5
    str r4, [r5, #0x84]
    ldmia sp!, {r3, r4, r5, pc}
L_0201b158: .word data_020d5b20
.size func_0201b124, . - func_0201b124
