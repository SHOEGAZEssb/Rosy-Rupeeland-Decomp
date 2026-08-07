    .text
/* Exact fallback; see src/overlays/ov022/overlay022_selection_effect.c. */
    .extern func_ov046_0220ba80
    .extern Heap_Free

.global func_ov022_021fe920
func_ov022_021fe920:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x35c]
    mov r1, #0x0
    str r1, [r0, #0x35c]
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov046_0220ba80
    mov r0, r4
    bl Heap_Free
    ldmia sp!, {r4, pc}
.size func_ov022_021fe920, . - func_ov022_021fe920
