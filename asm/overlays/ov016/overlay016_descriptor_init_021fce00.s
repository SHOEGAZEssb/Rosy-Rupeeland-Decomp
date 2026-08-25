    .text

/* Exact fallbacks for descriptor initialization; see src/overlays/ov016/overlay016_list_helpers.c. */
    .global Overlay016_InitListDescriptor

Overlay016_InitListDescriptor:
    mov r3, #0x0
    str r3, [r0, #0x0]
    str r3, [r0, #0x4]
    strh r3, [r0, #0xa]
    strh r3, [r0, #0x8]
    strh r3, [r0, #0xc]
    mov r2, r3
L_021fce1c:
    add r1, r0, r3
    add r3, r3, #0x1
    strb r2, [r1, #0xe]
    cmp r3, #0x6
    blt L_021fce1c
    bx lr

    .size Overlay016_InitListDescriptor, . - Overlay016_InitListDescriptor
