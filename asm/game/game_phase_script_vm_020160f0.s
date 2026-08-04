; Matching retail form; see src/game/game_phase_script_vm_u16_table_update_opcodes.c.
.text
.extern data_021e9ac0
.extern func_02012704
.extern func_020638b0
.global func_020160f0
func_020160f0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    mov r1, r4, lsl #16
    mov r2, r1, lsr #16
    mov r1, r5, lsl #16
    mov r0, r0, lsl #16
    mov r3, r1, lsr #16
    mov r1, r0, lsr #16
    ldr r0, L_02016140
    ldr r0, [r0]
    bl func_020638b0
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
L_02016140: .word data_021e9ac0
    .size func_020160f0, . - func_020160f0
