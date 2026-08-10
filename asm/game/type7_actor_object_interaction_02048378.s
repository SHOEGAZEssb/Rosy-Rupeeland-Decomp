; Matching retail form; see src/game/type7_actor_object_interaction.c.
.text
.extern Heap_Alloc
.extern data_020e16b0
.extern data_020e1750
.extern data_020e1798
.extern data_020e17a8
.extern data_020e1900
.extern data_020e1908
.extern data_020e1918
.extern data_020e1d0c
.extern func_0201f864
.extern Type7Actor_HasSpecialCallbackPair
.extern func_020478b0
.extern func_020481dc
.extern func_020486a8
.extern func_0204b7bc
.extern func_0204c74c
.extern gHeapContext
.global func_02048378
.type func_02048378, @function

func_02048378: ; 0x02048378
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    mov r4, r1
    bl func_0204c74c
    cmp r0, #0x0
    beq .L_02048678
    add r0, r5, #0x200
    ldrh r1, [r0, #0xa6]
    cmp r1, #0x0
    bne .L_02048678
    ldr r1, [r5, #0x280]
    cmp r1, #0x0
    beq .L_02048678
    ldr r1, [r5, #0x268]
    tst r1, #0x8000
    beq .L_02048678
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    bgt .L_02048678
    ldr r1, .L_02048680
    mov r0, #0x1
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x268]
    mov ip, r0
    cmp r3, r1
    ldr r1, .L_02048684
    bne .L_020483fc
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_020483fc:
    cmp ip, #0x0
    beq .L_0204843c
    ldr r1, .L_02048680
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xf8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02048688
    bne .L_02048434
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02048434:
    cmp ip, #0x0
    movne r0, #0x0
.L_0204843c:
    cmp r0, #0x0
    bne .L_02048678
    mov r0, r5
    bl func_020486a8
    cmp r0, #0x0
    beq .L_02048678
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa0]
    strh r1, [r0, #0x66]
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x2
    beq .L_0204847c
    cmp r0, #0x4
    beq .L_020485c0
    b .L_02048678
.L_0204847c:
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_02048678
    mov r0, r5
    str r4, [r5, #0x210]
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    bne .L_020484d0
    ldr r1, .L_0204868c
    mov r0, r5
    ldmia r1, {r1, r2}
    mov r3, #0x14
    bl func_020481dc
    add r0, r5, #0x200
    mov r1, #0x3c
    strh r1, [r0, #0x56]
    mov r1, #0xb4
    strh r1, [r0, #0x5a]
    b .L_02048678
.L_020484d0:
    ldr r0, .L_02048680
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x250]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02048690
    bne .L_02048500
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02048500:
    cmp r3, #0x0
    bne .L_02048678
    add r0, r5, #0x200
    ldrh r1, [r0, #0xa2]
    cmp r1, #0x28
    bls .L_02048678
    mov r1, #0x0
    mov r2, #0x78
    strh r1, [r0, #0xa2]
    ldr r1, .L_02048694
    strh r2, [r0, #0xa4]
    mov r0, r5
    sub r3, r2, #0x79
    ldmia r1, {r1, r2}
    bl func_020481dc
    add r2, r5, #0x200
    mov r1, #0x3c
    mov r0, r5
    strh r1, [r2, #0x56]
    mov r3, #0xb4
    mov r1, #0x0
    strh r3, [r2, #0x5a]
    bl func_0204b7bc
    ldr r1, .L_02048698
    ldr r3, .L_0204869c
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02048678
    ldr r3, .L_020486a0
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x4
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r5, #0x54]
    add r1, r5, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
    b .L_02048678
.L_020485c0:
    ldr r0, [r5, #0xd0]
    tst r0, #0x40000
    movne r1, #0x1
    cmp r1, #0x0
    beq .L_020485f8
    add r0, r5, #0x200
    mov r3, #0xb4
    ldr r1, .L_020486a4
    strh r3, [r0, #0x4a]
    ldmia r1, {r1, r2}
    mov r0, r5
    bl func_020481dc
    str r4, [r5, #0x210]
    b .L_02048678
.L_020485f8:
    ldrh r0, [r4, #0x4e]
    cmp r0, #0x68
    bne .L_0204862c
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    beq .L_02048678
    mov r0, r5
    add r1, r4, #0x18
    str r4, [r5, #0x210]
    bl func_020478b0
    b .L_02048678
.L_0204862c:
    cmp r0, #0x14
    bne .L_0204865c
    ldr r0, [r5, #0x29c]
    ldrh r0, [r0, #0x38]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    beq .L_02048678
    mov r0, r5
    add r1, r4, #0x18
    str r4, [r5, #0x210]
    bl func_020478b0
    b .L_02048678
.L_0204865c:
    sub r0, r0, #0x24
    cmp r0, #0x2
    bhi .L_02048678
    mov r0, r5
    add r1, r4, #0x18
    str r4, [r5, #0x210]
    bl func_020478b0
.L_02048678:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_02048680: .word data_020e16b0
.L_02048684: .word data_020e1918
.L_02048688: .word data_020e17a8
.L_0204868c: .word data_020e1908
.L_02048690: .word data_020e1900
.L_02048694: .word data_020e1798
.L_02048698: .word data_020e1d0c
.L_0204869c: .word gHeapContext
.L_020486a0: .word 0x162c
.L_020486a4: .word data_020e1750

.size func_02048378, . - func_02048378

