    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global Overlay021Row_DestroyNoOp
Overlay021Row_DestroyNoOp:
    bx lr
    .size Overlay021Row_DestroyNoOp, . - Overlay021Row_DestroyNoOp

