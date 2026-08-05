; Matching retail form; see src/game/game_phase_script_vm_indexed_object_command_opcodes.c.
.text
.extern data_021f5128
.extern func_02012704
.extern func_0207ac84
.extern func_0207b334
.extern func_0207c5c8
.global func_02017818
func_02017818:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    ldr r1, L_02017878
    ldr r1, [r1]
    ldr r6, [r1, r0, lsl #2]
    mov r0, r4
    bl func_0207b334
    mov r2, r4
    mov r1, r0
    mov r0, r6
    bl func_0207ac84
    cmp r0, #0
    beq L_02017870
    mov r1, r5
    bl func_0207c5c8
L_02017870:
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02017878: .word data_021f5128
    .size func_02017818, . - func_02017818
