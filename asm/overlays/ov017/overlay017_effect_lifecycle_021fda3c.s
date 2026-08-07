    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_lifecycle.c. */
    .extern Heap_Free
    .extern func_ov017_021fd780
    .extern func_ov017_021fd948
.global func_ov017_021fda3c
func_ov017_021fda3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xbc
    bl func_ov017_021fd780
    mov r0, r4
    bl func_ov017_021fd948
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov017_021fda3c, . - func_ov017_021fda3c

