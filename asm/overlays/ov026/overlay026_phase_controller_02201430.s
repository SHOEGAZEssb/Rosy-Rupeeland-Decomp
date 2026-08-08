.text

/* Exact fallback; see src/overlays/ov026/overlay026_phase_controller.c. */
.extern data_ov026_022045b0
.extern data_ov026_022045f8
.extern data_ov026_02204668
.extern data_ov026_02204680
.extern data_ov026_022046c0
.extern data_ov026_02204708
.extern data_ov026_02204718
.extern data_ov026_02204720
.extern data_ov026_02204738
.extern data_ov026_02204740
.extern data_ov026_02204748
.extern func_020592fc
.extern func_020594ec
.extern func_020922f0
.extern func_ov026_021ff878
.extern func_ov026_022009dc
.extern gSoundContext


    .global func_ov026_02201430
func_ov026_02201430:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02201450
    cmp r1, #0x1
    beq L_02201490
    b L_02201680
L_02201450:
    ldr r2, [r4, #0x54]
    ldr r1, L_02201690
    cmp r2, r1
    bne L_02201474
    ldr r0, L_02201694
    mov r1, #0x1b
    ldr r0, [r0, #0x0]
    bl func_020594ec
    b L_0220147c
L_02201474:
    mov r1, #0x3d
    bl func_020922f0
L_0220147c:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201490:
    ldr r1, [r4, #0x54]
    cmp r1, #0xa
    bgt L_022014d4
    cmp r1, #0x0
    addge pc, pc, r1, lsl #0x2
    b L_02201670
L_022014a8: ; jump table
    b L_02201670 ; case 0
    b L_022014e0 ; case 1
    b L_02201508 ; case 2
    b L_02201530 ; case 3
    b L_02201558 ; case 4
    b L_02201580 ; case 5
    b L_022015a8 ; case 6
    b L_022015d0 ; case 7
    b L_022015f8 ; case 8
    b L_02201620 ; case 9
    b L_02201648 ; case 10
L_022014d4:
    ldr r0, L_02201690
    cmp r1, r0
    b L_02201670
L_022014e0:
    ldr r0, L_02201694
    mov r1, #0x3d
    ldr r0, [r0, #0x0]
    mov r2, #0x4400
    bl func_020592fc
    ldr r1, L_02201698
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201508:
    ldr r0, L_02201694
    ldr r2, L_0220169c
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016a0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201530:
    ldr r0, L_02201694
    ldr r2, L_022016a4
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016a8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201558:
    ldr r0, L_02201694
    ldr r2, L_022016ac
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016b0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201580:
    ldr r0, L_02201694
    ldr r2, L_022016b4
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016b8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_022015a8:
    ldr r0, L_02201694
    ldr r2, L_022016bc
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016c0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_022015d0:
    ldr r0, L_02201694
    ldr r2, L_022016c4
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016c8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_022015f8:
    ldr r0, L_02201694
    ldr r2, L_022016cc
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016d0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201620:
    ldr r0, L_02201694
    ldr r2, L_022016d4
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016d8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201648:
    ldr r0, L_02201694
    ldr r2, L_022016dc
    ldr r0, [r0, #0x0]
    mov r1, #0x3d
    bl func_020592fc
    ldr r1, L_022016e0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
    b L_02201680
L_02201670:
    ldr r1, L_022016e4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov026_021ff878
L_02201680:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201690: .word 0x3e7
L_02201694: .word gSoundContext
L_02201698: .word data_ov026_02204740
L_0220169c: .word 0xc408
L_022016a0: .word data_ov026_02204738
L_022016a4: .word 0xc448
L_022016a8: .word data_ov026_022045f8
L_022016ac: .word 0xc468
L_022016b0: .word data_ov026_02204708
L_022016b4: .word 0xc668
L_022016b8: .word data_ov026_022046c0
L_022016bc: .word 0xc6e8
L_022016c0: .word data_ov026_02204720
L_022016c4: .word 0xc6f8
L_022016c8: .word data_ov026_02204718
L_022016cc: .word 0xc7f8
L_022016d0: .word data_ov026_02204680
L_022016d4: .word 0xc7fa
L_022016d8: .word data_ov026_022045b0
L_022016dc: .word 0xc7fb
L_022016e0: .word data_ov026_02204748
L_022016e4: .word data_ov026_02204668
.size func_ov026_02201430, .-func_ov026_02201430

