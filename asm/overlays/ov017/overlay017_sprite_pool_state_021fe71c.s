    .text

/* Exact fallback; see src/overlays/ov017/overlay017_sprite_pool_state.c. */
    .extern TitleInterpolatedValue_Configure
.global Overlay017_HideSpritePool
Overlay017_HideSpritePool:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r1, #0x10
    mov r4, r0
    str r1, [sp, #0x0]
    ldr r2, [r4, #0x48]
    add r0, r4, #0x38
    mov r1, #0x2
    mov r3, #0x0
    bl TitleInterpolatedValue_Configure
    mov r0, #0x3
    str r0, [r4, #0x30]
    mov r0, #0x0
    str r0, [r4, #0x34]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
    .size Overlay017_HideSpritePool, . - Overlay017_HideSpritePool
