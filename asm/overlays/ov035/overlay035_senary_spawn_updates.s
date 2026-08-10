.text

/* Exact fallback; see src/overlays/ov035/overlay035_senary_spawn_updates.c for documented portable C. */

    .extern func_0209189c
    .extern func_020918f4
    .extern func_ov035_02201d10
    .extern func_020948e4
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_ov035_021fdd28
    .extern func_02094bbc
    .extern func_02094cf0
    .extern func_020948d4
    .extern data_ov035_02203d20
    .extern data_ov035_02202bbc
    .extern gHeapContext

    .global func_ov035_02201df8
func_ov035_02201df8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    movs r6, r1
    mov r7, r0
    mov r8, #0xc00
    mov r5, #0x1800
    bne L_02201e48
    add r0, r7, #0xc0
    mov r1, #0x400
    mov r2, #0x800
    bl func_0209189c
    mov r1, #0x4000
    mov r9, r0
    add r0, r7, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl func_0209189c
    mov r4, r0
    rsb r5, r5, #0x0
    b L_02201e74
L_02201e48:
    rsb r8, r8, #0x0
    add r0, r7, #0xc0
    add r1, r8, #0x800
    add r2, r8, #0x400
    bl func_0209189c
    mov r9, r0
    add r0, r7, #0xc0
    mov r1, #0x0
    mov r2, #0x4000
    bl func_0209189c
    mov r4, r0
L_02201e74:
    ldr r0, [r7, #0x164]
    cmp r0, #0x2b
    movge r9, #0x0
    subge r0, r9, #0x500
    movge r4, #0x2000
    movge r1, #0x800
    bge L_02201ea8
    mov r1, #0x1000
    add r0, r7, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl func_0209189c
    mov r1, #0x0
L_02201ea8:
    str r9, [sp, #0x0]
    stmib sp, {r0, r1, r4, r6}
    mov r2, #0x800
    rsb r2, r2, #0x0
    mov r0, r7
    mov r1, r8
    sub r3, r2, #0x3800
    bl func_ov035_02201d10
    ldr r0, [r7, #0x104]
    mov r2, r5
    add r0, r0, #0x4c
    mov r1, #0x2
    bl func_020948e4
    ldr r1, [r7, #0x104]
    mov r0, #0x7
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r7, #0xf4]
    add r1, r7, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldr r1, L_02201fd8
    ldr r3, L_02201fdc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_02201f28
    mov r1, r4
    bl func_020955d8
    mov r5, r0
L_02201f28:
    mov r1, r5
    add r0, r7, #0x10c
    bl func_02095274
    add r0, r7, #0xc0
    mov r1, #0x8
    bl func_020918f4
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    mov r0, #0x7
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, r4
    mov r3, r2
    bl func_ov035_021fdd28
    add r0, r7, #0xc0
    mov r1, #0x1000
    rsb r1, r1, #0x0
    mov r2, #0x1000
    bl func_0209189c
    mov r4, r0
    add r0, r7, #0xc0
    mov r1, #0x1800
    rsb r1, r1, #0x0
    mov r2, #0x1800
    bl func_0209189c
    mov r1, r4
    mov r2, r0
    mov r0, r5
    mov r3, #0x3c00
    rsb r3, r3, #0x0
    bl func_02094bbc
    mov r0, r5
    ldr r1, L_02201fe0
    mov r2, #0x0
    bl func_02094cf0
    add r0, r5, #0x6c
    mov r1, #0x0
    bl func_020948d4
    mov r0, #0x1
    str r0, [r5, #0x88]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_02201fd8: .word data_ov035_02203d20
L_02201fdc: .word gHeapContext
L_02201fe0: .word data_ov035_02202bbc
    .size func_ov035_02201df8, .-func_ov035_02201df8

    .global func_ov035_02201fe4
func_ov035_02201fe4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x160]
    add r0, r0, #0x1
    str r0, [r5, #0x160]
    cmp r0, #0x1e
    blt L_02202138
    mov r0, #0x0
    str r0, [r5, #0x160]
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r6, r0
    ldr r1, L_02202140
    ldr r3, L_02202144
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02202044
    mov r1, r6
    bl func_020955d8
    mov r4, r0
L_02202044:
    mov r1, r4
    add r0, r5, #0x10c
    bl func_02095274
    add r0, r5, #0xc0
    mov r1, #0x2
    bl func_020918f4
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    mov r0, #0x7
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, r6
    mov r3, r2
    bl func_ov035_021fdd28
    add r0, r5, #0xc0
    mov r1, #0x2
    bl func_020918f4
    cmp r0, #0x0
    beq L_022020e0
    add r0, r4, #0x5c
    mov r1, #0x8000
    bl func_020948d4
    mov r1, #0x800
    add r0, r5, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r1, r0
    mov r0, r4
    mov r2, #0xe00
    mov r3, #0x0
    bl func_02094bbc
    add r0, r4, #0x1c
    mov r1, #0x3
    mov r2, #0xa00
    bl func_020948e4
    b L_02202120
L_022020e0:
    mov r1, #0x800
    add r0, r5, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r2, #0xe00
    mov r1, r0
    mov r0, r4
    rsb r2, r2, #0x0
    mov r3, #0x0
    bl func_02094bbc
    mov r2, #0xa00
    add r0, r4, #0x1c
    rsb r2, r2, #0x0
    mov r1, #0x3
    bl func_020948e4
L_02202120:
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    mov r0, #0x1
    str r0, [r4, #0x88]
L_02202138:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_02202140: .word data_ov035_02203d20
L_02202144: .word gHeapContext
    .size func_ov035_02201fe4, .-func_ov035_02201fe4

