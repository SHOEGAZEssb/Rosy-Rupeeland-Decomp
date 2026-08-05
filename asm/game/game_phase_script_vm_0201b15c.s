; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.global func_0201b15c
func_0201b15c: ; 0x0201b15c
    mov r1, #0x0
    str r1, [r0, #0x88]
    ldr r2, [r0, #0x8c]
    sub r1, r1, #0x80
    bic r2, r2, #0x1
    bic r2, r2, #0x2
    str r2, [r0, #0x8c]
    strb r1, [r0, #0x90]
    bx lr
.size func_0201b15c, . - func_0201b15c
