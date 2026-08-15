    .text
/* Exact fallback; see src/overlays/ov017/overlay017_final_handlers.c. */
    .extern Heap_Free
    .extern data_ov017_02201628
    .extern PresentationList_DeleteAll
.global func_ov017_022013b8
func_ov017_022013b8:
    stmdb sp!, {r4, lr}
    ldr r1, L_022013dc
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022013dc: .word data_ov017_02201628
    .size func_ov017_022013b8, . - func_ov017_022013b8
