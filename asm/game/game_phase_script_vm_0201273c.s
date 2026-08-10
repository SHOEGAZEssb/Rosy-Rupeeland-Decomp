; Matching retail form; see src/game/game_phase_script_vm_runtime.c.
.text
.extern gGamePhaseScriptVmOpcodeTable
.extern gSystemState

    .global GamePhaseScriptVm_Execute
GamePhaseScriptVm_Execute: ; 0x0201273c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r2, [r4, #0x4]
    mov r3, #0x0
    cmp r2, #0x0
    moveq r0, r3
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r1, #0x0
    beq L_0201279c
    ldrb r1, [r4, #0x7d]
    tst r1, #0x1
    movne r0, r3
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, L_020127e8
    ldrh r1, [r1, #0x6]
    tst r1, #0x8
    beq L_020127e0
    add r1, r2, #0x1
    str r1, [r4, #0x4]
    ldrsb r2, [r2, #0x0]
    ldr r1, L_020127ec
    ldr r1, [r1, r2, lsl #0x2]
    blx r1
    b L_020127e0
L_0201279c:
    ldrb r0, [r4, #0x7d]
    tst r0, #0x1
    movne r0, r3
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r5, L_020127ec
    b L_020127d8
L_020127b4:
    ldr r0, [r4, #0x4]
    mov r1, r0
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    ldrsb r1, [r1, #0x0]
    mov r0, r4
    ldr r1, [r5, r1, lsl #0x2]
    blx r1
    mov r3, r0
L_020127d8:
    cmp r3, #0x0
    beq L_020127b4
L_020127e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_020127e8: .word gSystemState
L_020127ec: .word gGamePhaseScriptVmOpcodeTable
    .size GamePhaseScriptVm_Execute, . - GamePhaseScriptVm_Execute

