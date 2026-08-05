; Matching retail form; see src/game/game_phase_actor_script_vm_dispatch.c.
.text
.global func_0201b228
func_0201b228: ; 0x0201b228
    ldr r1, [r0, #0x8c]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x8c]
    bx lr
.size func_0201b228, . - func_0201b228
