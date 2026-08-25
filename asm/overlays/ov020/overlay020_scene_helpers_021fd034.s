    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */

.global Overlay020_Row_NoOp
Overlay020_Row_NoOp:
    bx lr
    .size Overlay020_Row_NoOp, . - Overlay020_Row_NoOp
