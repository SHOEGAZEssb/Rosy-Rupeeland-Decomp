; Matching retail form; see src/game/game_phase_script_vm_math_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_020ae024

    .global func_02012d90
func_02012d90: ; 0x02012d90
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r4, r0, lsl #0xc
    mov r0, r5
    bl func_02012704
    mov r1, r4
    mov r0, r0, lsl #0xc
    bl func_020ae024
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r1, asr #0x7
    add r1, r1, r0, lsr #0x18
    mov r0, r5
    mov r1, r1, asr #0x8
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02012d90, . - func_02012d90

