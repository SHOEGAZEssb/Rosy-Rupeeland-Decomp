; Matching retail form; see src/game/game_phase_script_vm_actor_query_opcodes.c.
.text
.extern func_02012704

    .global func_02013568
func_02013568: ; 0x02013568
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    str r0, [r1, #0x3c]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013568, . - func_02013568

