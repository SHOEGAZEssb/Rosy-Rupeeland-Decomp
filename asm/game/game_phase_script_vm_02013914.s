; Matching retail form; see src/game/game_phase_script_vm_actor_target_opcodes.c.
.text
.extern func_02012704

    .global func_02013914
func_02013914: ; 0x02013914
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    strb r0, [r1, #0xe6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02013914, . - func_02013914

