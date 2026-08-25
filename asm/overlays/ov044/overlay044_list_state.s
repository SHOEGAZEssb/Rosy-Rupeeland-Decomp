.text
.extern InventoryScroll_ResetPresentationState
.extern InventoryScroll_UpdateInterpolation
.extern func_ov044_0220bdac
.extern func_ov044_0220c700
.extern InventoryScroll_SaveOrigins
.extern InventoryScroll_MoveSelectionUp
.extern InventoryScroll_MoveSelectionDown
.extern func_ov044_0220bd28
.extern InventoryScroll_TestUpperArrowHold
.extern InventoryScroll_PageUp
.extern InventoryScroll_TestLowerArrowHold
.extern InventoryScroll_PageDown
.extern InventoryScroll_TestUpperArrowPress
.extern InventoryScroll_TestLowerArrowPress
.extern InventoryScroll_TestMarkerHit
.extern func_ov044_0220be38
.extern func_02092260
.extern InventoryScroll_SetSelectedRow
.extern func_ov044_0220caa4
.extern SpriteMotionController_BeginHitResponse
.extern InventoryScroll_UpdateSelectionMovement
.extern func_ov044_0220c880
.extern data_ov044_0220d2b8
.extern data_ov044_0220d2d8

    .global func_ov044_0220cb04
func_ov044_0220cb04:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x228]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0xa
    bgt .L_0220cb4c
    bge .L_0220cdcc
    cmp r0, #0x2
    bgt .L_0220ce10
    cmp r0, #0x0
    blt .L_0220ce10
    beq .L_0220cb58
    cmp r0, #0x1
    beq .L_0220cb74
    cmp r0, #0x2
    beq .L_0220cbb8
    b .L_0220ce10
.L_0220cb4c:
    cmp r0, #0x14
    beq .L_0220cdf4
    b .L_0220ce10
.L_0220cb58:
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
.L_0220cb74:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq .L_0220cb9c
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_0220cbb8
.L_0220cb9c:
    ldr r0, [r5, #0x228]
    bl func_ov044_0220bdac
    cmp r0, #0x0
    beq .L_0220ce10
    mov r0, r5
    bl func_ov044_0220c700
    b .L_0220ce10
.L_0220cbb8:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq .L_0220cbdc
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b .L_0220cd98
.L_0220cbdc:
    tst r0, #0x80
    beq .L_0220cbf0
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b .L_0220cd98
.L_0220cbf0:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq .L_0220cd98
    ldr r0, [r5, #0x228]
    add r1, r5, #0x30
    bl func_ov044_0220bd28
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq .L_0220cc30
    bl InventoryScroll_PageUp
    b .L_0220cd98
.L_0220cc30:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq .L_0220cc4c
    mov r0, r4
    bl InventoryScroll_PageDown
    b .L_0220cd98
.L_0220cc4c:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq .L_0220cd98
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq .L_0220cc90
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne .L_0220cd98
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b .L_0220cd98
.L_0220cc90:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq .L_0220ccc0
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne .L_0220cd98
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b .L_0220cd98
.L_0220ccc0:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq .L_0220cce4
    ldr r1, .L_0220ce20
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    b .L_0220ce10
.L_0220cce4:
    cmp r6, #0x0
    blt .L_0220cd34
    ldr r0, [r4, #0x14]
    cmp r6, r0
    mov r0, r5
    beq .L_0220cd2c
    mov r1, #0x0
    bl func_02092260
    mov r0, r4
    mov r1, r6
    bl InventoryScroll_SetSelectedRow
    mov r0, r5
    bl func_ov044_0220c700
    mov r0, #0x14
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b .L_0220ce10
.L_0220cd2c:
    bl func_ov044_0220caa4
    b .L_0220ce10
.L_0220cd34:
    add r0, r5, #0x17c
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq .L_0220cd5c
    mov r0, r5
    bl func_ov044_0220caa4
    b .L_0220ce10
.L_0220cd5c:
    add r0, r5, #0xd0
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq .L_0220cd98
    mov r0, r5
    mov r1, #0x3
    bl func_02092260
    ldr r1, .L_0220ce24
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    b .L_0220ce10
.L_0220cd98:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq .L_0220ce10
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_0220ce10
.L_0220cdcc:
    ldr r1, [r5, #0x1fc]
    ldr r0, [r5, #0x1f8]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x4]
    strne r0, [r5, #0x8]
    b .L_0220ce10
.L_0220cdf4:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
.L_0220ce10:
    mov r0, r5
    bl func_ov044_0220c880
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ce20: .word data_ov044_0220d2b8
.L_0220ce24: .word data_ov044_0220d2d8
.size func_ov044_0220cb04, . - func_ov044_0220cb04
