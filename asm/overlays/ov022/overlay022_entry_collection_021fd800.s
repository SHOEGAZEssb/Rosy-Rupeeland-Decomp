    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */


.global Overlay022_CollectionEntry_DestroyNoOp
Overlay022_CollectionEntry_DestroyNoOp:
    bx lr
.size Overlay022_CollectionEntry_DestroyNoOp, . - Overlay022_CollectionEntry_DestroyNoOp
