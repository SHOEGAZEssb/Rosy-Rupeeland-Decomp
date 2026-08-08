.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_construct.c for documented portable C. */

    .extern func_ov037_021fce00
    .extern func_020720c0
    .extern func_ov037_021fd6d0
    .extern func_02077a8c
    .extern func_02091b6c
    .extern func_020720e8
    .extern func_020779ac
    .extern func_02071adc
    .extern func_02077624
    .extern func_02077308
    .extern func_ov037_021fd710
    .extern Heap_Alloc
    .extern func_ov037_021fd5ac
    .extern func_02095274
    .extern func_020955d8
    .extern func_ov037_021fd22c
    .extern func_ov037_021fd1cc
    .extern func_ov037_021fd758
    .extern func_ov037_021fd760
    .extern func_ov037_021fd770
    .extern func_020b0300
    .extern func_02092850
    .extern data_ov037_021fedd0
    .extern data_020f4e18
    .extern data_ov037_021feeb0
    .extern data_ov037_021feeb8
    .extern gHeapContext

    .global func_ov037_021fd7e4
func_ov037_021fd7e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r4, r1
    bl func_ov037_021fce00
    ldr r1, L_021fdb78
    add r0, r5, #0xc8
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0xd4
    bl func_020720c0
    add r0, r5, #0xe0
    bl func_020720c0
    add r0, r5, #0xec
    bl func_020720c0
    add r0, r5, #0xf8
    bl func_020720c0
    add r0, r5, #0x104
    bl func_020720c0
    add r0, r5, #0x12c
    bl func_ov037_021fd6d0
    add r0, r5, #0x13c
    bl func_ov037_021fd6d0
    add r0, r5, #0x14c
    bl func_02077a8c
    add r0, r5, #0x18c
    bl func_02091b6c
    add r0, r5, #0x1a8
    bl func_02091b6c
    add r0, r5, #0x1c4
    bl func_02091b6c
    ldr r3, L_021fdb7c
    add r0, r5, #0xc8
    str r3, [sp, #0x0]
    ldr r1, L_021fdb80
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xc8
    bl func_020779ac
    ldr r3, L_021fdb84
    add r0, r5, #0xd4
    str r3, [sp, #0x0]
    ldr r1, L_021fdb80
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xd4
    bl func_020779ac
    ldr r3, L_021fdb88
    add r0, r5, #0xe0
    str r3, [sp, #0x0]
    ldr r1, L_021fdb80
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xe0
    bl func_020779ac
    ldr r3, L_021fdb8c
    add r0, r5, #0xec
    str r3, [sp, #0x0]
    ldr r1, L_021fdb80
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xec
    bl func_020779ac
    ldr r3, L_021fdb90
    ldr r0, L_021fdb80
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r5, #0xf8
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xf8
    bl func_020779ac
    ldr r3, L_021fdb94
    ldr r1, L_021fdb80
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0x104
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0x104
    bl func_020779ac
    ldr r0, L_021fdb80
    ldr r1, L_021fdb98
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0x110]
    mov r0, r4
    bl func_02077624
    add r1, r5, #0xc8
    str r0, [r5, #0x114]
    bl func_02077308
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r7, r0
    bl func_ov037_021fd710
    ldr r0, [r5, #0x114]
    add r1, r5, #0x104
    bl func_02077308
    mov r6, r0
    ldr r1, L_021fdb9c
    ldr r3, L_021fdba0
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd9f0
    mov r1, r7
    mov r2, r6
    bl func_ov037_021fd5ac
L_021fd9f0:
    str r0, [r5, #0x118]
    mov r1, r0
    add r0, r5, #0x12c
    bl func_02095274
    ldr r0, [r5, #0x114]
    add r1, r5, #0xd4
    bl func_02077308
    mov r6, r0
    ldr r1, L_021fdb9c
    ldr r3, L_021fdba0
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fda34
    mov r1, r6
    bl func_020955d8
L_021fda34:
    str r0, [r5, #0x11c]
    mov r1, r0
    add r0, r5, #0x12c
    bl func_02095274
    ldr r0, [r5, #0x114]
    add r1, r5, #0xe0
    bl func_02077308
    mov r6, r0
    mov r2, #0x4
    ldr r0, L_021fdba4
    strb r2, [r6, #0x5a]
    strh r0, [r6, #0x4e]
    ldr r1, L_021fdb9c
    ldr r3, L_021fdba0
    mov r0, #0xa0
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fda84
    mov r1, r6
    bl func_020955d8
L_021fda84:
    str r0, [r5, #0x120]
    mov r1, r0
    add r0, r5, #0x12c
    bl func_02095274
    ldr r1, L_021fdba8
    ldr r3, L_021fdba0
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdab8
    mov r1, r4
    bl func_ov037_021fd22c
L_021fdab8:
    str r0, [r5, #0x124]
    mov r1, r0
    add r0, r5, #0x12c
    bl func_02095274
    ldr r1, L_021fdba8
    ldr r3, L_021fdba0
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdae8
    bl func_ov037_021fd1cc
L_021fdae8:
    str r0, [r5, #0x128]
    mov r1, r0
    add r0, r5, #0x12c
    bl func_02095274
    mov r1, #0x0
    mov r2, r1
    add r0, r5, #0x8
    mov r3, #0x2800
    bl func_ov037_021fd758
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x8
    bl func_ov037_021fd760
    mov r3, #0x1000
    rsb r3, r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r5, #0x14c
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov037_021fd770
    mov r0, #0x0
    ldr r2, L_021fdbac
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl func_02092850
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fdb78: .word data_ov037_021fedd0
L_021fdb7c: .word 0x604a
L_021fdb80: .word data_020f4e18
L_021fdb84: .word 0x6050
L_021fdb88: .word 0x60bf
L_021fdb8c: .word 0x6056
L_021fdb90: .word 0x6059
L_021fdb94: .word 0x604d
L_021fdb98: .word 0x5010
L_021fdb9c: .word data_ov037_021feeb0
L_021fdba0: .word gHeapContext
L_021fdba4: .word 0x43ff
L_021fdba8: .word data_ov037_021feeb8
L_021fdbac: .word 0x7fff
    .size func_ov037_021fd7e4, .-func_ov037_021fd7e4
