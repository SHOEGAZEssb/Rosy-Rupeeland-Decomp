    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */

.global Overlay021Descriptor_GetFlags16_19
Overlay021Descriptor_GetFlags16_19:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0xc]
    and r0, r0, #0xf0000
    mov r0, r0, lsr #0x10
    bx lr
    .size Overlay021Descriptor_GetFlags16_19, . - Overlay021Descriptor_GetFlags16_19

