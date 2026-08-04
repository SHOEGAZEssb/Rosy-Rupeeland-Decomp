; Matching retail form; see src/game/game_phase_script_vm_actor_orientation_opcodes.c.
.text
.extern func_02012704
.extern gSystemState
.global func_02016014
func_02016014:
    stmdb sp!, {r3, lr}
    bl func_02012704
    ldr r1, L_0201602c
    strh r0, [r1, #0x5c]
    mov r0, #0
    ldmia sp!, {r3, pc}
L_0201602c: .word gSystemState
    .size func_02016014, . - func_02016014
