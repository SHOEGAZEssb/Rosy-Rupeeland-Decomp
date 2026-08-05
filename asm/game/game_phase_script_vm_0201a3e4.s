; Matching retail form; see src/game/game_phase_script_vm_value_generation_opcode.c.
.text
.extern func_0200964c
.extern func_020096f0
.extern func_02012704
.extern func_020127f8
.extern func_020befec
.extern gSystemState
.extern OS_Halt
.global func_0201a3e4
func_0201a3e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    bl func_02012704
    mov r8, r0
    mov r0, r4
    bl func_02012704
    mov r7, r0
    mov r0, r4
    bl func_02012704
    mov r6, r0
    mov r0, r4
    bl func_02012704
    mov r5, r0
    mov r0, r4
    bl func_02012704
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_0201a4ec
L_0201a430: ; jump table
    b L_0201a4ec ; case 0
    b L_0201a444 ; case 1
    b L_0201a474 ; case 2
    b L_0201a4a0 ; case 3
    b L_0201a4cc ; case 4
L_0201a444:
    add r0, sp, #0x20
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_0200964c
    ldr r1, L_0201a508
    add r0, sp, #0x20
    ldr r1, [r1, #0x64]
    mov r2, #0x0
    bl func_020096f0
    mov r9, r0
    b L_0201a4f0
L_0201a474:
    add r0, sp, #0x14
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_0200964c
    add r0, sp, #0x14
    mov r1, r8
    mov r2, #0x0
    bl func_020096f0
    mov r9, r0
    b L_0201a4f0
L_0201a4a0:
    add r0, sp, #0x8
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_0200964c
    add r0, sp, #0x8
    mov r1, r8
    mov r2, #0x1
    bl func_020096f0
    mov r9, r0
    b L_0201a4f0
L_0201a4cc:
    sub r0, r6, r5
    mov r1, r7
    mov r0, r0, lsl #0xc
    bl func_020befec
    mul r1, r0, r8
    add r0, r1, r5, lsl #0xc
    mov r9, r0, asr #0xc
    b L_0201a4f0
L_0201a4ec:
    bl OS_Halt
L_0201a4f0:
    mov r0, r4
    mov r1, r9
    bl func_020127f8
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_0201a508: .word gSystemState
.size func_0201a3e4, . - func_0201a3e4
