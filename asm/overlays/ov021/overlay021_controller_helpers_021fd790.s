    .text
/* Exact fallback; see src/overlays/ov021/overlay021_controller_helpers.c. */

.global Overlay021_Controller_DestroyNoOp
Overlay021_Controller_DestroyNoOp:
    bx lr
    .size Overlay021_Controller_DestroyNoOp, . - Overlay021_Controller_DestroyNoOp

