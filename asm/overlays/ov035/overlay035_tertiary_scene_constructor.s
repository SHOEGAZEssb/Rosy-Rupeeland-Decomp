.text

/* Exact fallback; see src/overlays/ov035/overlay035_tertiary_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern func_020720c0
    .extern func_02091b6c
    .extern func_02091d08
    .extern func_ov035_021fdce8
    .extern func_020720e8
    .extern func_020779ac
    .extern func_02077624
    .extern func_02077308
    .extern func_ov035_021fdd28
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern func_020b0300
    .extern func_02092850
    .extern func_02091d24
    .extern data_ov035_02203cb0
    .extern data_020f4e18
    .extern data_ov035_02203d20
    .extern gHeapContext


    .global func_ov035_021ff478
func_ov035_021ff478: 
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov035_021fce00
    ldr r1, L_021ffa0c
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0xe8
    bl func_020720c0
    add r0, r5, #0xf4
    bl func_020720c0
    add r0, r5, #0x100
    bl func_020720c0
    add r0, r5, #0x10c
    bl func_020720c0
    add r0, r5, #0x118
    bl func_020720c0
    add r0, r5, #0x140
    bl func_02091b6c
    add r0, r5, #0x15c
    bl func_02091d08
    add r0, r5, #0x174
    bl func_ov035_021fdce8
    add r0, r5, #0x184
    bl func_ov035_021fdce8
    ldr r3, L_021ffa10
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_021ffa14
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xdc
    bl func_020779ac
    ldr r0, [r5, #0x4]
    cmp r0, #0xca
    beq L_021ff530
    cmp r0, #0xcd
    beq L_021ff574
    cmp r0, #0xd0
    beq L_021ff5b8
L_021ff530:
    ldr r3, L_021ffa18
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_021ffa1c
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021ff5f8
L_021ff574:
    ldr r3, L_021ffa18
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_021ffa20
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_021ff5f8
L_021ff5b8:
    ldr r3, L_021ffa18
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl func_020720e8
    ldr r3, L_021ffa24
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
L_021ff5f8:
    mov r0, r4
    add r1, r5, #0xe8
    bl func_020779ac
    mov r0, r4
    add r1, r5, #0xcc
    bl func_020779ac
    ldr r3, L_021ffa28
    ldr r0, L_021ffa14
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r5, #0xf4
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xf4
    bl func_020779ac
    ldr r3, L_021ffa2c
    ldr r1, L_021ffa14
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0x100
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0x100
    bl func_020779ac
    ldr r3, L_021ffa30
    ldr r1, L_021ffa14
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0x10c
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0x10c
    bl func_020779ac
    ldr r3, L_021ffa34
    ldr r1, L_021ffa14
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0x118
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0x118
    bl func_020779ac
    mov r0, r4
    bl func_02077624
    add r1, r5, #0xdc
    str r0, [r5, #0x124]
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x7
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff720
    mov r1, r4
    bl func_020955d8
L_021ff720:
    str r0, [r5, #0x128]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0xe8
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xc
    str r4, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff788
    mov r1, r4
    bl func_020955d8
L_021ff788:
    str r0, [r5, #0x12c]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0xf4
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xc
    str r4, [sp, #0x4]
    mov r4, #0x46
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff7f0
    mov r1, r4
    bl func_020955d8
L_021ff7f0:
    str r0, [r5, #0x130]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0x100
    bl func_02077308
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0xc
    str r1, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r3, r2
    mov r1, #0x1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff858
    mov r1, r4
    bl func_020955d8
L_021ff858:
    str r0, [r5, #0x134]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0x10c
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xc
    str r4, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff8c0
    mov r1, r4
    bl func_020955d8
L_021ff8c0:
    str r0, [r5, #0x138]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0x10c
    bl func_02077308
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0xc
    str r1, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r3, r2
    mov r1, #0x1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff928
    mov r1, r4
    bl func_020955d8
L_021ff928:
    str r0, [r5, #0x13c]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    ldr r0, [r5, #0x124]
    add r1, r5, #0xcc
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0xc
    str r4, [sp, #0x4]
    mov r4, #0x42
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021ffa38
    ldr r3, L_021ffa3c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff990
    mov r1, r4
    bl func_020955d8
L_021ff990:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x174
    bl func_02095274
    mov r1, #0x0
    mov r2, r1
    add r0, r5, #0xc
    mov r3, #0x2800
    bl func_ov035_021fdd70
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0xc
    bl func_ov035_021fdd78
    mov r0, #0x0
    ldr r2, L_021ffa40
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl func_02092850
    mov r1, #0x0
    mov r3, #0x1
    add r0, r5, #0x15c
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_02091d24
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021ffa0c: .word data_ov035_02203cb0
L_021ffa10: .word 0x600b
L_021ffa14: .word data_020f4e18
L_021ffa18: .word 0x606d
L_021ffa1c: .word 0x6113
L_021ffa20: .word 0x6116
L_021ffa24: .word 0x6119
L_021ffa28: .word 0x608c
L_021ffa2c: .word 0x6089
L_021ffa30: .word 0x608f
L_021ffa34: .word 0x6092
L_021ffa38: .word data_ov035_02203d20
L_021ffa3c: .word gHeapContext
L_021ffa40: .word 0x7fff
.size func_ov035_021ff478, .-func_ov035_021ff478

