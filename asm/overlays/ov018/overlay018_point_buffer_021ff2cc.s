    .text
/* Exact fallback; see src/overlays/ov018/overlay018_point_buffer.c (deleting wrappers). */
    .extern Heap_Free
    .extern data_ov018_021ffd00
    .extern PresentationList_DeleteAll
.global func_ov018_021ff2cc
func_ov018_021ff2cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov018_021ff2cc, . - func_ov018_021ff2cc

    .global func_ov018_021ff2e0
func_ov018_021ff2e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov018_021ff2e0, . - func_ov018_021ff2e0

    .global func_ov018_021ff2f4
func_ov018_021ff2f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov018_021ff2f4, . - func_ov018_021ff2f4

    .global func_ov018_021ff308
func_ov018_021ff308:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff32c
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff32c: .word data_ov018_021ffd00
    .size func_ov018_021ff308, . - func_ov018_021ff308
