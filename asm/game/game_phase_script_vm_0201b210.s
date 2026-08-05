; Matching retail form; see src/game/game_phase_actor_script_vm_dispatch.c.
.text
.extern data_020d56e4
.global func_0201b210
func_0201b210: ; 0x0201b210
    stmdb sp!, {r3, lr}
    ldr r2, L_0201b224
    ldr r1, [r2, r1, lsl #0x2]
    blx r1
    ldmia sp!, {r3, pc}
L_0201b224: .word data_020d56e4
.size func_0201b210, . - func_0201b210
