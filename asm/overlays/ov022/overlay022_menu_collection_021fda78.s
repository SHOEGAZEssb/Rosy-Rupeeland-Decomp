    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */


.global Overlay022_MenuEntry_DestroyNoOp
Overlay022_MenuEntry_DestroyNoOp:
    bx lr
.size Overlay022_MenuEntry_DestroyNoOp, . - Overlay022_MenuEntry_DestroyNoOp
