.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_020f4e14
.extern data_ov022_02200518
.extern data_ov022_02200530
.extern data_ov022_02200550
.extern func_02002d94
.extern func_020755bc
.extern func_02092260
.extern func_02092c8c
.extern func_020939d8
.extern func_02094d28
.extern func_02095820
.extern func_02095860
.extern func_02095928
.extern func_02095940
.extern func_02095988
.extern func_ov022_021fceb0
.extern func_ov022_021fdafc
.extern func_ov022_021fdb38
.extern func_ov022_021fdd1c
.extern func_ov022_021fe898
.extern func_ov022_021fefe0
.extern func_ov022_021ff048
.extern func_ov022_021ff0d0
.extern func_ov022_021ff1e4
.extern func_ov022_021ff2c4
.extern func_ov022_021ff368
.extern GameWork_ClearFlag
.extern gGameWork


    .global func_ov022_021ff5ec
func_ov022_021ff5ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov022_021ff368
    ldr r0, [r4, #0x4]
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b L_021ff9f0
L_021ff608: ; jump table
    b L_021ff63c ; case 0
    b L_021ff698 ; case 1
    b L_021ff6bc ; case 2
    b L_021ff7fc ; case 3
    b L_021ff8b8 ; case 4
    b L_021ff9f0 ; case 5
    b L_021ff9f0 ; case 6
    b L_021ff9f0 ; case 7
    b L_021ff9f0 ; case 8
    b L_021ff9f0 ; case 9
    b L_021ff908 ; case 10
    b L_021ff95c ; case 11
    b L_021ff9a0 ; case 12
L_021ff63c:
    ldr r1, [r4, #0x48]
    mov r0, r4
    bic r1, r1, #0x2
    str r1, [r4, #0x48]
    ldr r2, [r4, #0xa4]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl func_ov022_021ff1e4
    ldr r0, [r4, #0x2b0]
    cmp r0, #0x0
    movne r0, #0xa
    strne r0, [r4, #0x4]
    movne r0, #0x0
    strne r0, [r4, #0x8]
    bne L_021ff9f0
    add r0, r4, #0xa8
    bl func_02095928
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff698:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021ff9f0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff6bc:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021ff9f0
    add r0, r4, #0xa8
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff710
    ldr r0, [r4, #0x2cc]
    bl func_020939d8
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021ffa00
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_021ff9f0
L_021ff710:
    add r0, r4, #0x154
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff788
    ldr r0, [r4, #0x2b4]
    cmp r0, #0x0
    beq L_021ff778
    ldr r0, [r4, #0x2cc]
    bl func_020939d8
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x2c0]
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff778:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_021ff9f0
L_021ff788:
    add r0, r4, #0x200
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff9f0
    ldr r0, [r4, #0x2b8]
    cmp r0, #0x0
    beq L_021ff7ec
    ldr r0, [r4, #0x2cc]
    bl func_020939d8
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    mov r0, #0x1
    str r0, [r4, #0x2c0]
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff7ec:
    mov r0, r4
    mov r1, #0x9
    bl func_02092260
    b L_021ff9f0
L_021ff7fc:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021ff9f0
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    bne L_021ff854
    ldr r0, L_021ffa04
    ldr r0, [r0, #0x0]
    bl func_020755bc
    add r0, r4, #0xa8
    bl func_02095940
    add r0, r4, #0x154
    mvn r1, #0x3f
    mov r2, #0x40
    bl func_02095820
    add r0, r4, #0x200
    mvn r1, #0x3f
    mov r2, #0x70
    bl func_02095820
    mov r0, r4
    bl func_ov022_021fe898
    b L_021ff894
L_021ff854:
    ldr r0, [r4, #0x2b8]
    bl func_ov022_021fdafc
    ldr r0, [r4, #0x2b8]
    bl func_ov022_021fdb38
    mov r0, r4
    bl func_ov022_021fefe0
    mov r0, r4
    bl func_ov022_021ff048
    add r0, r4, #0x154
    mvn r1, #0x3f
    mov r2, #0x40
    bl func_02095820
    add r0, r4, #0x200
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
L_021ff894:
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff8b8:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021ff9f0
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    bne L_021ff8f4
    ldr r0, L_021ffa08
    ldr r1, L_021ffa0c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021ffa10
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_021ff9f0
L_021ff8f4:
    ldr r1, L_021ffa14
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
    b L_021ff9f0
L_021ff908:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021ff9f0
    ldr r1, L_021ffa18
    mov r2, #0x0
    mov r0, r4
    str r2, [r4, #0x2b0]
    bl func_ov022_021ff2c4
    add r0, r4, #0x200
    mov r1, #0x80
    mov r2, #0xd0
    bl func_02095820
    add r0, r4, #0x200
    mov r1, #0x2
    bl func_02095988
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff95c:
    mov r0, r4
    bl func_ov022_021ff368
    cmp r0, #0x0
    beq L_021ff9f0
    mov r0, r4
    mov r1, #0x2e
    bl func_02092260
    add r0, r4, #0x200
    bl func_02095928
    mov r0, #0x1e
    str r0, [r4, #0x27c]
    mov r1, #0x0
    str r1, [r4, #0x280]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_021ff9f0
L_021ff9a0:
    add r0, r4, #0x200
    bl func_ov022_021fceb0
    cmp r0, #0x0
    beq L_021ff9cc
    add r0, r4, #0xa8
    bl func_02095928
    mov r0, #0x2
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021ff9f0
L_021ff9cc:
    add r0, r4, #0x200
    mov r1, #0x4
    mov r2, #0xd0
    mov r3, #0x70
    bl func_02094d28
    mov r2, r0
    add r0, r4, #0x200
    mov r1, #0x80
    bl func_02095820
L_021ff9f0:
    mov r0, r4
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ffa00: .word data_ov022_02200530
L_021ffa04: .word data_020f4e14
L_021ffa08: .word gGameWork
L_021ffa0c: .word 0x3ca
L_021ffa10: .word data_ov022_02200550
L_021ffa14: .word data_ov022_02200518
L_021ffa18: .word 0x312
.size func_ov022_021ff5ec, .-func_ov022_021ff5ec

