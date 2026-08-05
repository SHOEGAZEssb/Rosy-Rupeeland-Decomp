; Matching retail form; see src/game/game_phase_script_vm_sound_utility_opcodes.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_02058ce0
.extern func_02059218
.extern func_02059510
.extern func_020595d4
.extern func_020595ec
.extern func_02059a00
.extern gSoundContext
.global func_0201a554
func_0201a554:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    sub r0, r0, #0xf
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_0201a608
L_0201a570: ; jump table
    b L_0201a588 ; case 0
    b L_0201a5bc ; case 1
    b L_0201a5cc ; case 2
    b L_0201a5dc ; case 3
    b L_0201a5ec ; case 4
    b L_0201a5fc ; case 5
L_0201a588:
    ldr r0, L_0201a610
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02059510
    cmp r0, #0x0
    mov r0, r4
    beq L_0201a5b0
    mov r1, #0x1
    bl func_020127f8
    b L_0201a608
L_0201a5b0:
    mov r1, #0x0
    bl func_020127f8
    b L_0201a608
L_0201a5bc:
    ldr r0, L_0201a610
    ldr r0, [r0, #0x0]
    bl func_020595d4
    b L_0201a608
L_0201a5cc:
    ldr r0, L_0201a610
    ldr r0, [r0, #0x0]
    bl func_020595ec
    b L_0201a608
L_0201a5dc:
    ldr r0, L_0201a610
    ldr r0, [r0, #0x0]
    bl func_02058ce0
    b L_0201a608
L_0201a5ec:
    ldr r0, L_0201a610
    ldr r0, [r0, #0x0]
    bl func_02059218
    b L_0201a608
L_0201a5fc:
    ldr r0, L_0201a610
    ldr r0, [r0, #0x0]
    bl func_02059a00
L_0201a608:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201a610: .word gSoundContext
.size func_0201a554, . - func_0201a554
