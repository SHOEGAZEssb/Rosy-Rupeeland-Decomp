.text
.extern GameWork_TestFlag
.extern GameWork_ClearFlag
.extern func_02062c00
.extern Heap_Alloc
.extern func_ov044_0220b740
.extern func_ov044_0220b944
.extern func_02093d7c
.extern func_02093d50
.extern func_ov044_0220ba40
.extern func_ov044_0220b9c8
.extern gGameWork
.extern data_021e9ac0
.extern data_ov044_0220d348
.extern gHeapContext
.extern data_020f4e14

    .global func_ov044_0220c440
func_ov044_0220c440:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, .L_0220c5a8
    mov r10, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0220c5ac
    mvn r5, #0x0
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220c484
    ldr r0, .L_0220c5a8
    ldr r1, .L_0220c5ac
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_0220c5a8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    ldrsh r5, [r0, #0xca]
.L_0220c484:
    ldr r0, .L_0220c5b0
    mov r7, #0x0
    ldr r4, [r0, #0x0]
    mov r8, r7
    ldr r6, [r4, #0x28]
    mvn r11, #0x0
    b .L_0220c4e4
.L_0220c4a0:
    mov r0, #0x24
    mul r9, r8, r0
    ldr r0, [r4, #0x20]
    add r0, r0, r9
    bl func_02062c00
    cmp r0, #0x0
    beq .L_0220c4e0
    cmp r5, #0x0
    blt .L_0220c4dc
    ldr r0, [r4, #0x20]
    ldrh r0, [r0, r9]
    cmp r5, r0
    streq r8, [r10, #0x234]
    moveq r5, r11
    streq r8, [r10, #0x230]
.L_0220c4dc:
    add r7, r8, #0x1
.L_0220c4e0:
    add r8, r8, #0x1
.L_0220c4e4:
    cmp r8, r6
    blt .L_0220c4a0
    ldr r1, .L_0220c5b4
    ldr r3, .L_0220c5b8
    mov r0, #0x4c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220c518
    ldr r1, .L_0220c5bc
    mov r2, r7
    ldr r1, [r1, #0x0]
    bl func_ov044_0220b740
.L_0220c518:
    mov r8, #0x0
    str r0, [r10, #0x228]
    mov r6, r8
    mov r11, r8
    mov r5, #0x24
    b .L_0220c56c
.L_0220c530:
    ldr r0, [r4, #0x20]
    mla r9, r8, r5, r0
    mov r0, r9
    str r6, [r9, #0x20]
    bl func_02062c00
    cmp r0, #0x0
    ldr r0, [r10, #0x228]
    mov r1, r9
    beq .L_0220c560
    mov r2, r11
    bl func_ov044_0220b944
    b .L_0220c568
.L_0220c560:
    mov r2, #0x1
    bl func_ov044_0220b944
.L_0220c568:
    add r8, r8, #0x1
.L_0220c56c:
    cmp r8, r7
    blt .L_0220c530
    ldr r0, [r10, #0x228]
    ldr r1, [r10, #0x230]
    ldr r0, [r0, #0x44]
    bl func_02093d7c
    ldr r0, [r10, #0x228]
    ldr r1, [r10, #0x234]
    ldr r0, [r0, #0x44]
    bl func_02093d50
    ldr r0, [r10, #0x228]
    bl func_ov044_0220ba40
    ldr r0, [r10, #0x228]
    bl func_ov044_0220b9c8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c5a8: .word gGameWork
.L_0220c5ac: .word 0x3a6
.L_0220c5b0: .word data_021e9ac0
.L_0220c5b4: .word data_ov044_0220d348
.L_0220c5b8: .word gHeapContext
.L_0220c5bc: .word data_020f4e14
.size func_ov044_0220c440, . - func_ov044_0220c440
