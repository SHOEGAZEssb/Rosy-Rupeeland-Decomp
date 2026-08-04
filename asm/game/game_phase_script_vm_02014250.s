; Matching retail form; see src/game/game_phase_script_vm_display_opcodes.c.
.text
.extern func_02002d94
.extern func_02002db0
.extern func_02012704
.extern func_020127f8

    .global func_02014250
func_02014250: ; 0x02014250
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    cmp r0, #0x1
    beq L_02014270
    cmp r0, #0x2
    beq L_02014284
    b L_02014298
L_02014270:
    bl func_02002d94
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b L_020142bc
L_02014284:
    bl func_02002db0
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    b L_020142bc
L_02014298:
    bl func_02002d94
    cmp r0, #0x0
    beq L_020142b0
    bl func_02002db0
    cmp r0, #0x0
    bne L_020142b8
L_020142b0:
    mov r1, #0x1
    b L_020142bc
L_020142b8:
    mov r1, #0x0
L_020142bc:
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_02014250, . - func_02014250

