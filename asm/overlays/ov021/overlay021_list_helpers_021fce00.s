    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global Overlay021_Row_Init
Overlay021_Row_Init:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    strh r1, [r0, #0xa]
    strh r1, [r0, #0x8]
    bx lr
    .size Overlay021_Row_Init, . - Overlay021_Row_Init

