.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_child_spawn.c for documented portable C. */

    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern Heap_Alloc
    .extern func_ov036_02201d70
    .extern func_02094bbc
    .extern func_ov036_021fe978
    .extern func_02095274
    .extern func_020948d4
    .extern data_ov036_022054e0
    .extern data_ov036_022054e4
    .extern data_ov036_022054e8
    .extern data_ov036_022054ec
    .extern data_ov036_02206188
    .extern gHeapContext

    .global func_ov036_02202628
func_ov036_02202628:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r1, [r6, #0x15c]
    ldr r0, L_02202774
    ldr r0, [r0, r1, lsl #0x4]
    cmp r0, #0x0
    beq L_0220266c
    cmp r0, #0x1
    bne L_02202684
    ldr r0, [r6, #0xf8]
    add r1, r6, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    mov r0, #0xd
    strb r0, [r4, #0x5a]
    b L_02202684
L_0220266c:
    ldr r0, [r6, #0xf8]
    add r1, r6, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    mov r0, #0x2
    strb r0, [r4, #0x5a]
L_02202684:
    ldr r1, L_02202778
    ldr r3, L_0220277c
    mov r0, #0xf8
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_022026c8
    ldr r3, [r6, #0x15c]
    ldr r2, L_02202780
    ldr r1, L_02202774
    ldr r2, [r2, r3, lsl #0x4]
    ldr r3, [r1, r3, lsl #0x4]
    str r2, [sp, #0x0]
    ldr r1, [r6, #0xf4]
    mov r2, r4
    bl func_ov036_02201d70
    mov r5, r0
L_022026c8:
    ldr r3, [r6, #0x15c]
    ldr r1, L_02202784
    ldr r0, L_02202788
    mov r2, #0xa00
    ldr r1, [r1, r3, lsl #0x4]
    ldr r3, [r0, r3, lsl #0x4]
    mov r0, r5
    rsb r2, r2, #0x0
    bl func_02094bbc
    mov r2, #0xa00
    ldr r3, [r6, #0x15c]
    ldr r1, L_02202784
    ldr r0, L_02202788
    ldr r1, [r1, r3, lsl #0x4]
    ldr r3, [r0, r3, lsl #0x4]
    mov r0, r4
    rsb r2, r2, #0x0
    bl func_ov036_021fe978
    ldrh r2, [r4, #0x50]
    mov r1, r5
    add r0, r6, #0x10c
    orr r2, r2, #0x42
    strh r2, [r4, #0x50]
    bl func_02095274
    ldr r1, [r6, #0x15c]
    ldr r0, L_02202774
    ldr r0, [r0, r1, lsl #0x4]
    cmp r0, #0x0
    beq L_02202754
    cmp r0, #0x1
    bne L_02202760
    add r0, r5, #0x6c
    mov r1, #0x400
    bl func_020948d4
    b L_02202760
L_02202754:
    ldr r1, L_0220278c
    add r0, r5, #0x6c
    bl func_020948d4
L_02202760:
    ldr r0, [r6, #0x15c]
    add r0, r0, #0x1
    str r0, [r6, #0x15c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_02202774: .word data_ov036_022054e0
L_02202778: .word data_ov036_02206188
L_0220277c: .word gHeapContext
L_02202780: .word data_ov036_022054ec
L_02202784: .word data_ov036_022054e4
L_02202788: .word data_ov036_022054e8
L_0220278c: .word 0x666
    .size func_ov036_02202628, .-func_ov036_02202628

