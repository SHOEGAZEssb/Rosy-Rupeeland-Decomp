    .text
/* Exact ABI fallback; see src/overlays/ov011/overlay011_scene_fields_initialize.c. */
    .global Overlay011_InitSceneFields
Overlay011_InitSceneFields:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0
    str r1, [r0, #4]
    str r1, [r0, #8]
    add sp, sp, #0x10
    bx lr
    .size Overlay011_InitSceneFields, . - Overlay011_InitSceneFields
