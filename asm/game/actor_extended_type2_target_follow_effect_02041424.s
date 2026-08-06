; Matching retail form; see src/game/actor_extended_type2_target_follow_effect.c.
.text
.extern Heap_Alloc
.extern data_020e00c8
.extern func_0201f864
.extern func_0203f858
.extern func_020ada8c
.extern gHeapContext
.extern genrand_int32
.global func_02041424
.type func_02041424, @function
func_02041424: ; 0x02041424
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x1
    orr r1, r1, #0x2
    str r1, [r4, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02041568
    add r0, r4, #0x200
    ldrh r1, [r0, #0x54]
    add r1, r1, #0x1
    strh r1, [r0, #0x54]
    ldrh r0, [r0, #0x54]
    cmp r0, #0xb4
    bhi .L_02041494
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_02041494
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_020414ac
.L_02041494:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    b .L_02041568
.L_020414ac:
    ldr r1, [r4, #0x228]
    ldr r0, [r1, #0xd0]
    tst r0, #0x100
    mov r0, r4
    bne .L_020414cc
    add r1, r1, #0x18
    bl func_0203f858
    b .L_020414d8
.L_020414cc:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_020414d8:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x54]
    mov r1, #0x10
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_02041564
    ldr r1, .L_02041570
    ldr r3, .L_02041574
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02041564
    bl genrand_int32
    ldr r2, [r4, #0x54]
    bic r0, r0, #0x80000000
    mov r1, #0x3
    ldr r6, [r2, #0x0]
    bl func_020ada8c
    ldr lr, .L_02041578
    and ip, r0, #0xff
    add r1, r4, #0x18
    str lr, [sp, #0x0]
    add r4, lr, #0x1
    stmib sp, {r4, ip}
    mov r3, #0x12
    str r3, [sp, #0xc]
    sub r3, r3, #0x13
    str r3, [sp, #0x10]
    mov r4, #0x1
    mov r0, r5
    mov r2, r6
    sub r3, lr, #0x1
    str r4, [sp, #0x14]
    bl func_0201f864
.L_02041564:
    mov r0, #0x0
.L_02041568:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02041570: .word data_020e00c8
.L_02041574: .word gHeapContext
.L_02041578: .word 0x135c
.size func_02041424, . - func_02041424
