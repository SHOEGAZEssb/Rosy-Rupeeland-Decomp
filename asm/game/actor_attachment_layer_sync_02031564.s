; Matching retail form; see src/game/actor_attachment_layer_sync.c.
.text
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern func_020be334

    .global func_02031564
    .type func_02031564, @function
func_02031564: ; 0x02031564
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x54]
    cmp r0, #0x0
    beq .L_020316dc
    ldr r0, [r6, #0x58]
    cmp r0, #0x0
    bne .L_02031594
    ldr r0, [r6, #0x10]
    tst r0, #0x4
    beq .L_020316dc
.L_02031594:
    ldr r0, [r6, #0x14]
    tst r0, #0x80
    bne .L_020316dc
    ldr r0, .L_020316e4
    ldr r1, [r6, #0x1c]
    ldr r0, [r0, #0x0]
    ldr r2, [r6, #0x20]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r1, asr #0x10
    ldr r3, [r0, #0x0]
    mov r2, r2, asr #0x10
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x1b
    ldr r2, [r6, #0x24]
    mov r1, r1, asr #0x1b
    cmp r2, r1, lsl #0x10
    movlt r1, #0x2
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x54]
    movge r1, #0x1
    strb r1, [r0, #0x3a]
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_020316dc
    ldr r0, .L_020316e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, r0, #0x2000
    mov r0, #0x0
    ldr r7, [r1, #0xe7c]
    bl func_020be334
    cmp r0, #0x2000
    bge .L_020316dc
    ldr r2, [r7, #0x54]
    ldr r4, [r6, #0x54]
    ldrb r5, [r2, #0x3a]
    ldrb r0, [r4, #0x3a]
    cmp r0, r5
    bhs .L_02031694
    ldr r1, [r7, #0x24]
    ldr r0, [r6, #0x24]
    cmp r1, r0
    blt .L_020316dc
    ldrsh r1, [r2, #0x2c]
    ldrsh r0, [r4, #0x2c]
    ldrsh r3, [r2, #0x2e]
    ldrsh r2, [r4, #0x2e]
    sub r0, r1, r0
    sub r6, r3, r2
    bl func_020be334
    cmp r0, #0x1e
    bge .L_020316dc
    cmp r6, #0x0
    ble .L_020316dc
    subs r0, r6, #0x3c
    strmib r5, [r4, #0x3a]
    b .L_020316dc
.L_02031694:
    bls .L_020316dc
    ldr r1, [r7, #0x24]
    ldr r0, [r6, #0x24]
    cmp r1, r0
    bgt .L_020316dc
    ldrsh r1, [r2, #0x2c]
    ldrsh r0, [r4, #0x2c]
    ldrsh r3, [r2, #0x2e]
    ldrsh r2, [r4, #0x2e]
    sub r0, r1, r0
    sub r6, r3, r2
    bl func_020be334
    cmp r0, #0x1e
    cmplt r6, #0x0
    bge .L_020316dc
    add r0, r6, #0x28
    cmp r0, #0x0
    strgtb r5, [r4, #0x3a]
.L_020316dc:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020316e4: .word data_021052fc
    .size func_02031564, . - func_02031564

