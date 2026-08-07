    .text
    .extern Heap_Free
    .extern func_02071eb8
    .extern func_0209548c

/* Exact fallbacks for sprite-wrapper deleting destruction; see src/overlays/ov016/overlay016_sprite_wrapper.c. */
    .global func_ov016_021fe0ac

func_ov016_021fe0ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl func_02071eb8
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

    .size func_ov016_021fe0ac, . - func_ov016_021fe0ac
