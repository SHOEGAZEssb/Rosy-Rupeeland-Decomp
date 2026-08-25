    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */

.global Overlay020_DetailDialog_SetLayout
Overlay020_DetailDialog_SetLayout:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
    .size Overlay020_DetailDialog_SetLayout, . - Overlay020_DetailDialog_SetLayout
