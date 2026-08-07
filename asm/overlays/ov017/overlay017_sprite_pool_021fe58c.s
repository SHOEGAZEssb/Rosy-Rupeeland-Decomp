    .text

/* Exact fallback; see src/overlays/ov017/overlay017_sprite_pool.c. */
    .extern func_020720d4
    .extern func_02077688
.global func_ov017_021fe58c
func_ov017_021fe58c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0x0]
    bl func_02077688
    add r0, r4, #0x4
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov017_021fe58c, . - func_ov017_021fe58c
