.text

/* Exact fallback; see src/overlays/ov029/overlay029_resolution_state.c. */
.extern data_ov029_021febbc
.extern data_ov029_021fec10
.extern data_ov029_021fec48
.extern data_ov029_021fec68
.extern data_ov029_021fec78
.extern data_ov029_021fec80
.extern data_ov029_021fec88
.extern data_ov029_021fec90
.extern data_ov029_021fec98
.extern data_ov029_021fed28
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_0209189c
.extern func_02092260
.extern func_02092288
.extern func_02092c8c
.extern func_020948e4
.extern func_02094cf0
.extern func_02095224
.extern func_020befec
.extern func_ov002_021fbe68
.extern func_ov029_021fce4c
.extern func_ov029_021fd6fc
.extern func_ov029_021fd7a8
.extern func_ov029_021fd850
.extern func_ov029_021fd95c
.extern func_ov029_021fd988
.extern func_ov029_021fd9b4
.extern func_ov029_021fe780
.extern func_ov029_021fe798
.extern func_ov045_0220bc40
.extern func_ov045_0220bd90
.extern func_ov045_0220bdb0
.extern func_ov045_0220bdf0
.extern GameWork_SetFlag
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov029_021fe0cc
func_ov029_021fe0cc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b L_021fe73c
L_021fe0e4: ; jump table
    b L_021fe100 ; case 0
    b L_021fe120 ; case 1
    b L_021fe1a4 ; case 2
    b L_021fe1e8 ; case 3
    b L_021fe640 ; case 4
    b L_021fe6b0 ; case 5
    b L_021fe70c ; case 6
L_021fe100:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fe120:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fe73c
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    mov r0, r4
    bne L_021fe148
    mov r1, #0x6d
    bl func_02092288
    b L_021fe150
L_021fe148:
    mov r1, #0x69
    bl func_02092288
L_021fe150:
    mov r0, r4
    mov r1, #0x6c
    bl func_02092260
    ldr r1, L_021fe74c
    ldr r3, L_021fe750
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe17c
    bl func_ov045_0220bc40
L_021fe17c:
    ldr r1, L_021fe754
    str r0, [r4, #0xa0]
    mov r2, #0x0
    bl func_02094cf0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe73c
L_021fe1a4:
    ldr r0, [r4, #0xa0]
    bl func_02095224
    cmp r0, #0x0
    beq L_021fe73c
    add r0, r4, #0xe4
    mov r1, #0x3c
    mov r2, #0x5a
    bl func_0209189c
    mov r1, r0
    ldr r0, [r4, #0xa0]
    bl func_ov029_021fe780
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe73c
L_021fe1e8:
    ldr r0, [r4, #0xa0]
    bl func_ov029_021fe798
    cmp r0, #0x0
    beq L_021fe73c
    mov r0, r4
    mov r1, #0x6c
    bl func_02092288
    ldr r0, [r4, #0x5c]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_021fe73c
L_021fe214: ; jump table
    b L_021fe270 ; case 0
    b L_021fe270 ; case 1
    b L_021fe39c ; case 2
    b L_021fe39c ; case 3
    b L_021fe488 ; case 4
    b L_021fe518 ; case 5
    b L_021fe518 ; case 6
    b L_021fe234 ; case 7
L_021fe234:
    mov r0, r4
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdb0
    mov r2, #0x2
    mov r0, r4
    mov r1, #0x1
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    ldr r1, L_021fe758
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe270:
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r1, r0
    mov r0, r4
    blt L_021fe308
    mov r1, #0x6a
    bl func_02092260
    ldr r0, L_021fe75c
    ldr r1, L_021fe760
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, [r4, #0x64]
    ldr r1, [r4, #0xac]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bgt L_021fe2d4
    mov r0, #0x1
    str r0, [r4, #0x74]
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bd90
    mov r1, #0x4
    mov r0, r4
    str r1, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe2f4
L_021fe2d4:
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov029_021fd95c
    mov r1, #0x3
    mov r0, r4
    str r1, [r4, #0x6c]
    bl func_ov029_021fd7a8
L_021fe2f4:
    ldr r1, L_021fe764
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe308:
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov029_021fd988
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r0, r1, lsl #0x1
    blt L_021fe348
    mov r2, #0x1
    mov r0, r4
    mov r1, #0x6
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe35c
L_021fe348:
    mov r2, #0x2
    mov r0, r4
    mov r1, #0x5
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
L_021fe35c:
    ldr r0, [r4, #0x60]
    sub r0, r0, #0x1
    str r0, [r4, #0x60]
    cmp r0, #0x0
    ble L_021fe388
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe73c
L_021fe388:
    ldr r1, L_021fe768
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe39c:
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r1, r0
    mov r0, r4
    bgt L_021fe41c
    mov r1, #0x6a
    bl func_02092260
    ldr r0, L_021fe75c
    ldr r1, L_021fe760
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r0, r1, lsl #0x1
    ldr r0, [r4, #0xa0]
    blt L_021fe3fc
    bl func_ov045_0220bd90
    mov r1, #0x1
    str r1, [r4, #0x74]
    mov r1, #0x4
    mov r0, r4
    str r1, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe474
L_021fe3fc:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov029_021fd95c
    mov r1, #0x3
    mov r0, r4
    str r1, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe474
L_021fe41c:
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov029_021fd988
    ldr r0, [r4, #0x64]
    ldr r1, [r4, #0xac]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bgt L_021fe460
    mov r2, #0x1
    mov r0, r4
    mov r1, #0x6
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe474
L_021fe460:
    mov r2, #0x2
    mov r0, r4
    mov r1, #0x5
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
L_021fe474:
    ldr r1, L_021fe76c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe488:
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r1, r0
    mov r0, r4
    bgt L_021fe4d8
    mov r1, #0x6a
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov029_021fd95c
    ldr r0, L_021fe75c
    ldr r1, L_021fe760
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r1, #0x3
    mov r0, r4
    str r1, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe504
L_021fe4d8:
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov029_021fd988
    mov r2, #0x2
    mov r0, r4
    mov r1, #0x4
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
L_021fe504:
    ldr r1, L_021fe770
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe518:
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0xac]
    cmp r1, r0
    mov r0, r4
    bgt L_021fe5f8
    mov r1, #0x6a
    bl func_02092260
    ldr r0, L_021fe75c
    ldr r1, L_021fe760
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r5, [r4, #0x64]
    mov r0, #0xc8
    mul r0, r5, r0
    ldr r6, [r4, #0xac]
    mov r1, #0x64
    bl func_020befec
    cmp r0, r6
    bgt L_021fe58c
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bd90
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x74]
    mov r2, #0x5
    mov r1, #0x4
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe5e4
L_021fe58c:
    mov r0, #0x96
    mul r0, r5, r0
    mov r1, #0x64
    bl func_020befec
    cmp r0, r6
    ldr r0, [r4, #0xa0]
    bgt L_021fe5c4
    bl func_ov045_0220bd90
    mov r2, #0x4
    mov r0, r4
    mov r1, #0x3
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    b L_021fe5e4
L_021fe5c4:
    bl func_ov045_0220bdf0
    mov r0, r4
    bl func_ov029_021fd95c
    mov r2, #0x3
    mov r0, r4
    mov r1, #0x2
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
L_021fe5e4:
    ldr r1, L_021fe774
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe5f8:
    mov r1, #0x6b
    bl func_02092260
    ldr r0, [r4, #0xa0]
    bl func_ov045_0220bdb0
    mov r0, r4
    bl func_ov029_021fd988
    mov r1, #0x2
    str r1, [r4, #0x6c]
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x5
    str r2, [r4, #0xac]
    bl func_ov029_021fd7a8
    ldr r1, L_021fe778
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fe73c
L_021fe640:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fe73c
    mov r0, r4
    bl func_ov029_021fd9b4
    ldr r0, [r4, #0x60]
    cmp r0, #0x1
    mov r0, r4
    bne L_021fe670
    mov r1, #0x2
    bl func_ov029_021fd7a8
    b L_021fe678
L_021fe670:
    mov r1, #0x1
    bl func_ov029_021fd7a8
L_021fe678:
    ldr r0, [r4, #0xa0]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x160
    bl func_020948e4
    ldr r2, [r4, #0xa0]
    mov r0, #0x10
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_021fe73c
L_021fe6b0:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fe73c
    ldr r0, [r4, #0xa0]
    bl func_ov029_021fe798
    cmp r0, #0x0
    beq L_021fe73c
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fe6e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe6e4:
    mov r1, #0x0
    str r1, [r4, #0xa0]
    mov r0, #0x1
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe73c
L_021fe70c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fe73c
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbe68
    mov r0, r4
    mov r1, #0x69
    bl func_02092260
    ldr r1, L_021fe77c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
L_021fe73c:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fe74c: .word data_ov029_021fed28
L_021fe750: .word gHeapContext
L_021fe754: .word data_ov029_021febbc
L_021fe758: .word data_ov029_021fec48
L_021fe75c: .word gGameWork
L_021fe760: .word 0x38a
L_021fe764: .word data_ov029_021fec98
L_021fe768: .word data_ov029_021fec90
L_021fe76c: .word data_ov029_021fec88
L_021fe770: .word data_ov029_021fec80
L_021fe774: .word data_ov029_021fec78
L_021fe778: .word data_ov029_021fec10
L_021fe77c: .word data_ov029_021fec68
.size func_ov029_021fe0cc, .-func_ov029_021fe0cc
