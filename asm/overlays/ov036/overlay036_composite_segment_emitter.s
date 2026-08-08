.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_segment_emitter.c for documented portable C. */

    .extern func_0209189c
    .extern Heap_Alloc
    .extern func_ov036_021fd834
    .extern func_02095274
    .extern data_ov036_02206198
    .extern gHeapContext

    .global func_ov036_02203024
func_ov036_02203024:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r5, #0x0
    mov r8, r0
    mov r4, r2
    mov r6, r5
    mov r7, r5
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_02203118
L_0220304c: ; jump table
    b L_02203060 ; case 0
    b L_0220308c ; case 1
    b L_022030b8 ; case 2
    b L_022030e4 ; case 3
    b L_022030fc ; case 4
L_02203060:
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r5, r0
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r6, r0
    b L_02203118
L_0220308c:
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r6, r0
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r7, r0
    b L_02203118
L_022030b8:
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r5, r0
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r7, r0
    b L_02203118
L_022030e4:
    add r0, r8, #0xc0
    mov r1, #0x10
    mov r2, #0x1f
    bl func_0209189c
    mov r7, r0
    b L_02203118
L_022030fc:
    add r0, r8, #0xc0
    mov r1, #0x8
    mov r2, #0x10
    bl func_0209189c
    mov r7, r0
    mov r6, r7
    mov r5, r7
L_02203118:
    cmp r4, #0x0
    beq L_0220312c
    cmp r4, #0x1
    beq L_022031a4
    b L_02203218
L_0220312c:
    mov r1, #0x800
    add r0, r8, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r4, r0
    ldr r1, L_02203220
    ldr r3, L_02203224
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02203198
    mov r1, #0x600
    rsb r1, r1, #0x0
    str r4, [sp, #0x0]
    str r1, [sp, #0x4]
    add r1, r1, #0x5f0
    str r1, [sp, #0x8]
    str r5, [sp, #0xc]
    str r6, [sp, #0x10]
    mov r2, r4
    mov r1, #0x3c
    mov r3, #0x1200
    str r7, [sp, #0x14]
    bl func_ov036_021fd834
    mov r1, r0
L_02203198:
    add r0, r8, #0x110
    bl func_02095274
    b L_02203218
L_022031a4:
    mov r1, #0x600
    add r0, r8, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x1200
    bl func_0209189c
    mov r4, r0
    ldr r1, L_02203220
    ldr r3, L_02203224
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_02203210
    mov r2, #0x800
    str r2, [sp, #0x0]
    add r1, r4, #0x80
    str r1, [sp, #0x4]
    sub r1, r2, #0x810
    str r1, [sp, #0x8]
    str r5, [sp, #0xc]
    str r6, [sp, #0x10]
    mov r3, r4
    sub r2, r2, #0x1000
    mov r1, #0x3c
    str r7, [sp, #0x14]
    bl func_ov036_021fd834
    mov r1, r0
L_02203210:
    add r0, r8, #0x110
    bl func_02095274
L_02203218:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_02203220: .word data_ov036_02206198
L_02203224: .word gHeapContext
    .size func_ov036_02203024, .-func_ov036_02203024

