; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern func_02012704
.extern func_02033ae8

    .global func_02012cd4
func_02012cd4: ; 0x02012cd4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0
    ldr r0, [r4, #0x84]
    ldr r2, [r0, #0x54]
    cmp r2, #0x0
    beq L_02012cf8
    bl func_02033ae8
L_02012cf8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02012cd4, . - func_02012cd4

