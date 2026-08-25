    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */

.global Overlay021_CopySnapshot
Overlay021_CopySnapshot:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    .size Overlay021_CopySnapshot, . - Overlay021_CopySnapshot

