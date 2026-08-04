; Matching retail form; see src/game/game_phase_script_vm_runtime_misc_opcodes.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_021052fc
.extern func_02007f0c
.extern func_02012704
.extern gGameWork
.global func_02016814
func_02016814:
    stmdb sp!, {r3, lr}
    bl func_02012704
    cmp r0, #0
    mov r1, #0x3ec
    beq L_02016858
    ldr r0, L_02016890
    ldr r0, [r0]
    bl GameWork_SetFlag
    ldr r0, L_02016894
    mov r1, #1
    ldr r0, [r0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    ldr r0, [r1, #0x230]
    orr r0, r0, #4
    b L_02016884
L_02016858:
    ldr r0, L_02016890
    ldr r0, [r0]
    bl GameWork_ClearFlag
    ldr r0, L_02016894
    mov r1, #1
    ldr r0, [r0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    ldr r0, [r1, #0x230]
    bic r0, r0, #4
L_02016884:
    str r0, [r1, #0x230]
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02016890: .word gGameWork
L_02016894: .word data_021052fc
    .size func_02016814, . - func_02016814
