; Matching retail form; see src/game/game_phase_actor_script_vm_lifecycle.c.
.text
.global func_0201b1ac
func_0201b1ac: ; 0x0201b1ac
    ldr r2, [r1, #0x84]
    str r2, [r0, #0x84]
    ldr r2, [r1, #0x88]
    str r2, [r0, #0x88]
    ldr r1, [r1, #0x8c]
    ldr r2, [r0, #0x8c]
    mov r1, r1, lsl #0x1f
    mov r1, r1, asr #0x1f
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    str r1, [r0, #0x8c]
    bx lr
.size func_0201b1ac, . - func_0201b1ac
