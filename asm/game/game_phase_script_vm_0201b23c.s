; Matching retail form; see src/game/game_phase_actor_script_vm_dispatch.c.
.text
.global func_0201b23c
func_0201b23c: ; 0x0201b23c
    ldr r0, [r0, #0x8c]
    mov r0, r0, lsl #0x1f
    mov r0, r0, asr #0x1f
    bx lr
.size func_0201b23c, . - func_0201b23c
