; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.extern func_02012604
.global func_0201b1e0
func_0201b1e0: ; 0x0201b1e0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012604
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0201b1e0, . - func_0201b1e0
