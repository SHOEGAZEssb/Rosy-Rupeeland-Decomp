    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_list.c. */
    .extern data_ov016_022013c8
    .extern data_ov016_02201450
    .extern func_020628c8
    .extern func_02092260
    .extern func_02093d50
    .extern func_02093de4
    .extern func_02093e0c
    .extern func_02093e20
    .extern func_02093e3c
    .extern func_02093e58
    .extern func_02093ffc
    .extern func_020945c8
    .extern func_02094600
    .extern func_02094638
    .extern func_02094668
    .extern func_02094698
    .extern func_02094758
    .extern func_02094874
    .extern func_02095860
    .extern func_02095dd4
    .extern func_ov016_021fd3f8
    .extern func_ov016_021fd5b8
    .extern func_ov016_021fd628
    .extern func_ov016_021fd640
    .extern func_ov016_021fe728
    .extern func_ov016_021fe754
    .extern func_ov016_021ff7bc
    .extern func_ov016_021ff908
    .extern func_ov016_021ff9b8
    .extern func_ov016_021ffba4
    .extern func_ov016_021ffbd8
    .extern func_ov016_021fffcc
.global func_ov016_0220007c
func_ov016_0220007c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x444]
    ldr r0, [r6, #0x4]
    ldr r5, [r1, #0x58]
    cmp r0, #0xa
    bgt L_022000d0
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b L_02200470
L_022000a4: ; jump table
    b L_022000dc ; case 0
    b L_022000f8 ; case 1
    b L_02200144 ; case 2
    b L_02200370 ; case 3
    b L_022003f0 ; case 4
    b L_02200470 ; case 5
    b L_02200470 ; case 6
    b L_02200470 ; case 7
    b L_02200470 ; case 8
    b L_02200470 ; case 9
    b L_02200438 ; case 10
L_022000d0:
    cmp r0, #0x14
    beq L_02200454
    b L_02200470
L_022000dc:
    mov r0, r5
    bl func_02094874
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
L_022000f8:
    mov r0, r5
    bl func_02093ffc
    cmp r0, #0x0
    beq L_02200128
    mov r0, r6
    bl func_ov016_021ffbd8
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200144
L_02200128:
    ldr r0, [r6, #0x444]
    bl func_ov016_021fd640
    cmp r0, #0x0
    beq L_02200470
    mov r0, r6
    bl func_ov016_021ffba4
    b L_02200470
L_02200144:
    mov r0, r5
    bl func_02093de4
    ldr r0, [r6, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_02200168
    mov r0, r5
    bl func_02093e0c
    b L_0220033c
L_02200168:
    tst r0, #0x80
    beq L_0220017c
    mov r0, r5
    bl func_02093e20
    b L_0220033c
L_0220017c:
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_0220033c
    ldr r0, [r6, #0x444]
    add r1, r6, #0x30
    bl func_ov016_021fd5b8
    mov r4, r0
    mov r0, r5
    add r1, r6, #0x30
    bl func_02094638
    cmp r0, #0x0
    mov r0, r5
    beq L_022001bc
    bl func_02093e3c
    b L_0220033c
L_022001bc:
    add r1, r6, #0x30
    bl func_02094668
    cmp r0, #0x0
    beq L_022001d8
    mov r0, r5
    bl func_02093e58
    b L_0220033c
L_022001d8:
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_0220033c
    mov r0, r5
    add r1, r6, #0x30
    bl func_020945c8
    cmp r0, #0x0
    mov r0, r5
    beq L_0220021c
    bl func_02093e3c
    cmp r0, #0x0
    bne L_0220033c
    mov r0, r6
    mov r1, #0x16
    bl func_02092260
    b L_0220033c
L_0220021c:
    add r1, r6, #0x30
    bl func_02094600
    cmp r0, #0x0
    mov r0, r5
    beq L_0220024c
    bl func_02093e58
    cmp r0, #0x0
    bne L_0220033c
    mov r0, r6
    mov r1, #0x16
    bl func_02092260
    b L_0220033c
L_0220024c:
    add r1, r6, #0x30
    bl func_02094698
    cmp r0, #0x0
    beq L_02200280
    ldr r0, [r6, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200280
    ldr r1, L_02200480
    mov r0, r6
    ldmia r1, {r1, r2}
    bl func_ov016_021fe754
    b L_02200470
L_02200280:
    cmp r4, #0x0
    blt L_022002d8
    ldr r0, [r5, #0x14]
    cmp r4, r0
    mov r0, r6
    beq L_022002d0
    mov r1, #0x0
    bl func_02092260
    mov r0, r5
    mov r1, r4
    bl func_02093d50
    mov r0, r6
    bl func_ov016_021ffba4
    mov r0, r6
    bl func_ov016_021ffbd8
    mov r0, #0x14
    str r0, [r6, #0x4]
    mov r0, #0x0
    str r0, [r6, #0x8]
    b L_02200470
L_022002d0:
    bl func_ov016_021fffcc
    b L_02200470
L_022002d8:
    add r0, r6, #0xe8
    add r1, r6, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_02200300
    mov r0, r6
    bl func_ov016_021fffcc
    b L_02200470
L_02200300:
    add r0, r6, #0x194
    add r1, r6, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_0220033c
    mov r0, r6
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_02200484
    mov r0, r6
    ldmia r1, {r1, r2}
    bl func_ov016_021fe754
    b L_02200470
L_0220033c:
    mov r0, r5
    bl func_02094758
    cmp r0, #0x0
    beq L_02200470
    mov r0, r6
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_02200370:
    add r0, r6, #0xe8
    bl func_ov016_021fe728
    cmp r0, #0x0
    beq L_02200470
    ldr r0, [r6, #0x444]
    bl func_ov016_021fd628
    ldrh r1, [r0, #0xc]
    and r1, r1, #0x4
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_022003b4
    mov r2, #0x0
    mov r0, r6
    mov r3, r2
    mov r1, #0x1c
    bl func_ov016_021ff908
    b L_022003d8
L_022003b4:
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x4
    bl func_020628c8
    mov r3, r0
    mov r0, r6
    mov r1, #0xe
    mov r2, #0x0
    bl func_ov016_021ff908
L_022003d8:
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_022003f0:
    ldr r1, [r6, #0x20]
    ldr r0, [r6, #0x460]
    mov r2, r1, lsl #0x1a
    add r1, r6, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02200470
    mov r0, r6
    bl func_ov016_021ff9b8
    ldr r0, [r6, #0x444]
    bl func_ov016_021fd3f8
    ldr r1, [r6, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x2
    str r1, [r6, #0x4]
    str r0, [r6, #0x8]
    b L_02200470
L_02200438:
    add r0, r6, #0xe8
    bl func_ov016_021fe728
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x4]
    strne r0, [r6, #0x8]
    b L_02200470
L_02200454:
    ldr r0, [r6, #0x8]
    add r0, r0, #0x1
    str r0, [r6, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r6, #0x4]
    strgt r0, [r6, #0x8]
L_02200470:
    mov r0, r6
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02200480: .word data_ov016_02201450
L_02200484: .word data_ov016_022013c8
    .size func_ov016_0220007c, . - func_ov016_0220007c

