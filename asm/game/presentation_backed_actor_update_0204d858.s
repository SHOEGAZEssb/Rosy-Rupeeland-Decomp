; Matching retail form; see src/game/presentation_backed_actor_update.c.
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern gSceneManager
.extern func_020050a4
.extern func_020050c8
.extern func_02009d78
.extern func_0202d494
.extern Actor_GetCollection
.extern Actor_QueryTerrainHeight
.extern func_0204cfa4
.extern func_02072b68
.extern func_020adae4
.text
    .global func_0204d858
func_0204d858: ; 0x0204d858
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r0, r6, #0x100
    ldrh r0, [r0, #0xec]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0204dce0
.L_0204d878: ; jump table
    b .L_0204d888 ; case 0
    b .L_0204d9f8 ; case 1
    b .L_0204db84 ; case 2
    b .L_0204dce0 ; case 3
.L_0204d888:
    ldr r3, [r6, #0x54]
    add r0, r6, #0x28
    ldrh r2, [r3, #0x24]
    add r1, r6, #0x18
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl func_020050a4
    add r0, r6, #0x18
    add r1, r6, #0x38
    bl func_020050c8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, .L_0204de04
    mov r2, #0x0
    umull r4, r3, r0, r1
    adds r4, r4, #0x800
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    ldr r2, [r6, #0x44]
    orr r1, r1, r0, lsl #0x14
    sub r0, r2, r1
    str r0, [r6, #0x44]
    ldrh r0, [r6, #0x4e]
    cmp r0, #0xd
    bne .L_0204d934
    ldr r0, [r6, #0x44]
    cmp r0, #0x0
    bge .L_0204d934
    ldr r0, [r6, #0x54]
    ldrb r1, [r6, #0x1ef]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_0204d934
    bl func_02072b68
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0204d934:
    ldr r1, [r6, #0x1dc]
    ldr r0, [r6, #0x24]
    cmp r0, r1
    bge .L_0204d9cc
    str r1, [r6, #0x24]
    add r0, r6, #0x100
    ldrsh r1, [r0, #0xf0]
    add r1, r1, #0x1
    strh r1, [r0, #0xf0]
    ldrsh r0, [r0, #0xf0]
    cmp r0, #0x2
    bge .L_0204d9a8
    ldrh r0, [r6, #0x4e]
    cmp r0, #0xd
    bne .L_0204d9a8
    ldr r0, [r6, #0x3c]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r6, #0x3c]
    ldr r0, [r6, #0x40]
    mov r1, #0x2
    bl func_020adae4
    str r0, [r6, #0x40]
    ldr r0, [r6, #0x44]
    mvn r1, #0x4
    add r0, r0, r0, lsl #0x1
    bl func_020adae4
    str r0, [r6, #0x44]
    b .L_0204dce0
.L_0204d9a8:
    add r0, r6, #0x100
    mov r2, #0x1
    mov r1, #0x0
    strh r2, [r0, #0xec]
    strh r1, [r0, #0xf0]
    str r1, [r6, #0x44]
    str r1, [r6, #0x40]
    str r1, [r6, #0x3c]
    b .L_0204dce0
.L_0204d9cc:
    ldrb r0, [r6, #0x4b]
    tst r0, #0x3
    ldrne r0, [r6, #0x3c]
    rsbne r0, r0, #0x0
    strne r0, [r6, #0x3c]
    ldrb r0, [r6, #0x4b]
    tst r0, #0xc
    ldrne r0, [r6, #0x40]
    rsbne r0, r0, #0x0
    strne r0, [r6, #0x40]
    b .L_0204dce0
.L_0204d9f8:
    ldr r0, .L_0204de08
    ldr r2, [r6, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r1, [r6, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r4, r2, asr #0x10
    ldr r3, [r0, #0x0]
    mov r5, r1, asr #0x10
    ldr r3, [r3, #0x2c]
    mov r1, r4
    mov r2, r5
    blx r3
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x1
    bne .L_0204da84
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl Actor_QueryTerrainHeight
    ldr r1, [r6, #0x24]
    mov r0, r0, lsl #0x4
    cmp r0, r1, asr #0xc
    blt .L_0204dad0
    mov r0, r6
    bl Actor_GetCollection
    mov r1, r6
    bl func_0202d494
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
    b .L_0204dad0
.L_0204da84:
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1b
    cmp r0, #0xe
    bne .L_0204dad0
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl Actor_QueryTerrainHeight
    ldr r1, [r6, #0x24]
    mov r0, r0, lsl #0x4
    cmp r0, r1, asr #0xc
    blt .L_0204dad0
    mov r0, r6
    bl Actor_GetCollection
    mov r1, r6
    bl func_0202d494
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
.L_0204dad0:
    add r0, r6, #0x100
    ldrsh r1, [r0, #0xf4]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_0204dce0
    ldr r0, .L_0204de0c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_0204db70
    add r1, r6, #0x100
    ldrsh r0, [r1, #0xf0]
    add r0, r0, #0x1
    strh r0, [r1, #0xf0]
    ldrsh r0, [r1, #0xf4]
    ldrsh r4, [r1, #0xf0]
    cmp r4, r0
    bge .L_0204db50
    mov r1, #0x2
    bl func_020adae4
    cmp r4, r0
    ble .L_0204dce0
    ldr r1, [r6, #0x54]
    tst r4, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    b .L_0204dce0
.L_0204db50:
    mov r0, r6
    bl Actor_GetCollection
    mov r1, r6
    bl func_0202d494
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
    b .L_0204dce0
.L_0204db70:
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_0204dce0
.L_0204db84:
    ldr r0, [r6, #0x14]
    mov r1, #0x0
    orr r0, r0, #0x80
    str r0, [r6, #0x14]
    ldr r0, [r6, #0x54]
    strb r1, [r0, #0x3a]
    ldrh r0, [r6, #0x4e]
    cmp r0, #0xa
    add r0, r6, #0x100
    ldrsh r1, [r0, #0xf0]
    moveq r2, #0x14
    movne r2, #0x28
    add r1, r1, #0x1
    strh r1, [r0, #0xf0]
    ldrsh r0, [r0, #0xf0]
    cmp r0, r2
    bge .L_0204dcb4
    ldr r0, .L_0204de08
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldrh r1, [r6, #0x4e]
    cmp r1, #0xa
    bne .L_0204dca4
    ldr r4, [r6, #0x1c]
    mov r1, #0xc00
    umull ip, r8, r4, r1
    mov r3, #0x0
    ldr r2, [r0, #0x4]
    mla r8, r4, r3, r8
    mov r7, r4, asr #0x1f
    add r4, r2, #0x12000
    mov r2, r4, asr #0x1f
    mov r5, r2, lsl #0xa
    adds ip, ip, #0x800
    mla r8, r7, r1, r8
    ldr r1, .L_0204de10
    mov r2, #0x800
    adc r8, r8, #0x0
    adds r7, r2, r4, lsl #0xa
    orr r5, r5, r4, lsr #0x16
    mov ip, ip, lsr #0xc
    adc r2, r5, #0x0
    mov r4, r7, lsr #0xc
    orr ip, ip, r8, lsl #0x14
    orr r4, r4, r2, lsl #0x14
    add r2, ip, r4
    str r2, [r6, #0x1c]
    ldr r7, [r6, #0x20]
    ldr r0, [r0, #0x8]
    umull lr, r8, r7, r1
    add r4, r0, #0x10000
    rsb r2, r1, #0x1000
    umull ip, r5, r4, r2
    adds r0, lr, #0x800
    mov r0, r0, lsr #0xc
    mov lr, r7, asr #0x1f
    mla r8, r7, r3, r8
    mla r8, lr, r1, r8
    adc r1, r8, #0x0
    orr r0, r0, r1, lsl #0x14
    mla r5, r4, r3, r5
    mov r1, r4, asr #0x1f
    mla r5, r1, r2, r5
    adds r2, ip, #0x800
    adc r1, r5, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    str r0, [r6, #0x20]
    b .L_0204dce0
.L_0204dca4:
    ldr r0, [r6, #0x24]
    add r0, r0, #0x6000
    str r0, [r6, #0x24]
    b .L_0204dce0
.L_0204dcb4:
    ldr r2, [r6, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl Actor_GetCollection
    mov r1, r6
    bl func_0202d494
    add r0, r6, #0x100
    mov r1, #0x3
    strh r1, [r0, #0xec]
.L_0204dce0:
    ldr r1, [r6, #0x1f8]
    cmp r1, #0x0
    beq .L_0204ddec
    add r0, r6, #0x100
    ldrh r0, [r0, #0xec]
    cmp r0, #0x1
    bhi .L_0204ddec
    ldr r3, [r1, #0x1c]
    ldr r2, [r6, #0x1c]
    ldr r1, [r1, #0x20]
    ldr r0, [r6, #0x20]
    sub r4, r3, r2
    sub r7, r1, r0
    mov r0, r4
    mov r1, r7
    bl func_0204cfa4
    mov r5, r0
    cmp r5, #0x18000
    ble .L_0204ddec
    mov r0, r4
    mov r1, r5
    bl func_020adae4
    mov r4, r0
    mov r0, r7
    mov r1, r5
    bl func_020adae4
    ldr r1, [r6, #0x8c]
    ldr r2, .L_0204de14
    add r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    mov r3, #0x0
    add r0, r1, r0
    str r0, [r6, #0x90]
    ldr r1, [r6, #0x8c]
    add r0, r6, #0x18
    umull r5, r4, r1, r2
    adds r5, r5, #0x800
    mla r4, r1, r3, r4
    mov r1, r1, asr #0x1f
    mla r4, r1, r2, r4
    adc r1, r4, #0x0
    mov r4, r5, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    str r4, [r6, #0x8c]
    ldr r5, [r6, #0x90]
    add r1, r6, #0x88
    umull r4, ip, r5, r2
    adds r4, r4, #0x800
    mov lr, r4, lsr #0xc
    mov r4, r5, asr #0x1f
    mla ip, r5, r3, ip
    mla ip, r4, r2, ip
    adc r4, ip, #0x0
    orr lr, lr, r4, lsl #0x14
    str lr, [r6, #0x90]
    ldr r5, [r6, #0x94]
    mov r4, r5, asr #0x1f
    umull lr, ip, r5, r2
    mla ip, r5, r3, ip
    mla ip, r4, r2, ip
    adds r3, lr, #0x800
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r6, #0x94]
    bl func_020050c8
.L_0204ddec:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc0]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0204de04: .word 0x1666
.L_0204de08: .word data_021052fc
.L_0204de0c: .word gSceneManager
.L_0204de10: .word 0xd9a
.L_0204de14: .word 0xe66
.size func_0204d858, . - func_0204d858
