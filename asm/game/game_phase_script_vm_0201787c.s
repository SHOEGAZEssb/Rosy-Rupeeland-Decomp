; Matching retail form; see src/game/game_phase_script_vm_global_object_query_opcodes.c.
.text
.extern data_021f5128
.extern func_02012704
.extern func_020127f8
.extern func_0207a40c
.global func_0201787c
func_0201787c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    ldr r2, L_020178b8
    mov r1, r0
    ldr r0, [r2]
    mov r4, #0
    bl func_0207a40c
    cmp r0, #0
    movne r4, #1
    mov r0, r5
    mov r1, r4
    bl func_020127f8
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_020178b8: .word data_021f5128
    .size func_0201787c, . - func_0201787c
