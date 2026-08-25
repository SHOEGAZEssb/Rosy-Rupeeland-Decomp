    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
.global Overlay016_UpdateCursorPosition
Overlay016_UpdateCursorPosition:
    ldr r3, [r0, #0xe4]
    cmp r3, #0x0
    bxeq lr
    ldr r1, [r0, #0x444]
    mov r0, #0x18
    ldr r1, [r1, #0x58]
    ldr r2, [r1, #0x14]
    ldr r1, [r1, #0xc]
    sub r1, r2, r1
    mul r0, r1, r0
    add r0, r0, #0x20
    strh r0, [r3, #0x2e]
    bx lr
    .size Overlay016_UpdateCursorPosition, . - Overlay016_UpdateCursorPosition

