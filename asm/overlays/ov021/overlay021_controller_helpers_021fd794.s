    .text
/* Exact fallback; see src/overlays/ov021/overlay021_controller_helpers.c. */

.global Overlay021_Snapshot_Init
Overlay021_Snapshot_Init:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
    .size Overlay021_Snapshot_Init, . - Overlay021_Snapshot_Init

