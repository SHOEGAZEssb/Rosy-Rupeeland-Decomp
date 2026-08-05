; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern func_02012564
.extern func_0201b15c
.extern data_020d5b20
.global func_0201b0f4
func_0201b0f4: ; 0x0201b0f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012564
    ldr r1, L_0201b120
    mov r0, r4
    str r1, [r4, #0x0]
    bl func_0201b15c
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x84]
    ldmia sp!, {r4, pc}
L_0201b120: .word data_020d5b20
.size func_0201b0f4, . - func_0201b0f4
