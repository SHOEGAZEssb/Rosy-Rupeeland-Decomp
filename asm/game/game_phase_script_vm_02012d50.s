; Matching retail form; see src/game/game_phase_script_vm_math_opcodes.c.
.text
.extern data_020c9670
.extern func_02012704
.extern func_020127f8

    .global func_02012d50
func_02012d50: ; 0x02012d50
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, L_02012d8c
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02012d8c: .word data_020c9670
    .size func_02012d50, . - func_02012d50

