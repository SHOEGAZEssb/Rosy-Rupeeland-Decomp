    .text

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_items_hide.c. */
    .global Overlay007_HideItems
Overlay007_HideItems: ; 0x021fbc80
    ldr r2, [r0, #0x4c]
    mov r3, #0x4
    mov r1, #0xa
    strh r3, [r2, #0x42]
    sub r2, r1, #0x1
    mov ip, r3
L_021fbc98:
    add r1, r0, r2, lsl #0x2
    ldr r1, [r1, #0x50]
    subs r2, r2, #0x1
    strh ip, [r1, #0x42]
    bpl L_021fbc98
    ldr r2, [r0, #0x78]
    ldr r1, L_021fbcd4
    strh ip, [r2, #0x42]
    ldr r3, [r0, #0x7c]
    mov r2, #0x0
    strh ip, [r3, #0x42]
    str r2, [r1, #0x0]
    mov r1, #0x1
    strb r1, [r0, #0xd0]
    bx lr
L_021fbcd4: .word 0x4001010

    .size Overlay007_HideItems, .-Overlay007_HideItems
