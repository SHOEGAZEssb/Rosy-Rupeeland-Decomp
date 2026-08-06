; Matching retail form; see src/game/actor_extended_type2_runtime_group_proximity.c.
.text
.extern data_020e70c0
.extern data_021052fc
.global func_02040400
.type func_02040400, @function
func_02040400: ; 0x02040400
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    add r2, r0, #0x200
    ldrh r2, [r2, #0x54]
    cmp r2, #0x0
    movne r0, #0x0
    bne .L_02040580
    ldrsh r2, [r1, #0x10]
    cmp r2, #0x0
    beq .L_0204057c
    ldr r1, .L_02040588
    mul ip, r2, r2
    ldr r8, [r1, #0x0]
    add r1, r8, #0x2000
    ldr r2, [r1, #0xea4]
    ldr r1, [r1, #0xea8]
    ldr r2, [r2, #0x26c]
    cmp r1, #0x0
    str r2, [sp, #0x0]
    ldrne r2, [r1, #0x234]
    ldr r1, [sp, #0x0]
    moveq r2, #0x0
    cmp r1, #0x0
    str r2, [sp, #0x4]
    cmpeq r2, #0x0
    beq .L_0204057c
    mov lr, #0x0
    b .L_02040574
.L_02040470:
    cmp lr, #0x0
    ldrh r3, [r0, #0x4e]
    beq .L_02040494
    ldr r2, .L_0204058c
    mov r3, r3, lsl #0x1
    ldrsh r3, [r2, r3]
    mvn r1, #0x0
    cmp r3, r1
    beq .L_0204057c
.L_02040494:
    mov r4, #0x0
    mov r11, r4
    add r2, sp, #0x0
    b .L_02040568
.L_020404a4:
    ldr r1, [r2, r4, lsl #0x2]
    cmp r1, #0x0
    beq .L_02040564
    ldr r5, [r1, #0x44]
    mov r6, r11
    ldr r7, [r5, #0x84]
    b .L_0204055c
.L_020404c0:
    ldr r1, [r5, r6, lsl #0x2]
    ldr r9, [r1, #0x1d0]
    cmp r9, r0
    beq .L_02040558
    ldrb r1, [r9, #0x4d]
    cmp r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02040558
    ldrh r1, [r9, #0x4e]
    cmp r3, r1
    bne .L_02040558
    ldr r1, [r0, #0x1c]
    ldr r10, [r9, #0x1c]
    ldr r9, [r9, #0x20]
    mov r10, r10, asr #0xc
    rsb r1, r10, r1, asr #0xc
    mov r9, r9, asr #0xc
    ldr r10, [r0, #0x20]
    rsb r10, r9, r10, asr #0xc
    mul r9, r10, r10
    mla r9, r1, r1, r9
    cmp r9, ip
    bge .L_02040558
    cmp r4, #0x0
    ldr r2, [r0, #0x0]
    add r1, r8, #0x2000
    bne .L_02040544
    ldr r1, [r1, #0xea4]
    ldr r2, [r2, #0xd4]
    blx r2
    b .L_02040550
.L_02040544:
    ldr r1, [r1, #0xea8]
    ldr r2, [r2, #0xd4]
    blx r2
.L_02040550:
    mov r0, #0x1
    b .L_02040580
.L_02040558:
    add r6, r6, #0x1
.L_0204055c:
    cmp r6, r7
    blt .L_020404c0
.L_02040564:
    add r4, r4, #0x1
.L_02040568:
    cmp r4, #0x2
    blt .L_020404a4
    add lr, lr, #0x1
.L_02040574:
    cmp lr, #0x2
    blt .L_02040470
.L_0204057c:
    mov r0, #0x0
.L_02040580:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02040588: .word data_021052fc
.L_0204058c: .word data_020e70c0
.size func_02040400, . - func_02040400

