; Matching retail form; see src/game/game_phase_script_vm_sound_extended_command_opcode.c.
.text
.extern func_02012704
.extern func_020593dc
.extern func_02059484
.extern func_020592d8
.extern func_02059200
.extern func_0205936c
.extern func_020592fc
.extern gSoundContext
.global func_0201aa14
func_0201aa14: ; 0x0201aa14
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    bl func_02012704
    mov r5, r0
    mov r0, r7
    bl func_02012704
    mov r4, r0
    mov r0, r7
    bl func_02012704
    mov r6, r0
    mov r0, r7
    bl func_02012704
    sub r0, r0, #0x1a
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_0201ab50
L_0201aa58: ; jump table
    b L_0201aa78 ; case 0
    b L_0201aaa0 ; case 1
    b L_0201aac8 ; case 2
    b L_0201aaf0 ; case 3
    b L_0201ab50 ; case 4
    b L_0201ab50 ; case 5
    b L_0201ab50 ; case 6
    b L_0201ab0c ; case 7
L_0201aa78:
    stmia sp, {r4, r5}
    mov r0, r6, lsl #0x10
    ldr r1, L_0201ab5c
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    ldr r3, [r7, #0x84]
    and r2, r2, #0x7f
    bl func_020593dc
    b L_0201ab50
L_0201aaa0:
    ldr r1, L_0201ab5c
    str r5, [sp, #0x0]
    mov r0, r6, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r3, r4
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_02059484
    b L_0201ab50
L_0201aac8:
    ldr r0, L_0201ab5c
    mov r1, r6, lsl #0x10
    mov r2, r4, lsl #0x10
    mov r3, r5, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_020592d8
    b L_0201ab50
L_0201aaf0:
    ldr r0, L_0201ab5c
    mov r1, r6
    ldr r0, [r0, #0x0]
    mov r2, r4
    mov r3, r5
    bl func_02059200
    b L_0201ab50
L_0201ab0c:
    ldr r0, L_0201ab5c
    mov r1, r6, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl func_0205936c
    mov r1, #0x1
    cmp r5, #0x0
    orrne r0, r0, r1, lsl r4
    mvneq r1, r1, lsl r4
    andeq r0, r0, r1
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, L_0201ab5c
    mov r1, r6, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl func_020592fc
L_0201ab50:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201ab5c: .word gSoundContext
.size func_0201aa14, . - func_0201aa14
