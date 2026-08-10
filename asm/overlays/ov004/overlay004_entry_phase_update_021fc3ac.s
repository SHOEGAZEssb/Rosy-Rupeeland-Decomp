    .text
    .extern func_020922f0
    .extern func_020592fc
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern func_ov004_021fb6e4
    .extern func_ov004_021fbf10
    .extern gSoundContext
    .extern data_020f4e14
    .extern gDebugFont
    .extern data_ov004_021fcd40
    .global func_ov004_021fc3ac
func_ov004_021fc3ac: ; 0x021fc3ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fc3cc
    cmp r1, #0x1
    beq L_021fc528
    b L_021fc538
L_021fc3cc:
    mov r1, #0xcc
    bl func_020922f0
    ldr r0, [r4, #0x150]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fc4e8
L_021fc3e4: ; jump table
    b L_021fc4e8 ; case 0
    b L_021fc410 ; case 1
    b L_021fc428 ; case 2
    b L_021fc440 ; case 3
    b L_021fc458 ; case 4
    b L_021fc470 ; case 5
    b L_021fc488 ; case 6
    b L_021fc4a0 ; case 7
    b L_021fc4b8 ; case 8
    b L_021fc4d0 ; case 9
    b L_021fc4e8 ; case 10
L_021fc410:
    ldr r0, L_021fc548
    mov r1, #0xcc
    ldr r0, [r0, #0x0]
    mov r2, #0x4400
    bl func_020592fc
    b L_021fc4fc
L_021fc428:
    ldr r0, L_021fc548
    ldr r2, L_021fc54c
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc440:
    ldr r0, L_021fc548
    ldr r2, L_021fc550
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc458:
    ldr r0, L_021fc548
    ldr r2, L_021fc554
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc470:
    ldr r0, L_021fc548
    ldr r2, L_021fc558
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc488:
    ldr r0, L_021fc548
    ldr r2, L_021fc55c
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc4a0:
    ldr r0, L_021fc548
    ldr r2, L_021fc560
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc4b8:
    ldr r0, L_021fc548
    ldr r2, L_021fc564
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc4d0:
    ldr r0, L_021fc548
    ldr r2, L_021fc568
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
    b L_021fc4fc
L_021fc4e8:
    ldr r0, L_021fc548
    ldr r2, L_021fc56c
    ldr r0, [r0, #0x0]
    mov r1, #0xcc
    bl func_020592fc
L_021fc4fc:
    ldr r0, L_021fc570
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fc574
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fc528:
    ldr r1, L_021fc578
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
L_021fc538:
    mov r0, r4
    bl func_ov004_021fbf10
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fc548: .word gSoundContext
L_021fc54c: .word 0xc408
L_021fc550: .word 0xc448
L_021fc554: .word 0xc468
L_021fc558: .word 0xc668
L_021fc55c: .word 0xc6e8
L_021fc560: .word 0xc6f8
L_021fc564: .word 0xc7f8
L_021fc568: .word 0xc7fa
L_021fc56c: .word 0xc7fb
L_021fc570: .word data_020f4e14
L_021fc574: .word gDebugFont
L_021fc578: .word data_ov004_021fcd40
    .size func_ov004_021fc3ac, .-func_ov004_021fc3ac

