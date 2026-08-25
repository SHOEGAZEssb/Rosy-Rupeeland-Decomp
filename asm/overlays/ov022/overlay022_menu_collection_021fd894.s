    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */


.global Overlay022_MenuEntry_Init
Overlay022_MenuEntry_Init:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
.size Overlay022_MenuEntry_Init, . - Overlay022_MenuEntry_Init
