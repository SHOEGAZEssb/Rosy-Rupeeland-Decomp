.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_transfer_state.c. */
.extern data_ov025_02202e10
.extern data_ov025_02202e30
.extern data_ov025_02202e88
.extern data_ov025_02202e90
.extern data_ov025_02202ea0
.extern data_ov025_02202ec0
.extern RetailSaveContext_PollOperation
.extern RetailSaveContext_BeginRecordCopy
.extern TitleInterpolatedValue_Configure
.extern func_02091c7c
.extern func_02091cf0
.extern SceneSound_PlayPackedEffect
.extern GraphicsSpriteState_TestTouchPoint
.extern SpriteMotionController_SetPosition
.extern SpriteMotionController_BeginHitResponse
.extern SpriteMotionController_Show
.extern SpriteMotionController_Hide
.extern ModalState_UpdateInput
.extern func_ov025_021fd9e4
.extern func_ov025_021fdb18
.extern func_ov025_021fdc4c
.extern func_ov025_021fdea0
.extern func_ov025_021ff0b0
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200224
.extern func_ov025_022002b0
.extern func_ov025_02200398
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern func_ov025_02200498
.extern func_ov025_02200534
.extern func_ov025_02200794
.extern func_ov025_02200824
.extern gRuntimeContext


    .global func_ov025_02201494
func_ov025_02201494:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r1, [r5, #0x4]
    cmp r1, #0x14
    addls pc, pc, r1, lsl #0x2
    b L_02201a8c
L_022014ac: ; jump table
    b L_02201500 ; case 0
    b L_02201594 ; case 1
    b L_02201658 ; case 2
    b L_0220168c ; case 3
    b L_02201728 ; case 4
    b L_02201a8c ; case 5
    b L_02201a8c ; case 6
    b L_02201a8c ; case 7
    b L_02201a8c ; case 8
    b L_02201a8c ; case 9
    b L_02201800 ; case 10
    b L_02201830 ; case 11
    b L_02201910 ; case 12
    b L_02201970 ; case 13
    b L_02201a8c ; case 14
    b L_02201a8c ; case 15
    b L_02201a8c ; case 16
    b L_02201a8c ; case 17
    b L_02201a8c ; case 18
    b L_02201a8c ; case 19
    b L_02201a08 ; case 20
L_02201500:
    mov r7, #0x0
    mov r4, r7
    mov r6, #0x10
L_0220150c:
    ldr r0, [r5, #0x54]
    cmp r7, r0
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0xe4]
    bne L_0220152c
    mov r1, r6
    bl func_ov025_021fdb18
    b L_02201534
L_0220152c:
    mov r1, r4
    bl func_ov025_021fd9e4
L_02201534:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt L_0220150c
    mov r0, r5
    bl func_ov025_02200534
    mov r0, r5
    bl func_ov025_022001f4
    add r0, r5, #0x19c
    bl SpriteMotionController_Show
    ldr r0, [r5, #0x54]
    mov r1, #0xe4
    cmp r0, #0x2
    add r0, r5, #0x19c
    bne L_02201578
    mov r2, #0x18
    bl SpriteMotionController_SetPosition
    b L_02201580
L_02201578:
    mov r2, #0xa0
    bl SpriteMotionController_SetPosition
L_02201580:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_02201594:
    mov r0, r5
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02201a8c
    mov r4, #0x0
    mov r6, r4
    b L_0220160c
L_022015bc:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xe4]
    add r1, r5, #0x30
    ldr r0, [r0, #0x10]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    ldrne r0, [r5, #0x54]
    cmpne r6, r0
    beq L_02201608
    str r6, [r5, #0x58]
    add r0, r5, #0x19c
    mov r4, #0x1
    bl SpriteMotionController_Hide
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201614
L_02201608:
    add r6, r6, #0x1
L_0220160c:
    cmp r6, #0x3
    blt L_022015bc
L_02201614:
    cmp r4, #0x0
    bne L_02201a8c
    add r0, r5, #0x19c
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02201a8c
    mov r0, r5
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    mov r0, #0x14
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201658:
    add r0, r5, #0x1fc
    mov r1, #0x6
    str r1, [sp, #0x0]
    add r0, r0, #0x400
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x4
    bl TitleInterpolatedValue_Configure
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_0220168c:
    add r0, r5, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r5, #0x58]
    mov r1, r0
    add r0, r5, r2, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fdea0
    add r0, r5, #0x1fc
    add r0, r0, #0x400
    bl func_02091cf0
    cmp r0, #0x0
    beq L_02201a8c
    ldr r0, [r5, #0x58]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fdc4c
    cmp r0, #0x0
    beq L_02201700
    mov r1, #0x2
    mov r0, r5
    mov r2, r1
    bl func_ov025_02200398
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201700:
    mov r0, r5
    mov r1, #0x13
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201728:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r5, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    movs r4, r0
    bmi L_02201a8c
    mov r0, r5
    bl func_ov025_022002b0
    cmp r4, #0x1
    beq L_0220176c
    cmp r4, #0x2
    beq L_02201798
    b L_02201a8c
L_0220176c:
    mov r0, r5
    bl func_ov025_022001f4
    mov r1, #0x2
    mov r0, r5
    mov r2, r1
    bl func_ov025_02200398
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201798:
    mov r7, #0x0
    mov r4, r7
    mov r6, #0x10
L_022017a4:
    ldr r0, [r5, #0x54]
    cmp r7, r0
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0xe4]
    bne L_022017c4
    mov r1, r6
    bl func_ov025_021fd9e4
    b L_022017cc
L_022017c4:
    mov r1, r4
    bl func_ov025_021fdb18
L_022017cc:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt L_022017a4
    ldr r1, [r5, #0x54]
    mov r0, r5
    bl func_ov025_02200498
    mov r0, r5
    bl func_ov025_022001f4
    ldr r1, L_02201a9c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201a8c
L_02201800:
    ldr r0, L_02201aa0
    ldr r1, [r5, #0x54]
    ldr r0, [r0, #0x0]
    ldr r2, [r5, #0x58]
    mov r3, #0x1
    bl RetailSaveContext_BeginRecordCopy
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201830:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, L_02201aa0
    ldr r0, [r0, #0x0]
    bl RetailSaveContext_PollOperation
    cmp r0, #0x0
    beq L_02201a8c
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r5
    bne L_022018f4
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02201aa0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x3
    bne L_0220189c
    mov r0, r5
    mov r1, #0x1d
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201aa4
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201a8c
L_0220189c:
    cmp r0, #0x5
    bne L_022018c8
    mov r0, r5
    mov r1, #0x1e
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201aa8
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201a8c
L_022018c8:
    cmp r0, #0x4
    bne L_02201a8c
    mov r0, r5
    mov r1, #0x1f
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201aac
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201a8c
L_022018f4:
    bl func_ov025_02200468
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201910:
    mov r1, #0x4
    bl func_ov025_02200824
    mov r0, r5
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02201a8c
    mov r0, r5
    bl func_ov025_02200794
    mov r0, r5
    mov r1, #0x0
    bl func_ov025_02200438
    mov r0, r5
    mov r1, #0x14
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201ab0
    mov r0, r5
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201a8c
L_02201970:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r1, [r5, #0x20]
    ldr r0, [r5, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r5, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_02201a8c
    mov r0, r5
    bl func_ov025_022002b0
    mov r7, #0x0
    mov r4, r7
    mov r6, #0x10
L_022019ac:
    ldr r0, [r5, #0x54]
    cmp r7, r0
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0xe4]
    bne L_022019cc
    mov r1, r6
    bl func_ov025_021fd9e4
    b L_022019d4
L_022019cc:
    mov r1, r4
    bl func_ov025_021fdb18
L_022019d4:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt L_022019ac
    ldr r1, [r5, #0x54]
    mov r0, r5
    bl func_ov025_02200498
    mov r0, r5
    bl func_ov025_022001f4
    ldr r1, L_02201ab4
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201a8c
L_02201a08:
    mov r1, #0x4
    bl func_ov025_02200824
    add r0, r5, #0x19c
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_02201a8c
    mov r7, #0x0
    mov r4, r7
    mov r6, #0x10
L_02201a2c:
    ldr r0, [r5, #0x54]
    cmp r7, r0
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0xe4]
    bne L_02201a4c
    mov r1, r6
    bl func_ov025_021fd9e4
    b L_02201a54
L_02201a4c:
    mov r1, r4
    bl func_ov025_021fdb18
L_02201a54:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt L_02201a2c
    ldr r1, [r5, #0x54]
    mov r0, r5
    bl func_ov025_02200498
    mov r0, r5
    bl func_ov025_022001f4
    add r0, r5, #0x19c
    bl SpriteMotionController_Hide
    ldr r1, L_02201ab8
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02201a8c:
    mov r0, r5
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02201a9c: .word data_ov025_02202e90
L_02201aa0: .word gRuntimeContext
L_02201aa4: .word data_ov025_02202ea0
L_02201aa8: .word data_ov025_02202e88
L_02201aac: .word data_ov025_02202ec0
L_02201ab0: .word 0x2d03
L_02201ab4: .word data_ov025_02202e10
L_02201ab8: .word data_ov025_02202e30
.size func_ov025_02201494, .-func_ov025_02201494

