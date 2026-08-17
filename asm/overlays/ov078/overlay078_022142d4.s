.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern Sound_Play
.extern data_ov078_02215c88
.extern data_ov078_02215cd0
.extern data_ov078_02215d48
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern ActorContactState_AddContact
.extern func_02034a60
.extern func_0204cfa4
.extern func_020adc90
.extern func_ov078_02213838
.extern gSoundContext

.global func_ov078_022142d4
func_ov078_022142d4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x30
    mov r6, r1
    ldrb r1, [r6, #0x4d]
    mov r7, r0
    mov r5, r2
    cmp r1, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02214314
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214580
.L_02214314:
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221434c
    ldr r0, [r7, #0x260]
    tst r0, #0x8
    bne .L_02214694
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0x1b4]
    blx r2
    b .L_02214694
.L_0221434c:
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r8, r1, r0
    mov r0, r4
    mov r1, r8
    bl func_0204cfa4
    ldr r1, .L_022146b0
    ldr r2, [r7, #0x2a4]
    ldr r1, [r1, #0xc0]
    mov r9, r0
    cmp r2, r1
    mov r10, #0x0
    mov r3, #0x1
    ldr r0, .L_022146b4
    bne .L_022143a8
    ldr r1, [r7, #0x2a8]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022143a8:
    cmp r3, #0x0
    bne .L_022143c8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1ac]
    blx r1
    cmp r0, #0x0
    movne r10, #0x1
.L_022143c8:
    cmp r10, #0x0
    beq .L_02214494
    mov r0, r6
    bl func_ov078_02213838
    cmp r0, #0x0
    beq .L_022143fc
    add r0, r6, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214494
.L_022143fc:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10c]
    blx r1
    cmp r5, #0x0
    addeq r0, r7, #0x200
    ldreqsh r0, [r0, #0xc4]
    cmpeq r0, #0x0
    bne .L_0221443c
    ldr r1, .L_022146b8
    mov r0, r7
    mov r2, #0x0
    bl func_02034a60
    add r0, r7, #0x200
    mov r1, #0xf
    strh r1, [r0, #0xc4]
.L_0221443c:
    cmp r9, #0x1000
    ble .L_02214494
    mov r0, r4
    mov r1, r9
    bl func_020adc90
    mov r10, r0
    mov r0, r8
    mov r1, r9
    bl func_020adc90
    mov r2, r0, lsl #0x1
    mov r1, r10, lsl #0x1
    add r0, sp, #0x20
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x20
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
.L_02214494:
    mov r0, r6
    bl func_ov078_02213838
    cmp r0, #0x0
    beq .L_02214694
    ldr r0, [r6, #0x2ac]
    cmp r0, #0x0
    bne .L_02214694
    cmp r9, #0x1000
    ble .L_02214578
    mov r0, r4
    mov r1, r9
    bl func_020adc90
    mov r4, r0
    mov r0, r8
    mov r1, r9
    bl func_020adc90
    mov r2, r0
    add r0, sp, #0x10
    mov r1, r4
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x10
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    ldr r0, [sp, #0x14]
    mvn r1, #0x0
    mul r2, r0, r1
    mov r0, r2, asr #0x1
    ldr r2, [sp, #0x18]
    str r0, [sp, #0x14]
    mul r1, r2, r1
    mov r1, r1, asr #0x1
    str r1, [sp, #0x18]
    mov r0, r7
    ldr r3, [r0, #0x0]
    add r1, sp, #0x10
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    cmp r5, #0x0
    addeq r0, r7, #0x200
    ldreqsh r0, [r0, #0xc4]
    cmpeq r0, #0x0
    bne .L_02214570
    ldr r0, .L_022146bc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
    add r0, r7, #0x200
    mov r1, #0xf
    strh r1, [r0, #0xc4]
.L_02214570:
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_02214578:
    str r7, [r6, #0x2ac]
    b .L_02214694
.L_02214580:
    cmp r1, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214694
    ldr r0, .L_022146b0
    ldr r2, [r7, #0x2a4]
    ldr r0, [r0, #0x48]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022146c0
    bne .L_022145c4
    ldr r1, [r7, #0x2a8]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022145c4:
    cmp r3, #0x0
    bne .L_02214694
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl func_0204cfa4
    mov r8, r0
    cmp r8, #0x1000
    ble .L_02214694
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20c]
    blx r1
    mov r10, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    mov r9, r0
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20c]
    blx r1
    mov r1, r8
    mov r8, r0
    mov r0, r4
    bl func_020adc90
    smull r4, r1, r0, r8
    adds r4, r4, #0x800
    adc r0, r1, #0x0
    smull r3, r2, r9, r10
    mov r1, r4, lsr #0xc
    adds r3, r3, #0x800
    orr r1, r1, r0, lsl #0x14
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    add r0, sp, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02214694:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    str r6, [r7, #0x2ac]
    bl ActorContactState_AddContact
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_022146b0: .word data_ov078_02215c88
.L_022146b4: .word data_ov078_02215d48
.L_022146b8: .word 0x3087
.L_022146bc: .word gSoundContext
.L_022146c0: .word data_ov078_02215cd0
.size func_ov078_022142d4, . - func_ov078_022142d4
