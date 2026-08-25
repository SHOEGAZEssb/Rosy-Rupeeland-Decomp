    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */

.global Overlay021_TestNestedFlags
Overlay021_TestNestedFlags:
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    ldrne r0, [r0, #0x20]
    andne r0, r0, r1
    moveq r0, #0x0
    bx lr
    .size Overlay021_TestNestedFlags, . - Overlay021_TestNestedFlags

