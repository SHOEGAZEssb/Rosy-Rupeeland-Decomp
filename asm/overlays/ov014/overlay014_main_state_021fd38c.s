    .text
    .extern GameWork_SetFlag
    .extern data_ov014_021fd930
    .extern data_ov014_021fd938
    .extern data_ov014_021fd958
    .extern data_ov014_021fd968
    .extern func_02092260
    .extern func_ov000_021fc164
    .extern func_ov000_021fc298
    .extern func_ov000_021fc3f8
    .extern func_ov000_021fc424
    .extern func_ov000_021fc450
    .extern func_ov000_021fc460
    .extern func_ov000_021fc4fc
    .extern func_ov000_021fc528
    .extern func_ov000_021fc538
    .extern func_ov000_021fc5ac
    .extern func_ov000_021fc5d4
    .extern func_ov000_021fc5fc
    .extern func_ov000_021fc9d4
    .extern func_ov000_021fca4c
    .extern func_ov000_021fcb98
    .extern func_ov000_021fcc18
    .extern func_ov000_021fcca8
    .extern func_ov000_021fccfc
    .extern func_ov014_021fce14
    .extern func_ov014_021fd2f8
    .extern gGameWork

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_state_machines.c. */
    .global func_ov014_021fd38c

func_ov014_021fd38c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fd650
L_021fd3a4: ; jump table
    b L_021fd3b4 ; case 0
    b L_021fd3e0 ; case 1
    b L_021fd420 ; case 2
    b L_021fd60c ; case 3
L_021fd3b4:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc3f8
    mov r0, r4
    mov r1, #0x0
    bl func_ov014_021fd2f8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd650
L_021fd3e0:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_021fd414
    mov r0, r4
    mov r1, #0x0
    bl func_ov014_021fd2f8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd420
L_021fd414:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc460 ; func_ov001_021fc460
    b L_021fd650
L_021fd420:
    ldr r0, [r4, #0x78]
    ldr r1, [r4, #0x2c]
    bl func_ov000_021fcb98
    cmp r0, #0x0
    bne L_021fd5a4
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fd5a4
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fcca8
    cmp r0, #0x0
    bne L_021fd5a4
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fd5a4
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fc298
    mov r5, r0
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fcc18
    cmp r0, #0x0
    bne L_021fd5a4
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fccfc
    cmp r0, #0x0
    beq L_021fd4b4
    ldr r1, L_021fd668
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
    b L_021fd650
L_021fd4b4:
    cmp r5, #0x0
    blt L_021fd4f8
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r4, #0x78]
    ldr r1, [r0, #0x25c]
    cmp r5, r1
    beq L_021fd650
    mov r1, r5
    bl func_ov000_021fca4c
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc9d4
    mov r0, r4
    mov r1, #0x0
    bl func_ov014_021fd2f8
    b L_021fd650
L_021fd4f8:
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fc5ac
    cmp r0, #0x0
    beq L_021fd52c
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fd66c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
    b L_021fd650
L_021fd52c:
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fc5d4
    cmp r0, #0x0
    beq L_021fd560
    mov r0, r4
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_021fd670
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
    b L_021fd650
L_021fd560:
    ldr r0, [r4, #0x78]
    add r1, r4, #0x30
    bl func_ov000_021fc5fc
    cmp r0, #0x0
    beq L_021fd5a4
    mov r0, r4
    mov r1, #0xb
    bl func_02092260
    ldr r0, L_021fd674
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_021fd678
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov014_021fce14
    b L_021fd650
L_021fd5a4:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc424
    cmp r0, #0x0
    beq L_021fd5d8
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd650
L_021fd5d8:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc4fc
    cmp r0, #0x0
    beq L_021fd650
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd650
L_021fd60c:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc528
    cmp r0, #0x0
    beq L_021fd634
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd650
L_021fd634:
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc538
    cmp r0, #0x0
    beq L_021fd650
    mov r0, r4
    mov r1, #0x0
    bl func_ov014_021fd2f8
L_021fd650:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq L_021fd660
    bl func_ov000_021fc164
L_021fd660:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd668: .word data_ov014_021fd968
L_021fd66c: .word data_ov014_021fd938
L_021fd670: .word data_ov014_021fd958
L_021fd674: .word gGameWork
L_021fd678: .word data_ov014_021fd930
    .size func_ov014_021fd38c, . - func_ov014_021fd38c
