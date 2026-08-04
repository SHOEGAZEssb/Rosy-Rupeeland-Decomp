; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_02030ad4
.extern func_02032e14
.extern func_020337d4

    .global func_02013a34
func_02013a34: ; 0x02013a34
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    ldr r0, [r6, #0x84]
    bl func_020337d4
    mov r1, r4
    bl func_02030ad4
    mov r1, r5
    bl func_02032e14
    mov r1, r0
    mov r0, r6
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02013a34, . - func_02013a34

