.text

/* Exact fallback; see src/overlays/ov038/overlay038_presentation_lifecycle.c for documented portable C. */

    .extern func_020280d8
    .extern Heap_Free
    .extern func_ov046_0220ba80
    .extern func_0207419c
    .extern func_020927b8
    .extern func_ov038_021fce00
    .extern func_02071eb8
    .extern data_ov038_021fdd28

    .global func_ov038_021fd0d8
func_ov038_021fd0d8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd16c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r4, [r5, #0x344]
    cmp r4, #0x0
    beq L_021fd110
    mov r0, r4
    bl func_020280d8
    mov r0, r4
    bl Heap_Free
L_021fd110:
    ldr r4, [r5, #0x340]
    cmp r4, #0x0
    beq L_021fd12c
    mov r0, r4
    bl func_ov046_0220ba80
    mov r0, r4
    bl Heap_Free
L_021fd12c:
    ldr r0, [r5, #0x60]
    bl func_0207419c
    ldr r0, [r5, #0x314]
    cmp r0, #0x0
    beq L_021fd14c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd14c:
    add r0, r5, #0x318
    bl func_020927b8
    add r0, r5, #0x64
    bl func_ov038_021fce00
    add r0, r5, #0x54
    bl func_02071eb8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd16c: .word data_ov038_021fdd28
    .size func_ov038_021fd0d8, .-func_ov038_021fd0d8

    .global func_ov038_021fd170
func_ov038_021fd170:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd20c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r4, [r5, #0x344]
    cmp r4, #0x0
    beq L_021fd1a8
    mov r0, r4
    bl func_020280d8
    mov r0, r4
    bl Heap_Free
L_021fd1a8:
    ldr r4, [r5, #0x340]
    cmp r4, #0x0
    beq L_021fd1c4
    mov r0, r4
    bl func_ov046_0220ba80
    mov r0, r4
    bl Heap_Free
L_021fd1c4:
    ldr r0, [r5, #0x60]
    bl func_0207419c
    ldr r0, [r5, #0x314]
    cmp r0, #0x0
    beq L_021fd1e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd1e4:
    add r0, r5, #0x318
    bl func_020927b8
    add r0, r5, #0x64
    bl func_ov038_021fce00
    add r0, r5, #0x54
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd20c: .word data_ov038_021fdd28
    .size func_ov038_021fd170, .-func_ov038_021fd170
