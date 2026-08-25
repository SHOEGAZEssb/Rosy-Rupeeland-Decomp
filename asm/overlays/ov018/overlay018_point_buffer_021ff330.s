    .text
/* Exact fallback; see src/overlays/ov018/overlay018_point_buffer.c (constructor). */
    .extern data_ov018_021ffd8c
    .extern data_ov018_021ffd94
    .extern Heap_AllocAlternateEntry
    .extern func_ov018_021ff3cc
    .extern gHeapContext
.global func_ov018_021ff330
func_ov018_021ff330:
    stmdb sp!, {r4, lr}
    ldr r2, L_021ff370
    mov r4, r0
    str r2, [r4, #0x0]
    mov r0, r1
    str r1, [r4, #0xc]
    ldr r1, L_021ff374
    ldr r3, L_021ff378
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r4, #0x4]
    mov r0, r4
    bl func_ov018_021ff3cc
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff370: .word data_ov018_021ffd8c
L_021ff374: .word data_ov018_021ffd94
L_021ff378: .word gHeapContext
    .size func_ov018_021ff330, . - func_ov018_021ff330
