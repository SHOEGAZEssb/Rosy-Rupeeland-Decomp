; Matching retail form; see src/game/actor_derived_type1_record_collision_scan.c.
.text
.extern data_020c9670
.extern data_021052fc
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_02007f0c
.extern func_02034a60
.extern func_02038d38
.extern ActorDerivedType1_IsActiveRecordType6F
.extern func_0204cfa4
.extern func_020adae4
.extern func_020adc90
.extern func_ov092_0221ad80

    .global func_02039468
    .type func_02039468, @function
func_02039468: ; 0x02039468
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r0
    bl ActorDerivedType1_IsActiveRecordType6F
    cmp r0, #0x0
    beq .L_02039700
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x80]
    cmp r1, #0x0
    bne .L_02039700
    mov r1, #0x0
    str r1, [r10, #0x90]
    str r1, [r10, #0x8c]
    str r1, [r10, #0x40]
    str r1, [r10, #0x3c]
    mov r1, #0x28
    strh r1, [r0, #0x80]
    ldr r0, [r10, #0x27c]
    mov r1, #0x3
    ldrsh r0, [r0, #0xc]
    mov r6, r0, lsl #0xc
    bl func_020adae4
    mov r4, r0
    add r0, sp, #0x10
    add r1, r10, #0x18
    bl func_02005030
    ldrb r0, [r10, #0xd4]
    ldr r1, .L_02039708
    ldr r5, [sp, #0x14]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    mov r2, r2, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r0, [r1, r0]
    ldr r1, [sp, #0x18]
    rsb r3, r4, #0x0
    mla r2, r3, r2, r5
    mla r0, r4, r0, r1
    str r2, [sp, #0x14]
    str r0, [sp, #0x18]
    mov r9, #0x0
    mvn r5, #0x0
    b .L_020396bc
.L_02039524:
    ldr r0, .L_0203970c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_020396b8
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x4
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02039618
    ldrh r0, [r8, #0x4e]
    cmp r0, #0x1e
    bne .L_020396b8
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x0
    bne .L_020396b8
    ldr r1, [r8, #0x1c]
    ldr r0, [sp, #0x14]
    ldr r2, [r8, #0x20]
    sub r0, r1, r0
    ldr r1, [sp, #0x18]
    sub r1, r2, r1
    bl func_0204cfa4
    mov r4, r0
    cmp r4, r6
    bge .L_020396b8
    mov r0, r10
    mov r1, #0x54
    mov r2, #0x0
    bl func_02034a60
    ldr r0, [r10, #0x27c]
    ldrsh r0, [r0, #0x0]
    cmp r0, #0x67
    cmpne r0, #0x68
    bne .L_020395e8
    mov r0, r4
    mov r1, r6
    ldr r4, .L_02039710
    bl func_020adc90
    mov r0, r0, lsl #0x2
    mov r0, r0, asr #0xc
    rsb r2, r0, #0x14
    b .L_020395f0
.L_020395e8:
    mov r4, #0x800
    mov r2, #0x4
.L_020395f0:
    mov r3, r4
    mov r0, r8
    mov r1, r10
    bl func_ov092_0221ad80
    add r1, r8, #0x18
    mov r0, r10
    mov r2, #0xf
    mov r3, r5
    bl func_02038d38
    b .L_020396b8
.L_02039618:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020396b8
    ldr r0, [r8, #0x10]
    tst r0, #0x1000000
    bne .L_020396b8
    ldr r1, [r8, #0x1c]
    ldr r0, [sp, #0x14]
    ldr r2, [r8, #0x20]
    sub r11, r1, r0
    ldr r1, [sp, #0x18]
    mov r0, r11
    sub r7, r2, r1
    mov r1, r7
    bl func_0204cfa4
    mov r4, r0
    cmp r4, #0x1000
    blt .L_020396b8
    cmp r4, r6
    bge .L_020396b8
    add r0, sp, #0x0
    bl func_02004fe0
    mov r0, r11
    mov r1, r4
    bl func_020adc90
    str r0, [sp, #0x4]
    mov r1, r4
    mov r0, r7
    bl func_020adc90
    str r0, [sp, #0x8]
    mov r0, r8
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
    add r0, sp, #0x0
    bl func_02005058
.L_020396b8:
    add r9, r9, #0x1
.L_020396bc:
    ldr r0, .L_0203970c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02039524
    ldr r0, [r10, #0x27c]
    ldrh r1, [r0, #0x2e]
    cmp r1, #0x0
    beq .L_020396f8
    mov r0, r10
    mov r2, #0x0
    bl func_02034a60
.L_020396f8:
    add r0, sp, #0x10
    bl func_02005058
.L_02039700:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02039708: .word data_020c9670
.L_0203970c: .word data_021052fc
.L_02039710: .word 0x1ccd
    .size func_02039468, . - func_02039468
