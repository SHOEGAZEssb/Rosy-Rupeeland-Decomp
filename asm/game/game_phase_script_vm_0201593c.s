; Matching retail form; see src/game/game_phase_script_vm_data_table_opcodes.c.
.text
.extern data_021f3d68
.extern func_02012704
.extern func_020127f8
.extern func_02079a7c

    .global func_0201593c
func_0201593c: ; 0x0201593c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r4, r0
    mov r0, r5
    bl func_02012704
    mov r1, r0
    ldr r0, L_02015978
    bl func_02079a7c
    add r0, r0, r4
    ldrb r1, [r0, #0xc]
    mov r0, r5
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02015978: .word data_021f3d68
    .size func_0201593c, . - func_0201593c

