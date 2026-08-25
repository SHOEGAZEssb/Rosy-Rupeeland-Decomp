.text

/* Exact fallback; see src/overlays/ov025/overlay025_confirmation_state.c. */
.extern data_ov025_02202e58
.extern data_ov025_02202e80
.extern data_ov025_02202ed0
.extern RetailSaveContext_PollOperation
.extern RetailSaveContext_BeginRecordLoad
.extern SceneSound_PlayPackedEffect
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_02200224
.extern func_ov025_022002f8
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern gRuntimeContext


    .global func_ov025_02201348
func_ov025_02201348:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02201370
    cmp r1, #0x1
    beq L_0220139c
    cmp r1, #0x2
    beq L_02201448
    b L_02201470
L_02201370:
    bl func_ov025_022002f8
    ldr r0, L_02201480
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl RetailSaveContext_BeginRecordLoad
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_0220139c:
    ldr r0, L_02201480
    ldr r0, [r0, #0x0]
    bl RetailSaveContext_PollOperation
    cmp r0, #0x0
    beq L_02201470
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r4
    bne L_0220142c
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02201480
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x3
    bne L_02201400
    mov r0, r4
    mov r1, #0x1d
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201484
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201470
L_02201400:
    cmp r0, #0x5
    bne L_02201470
    mov r0, r4
    mov r1, #0x1e
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201488
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201470
L_0220142c:
    bl func_ov025_02200468
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201470
L_02201448:
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02201470
    ldr r1, L_0220148c
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r1, L_02201490
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02201470:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201480: .word gRuntimeContext
L_02201484: .word data_ov025_02202e58
L_02201488: .word data_ov025_02202ed0
L_0220148c: .word 0x2d03
L_02201490: .word data_ov025_02202e80
.size func_ov025_02201348, .-func_ov025_02201348

