    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global Overlay021_Descriptor_GetCategory
Overlay021_Descriptor_GetCategory:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xc]
    and r0, r0, #0xf00
    mov r0, r0, lsr #0x8
    bx lr
    .size Overlay021_Descriptor_GetCategory, . - Overlay021_Descriptor_GetCategory

