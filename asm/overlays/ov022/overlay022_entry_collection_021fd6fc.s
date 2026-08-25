    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */


.global Overlay022_CollectionEntry_Init
Overlay022_CollectionEntry_Init:
    mov r1, #0x0
    str r1, [r0, #0x0]
    bx lr
.size Overlay022_CollectionEntry_Init, . - Overlay022_CollectionEntry_Init
