    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */

.global Overlay021_IsResourceStateReady
Overlay021_IsResourceStateReady:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size Overlay021_IsResourceStateReady, . - Overlay021_IsResourceStateReady

