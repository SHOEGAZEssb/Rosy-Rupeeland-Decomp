.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_021052fc
.extern data_ov080_02213e68
.extern data_ov080_02213e90
.extern data_ov080_02213ea8
.extern func_020adcac

.global func_ov080_022134d8
func_ov080_022134d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    add r0, r7, #0x200
    ldrsh r2, [r0, #0x52]
    mov r6, r1
    cmp r2, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r0, #0x54]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0x54]
    bne .L_022136a8
    ldrh r1, [r6, #0x1a]
    tst r1, #0x1
    beq .L_022136a8
    ldrsh r0, [r6, #0x16]
    cmp r0, #0x0
    ble .L_022136a8
    ldr r2, .L_022136b0
    mov r0, #0x1
    ldr r4, [r7, #0x218]
    ldr r2, [r2, #0x40]
    mov r5, r0
    cmp r4, r2
    ldr r2, .L_022136b4
    bne .L_02213558
    ldr r3, [r7, #0x21c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne r4, #0x0
    moveq r5, #0x0
.L_02213558:
    cmp r5, #0x0
    beq .L_02213598
    ldr r2, .L_022136b0
    ldr r4, [r7, #0x220]
    ldr r2, [r2, #0x28]
    mov r5, #0x1
    cmp r4, r2
    ldr r2, .L_022136b8
    bne .L_02213590
    ldr r3, [r7, #0x224]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne r4, #0x0
    moveq r5, #0x0
.L_02213590:
    cmp r5, #0x0
    movne r0, #0x0
.L_02213598:
    cmp r0, #0x0
    bne .L_022136a8
    ldr r0, .L_022136bc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea8]
    ldr r4, [r0, #0xea4]
    cmp r5, #0x0
    beq .L_0221367c
    ldr r0, [r5, #0xd0]
    tst r0, #0x100
    bne .L_0221367c
    adds r1, r7, #0x18
    add r0, r5, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    mov r8, r0
    adds r1, r7, #0x18
    add r0, r4, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r8, r0
    ldrh r0, [r6, #0x1a]
    ble .L_02213638
    tst r0, #0x10
    bne .L_022136a8
    mov r0, r7
    ldr r3, [r0, #0x0]
    mov r1, r4
    ldr r3, [r3, #0x120]
    mov r2, r6
    blx r3
    cmp r0, #0x0
    beq .L_022136a8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02213638:
    tst r0, #0x20
    ldrne r0, .L_022136bc
    ldrne r0, [r0, #0x0]
    addne r0, r0, #0x2000
    ldrne r0, [r0, #0xea8]
    cmpne r0, #0x0
    beq .L_022136a8
    mov r0, r7
    ldr r3, [r0, #0x0]
    mov r1, r5
    ldr r3, [r3, #0x120]
    mov r2, r6
    blx r3
    cmp r0, #0x0
    beq .L_022136a8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0221367c:
    tst r1, #0x10
    bne .L_022136a8
    mov r0, r7
    ldr r3, [r0, #0x0]
    mov r1, r4
    ldr r3, [r3, #0x120]
    mov r2, r6
    blx r3
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_022136a8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_022136b0: .word data_ov080_02213e68
.L_022136b4: .word data_ov080_02213ea8
.L_022136b8: .word data_ov080_02213e90
.L_022136bc: .word data_021052fc
.size func_ov080_022134d8, . - func_ov080_022134d8
