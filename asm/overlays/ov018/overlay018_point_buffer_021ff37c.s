    .text
/* Exact fallback; see src/overlays/ov018/overlay018_point_buffer.c (lifecycle and accessors). */
    .extern Heap_Free
    .extern data_ov018_021ffd8c
    .extern Heap_FreeAlternateEntry
.global func_ov018_021ff37c
func_ov018_021ff37c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff39c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl Heap_FreeAlternateEntry
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff39c: .word data_ov018_021ffd8c
    .size func_ov018_021ff37c, . - func_ov018_021ff37c

    .global func_ov018_021ff3a0
func_ov018_021ff3a0:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff3c8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl Heap_FreeAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff3c8: .word data_ov018_021ffd8c
    .size func_ov018_021ff3a0, . - func_ov018_021ff3a0

    .global func_ov018_021ff3cc
func_ov018_021ff3cc:
    mov r3, #0x0
    sub r1, r3, #0x1
    str r3, [r0, #0x10]
    str r1, [r0, #0x18]
    str r1, [r0, #0x14]
    mov r2, #0x1000
    strh r2, [r0, #0x1e]
    ldr r1, L_021ff404
    strh r2, [r0, #0x1c]
    strh r1, [r0, #0x22]
    ldrsh r1, [r0, #0x22]
    strh r1, [r0, #0x20]
    str r3, [r0, #0x24]
    bx lr
L_021ff404: .word 0xffffecd6
    .size func_ov018_021ff3cc, . - func_ov018_021ff3cc

    .global func_ov018_021ff408
func_ov018_021ff408:
    ldr r1, [r0, #0x10]
    ldr r0, [r0, #0xc]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size func_ov018_021ff408, . - func_ov018_021ff408

    .global func_ov018_021ff420
func_ov018_021ff420:
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size func_ov018_021ff420, . - func_ov018_021ff420

    .global func_ov018_021ff434
func_ov018_021ff434:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x10]
    ldr r3, [r0, #0xc]
    cmp lr, r3
    ldmgeia sp!, {r3, pc}
    ldr ip, [r0, #0x4]
    mov r3, lr, lsl #0x2
    strh r1, [ip, r3]
    ldr r3, [r0, #0x4]
    ldr r1, [r0, #0x10]
    add r1, r3, r1, lsl #0x2
    strh r2, [r1, #0x2]
    ldr r1, [r0, #0x10]
    add r1, r1, #0x1
    str r1, [r0, #0x10]
    ldmia sp!, {r3, pc}
    .size func_ov018_021ff434, . - func_ov018_021ff434
