    .text
/* Exact fallback; see src/overlays/ov021/overlay021_action_helpers.c. */
    .extern Overlay021_UpdateScene

.global Overlay021_UpdateAndComplete
Overlay021_UpdateAndComplete:
    stmdb sp!, {r3, lr}
    bl Overlay021_UpdateScene
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size Overlay021_UpdateAndComplete, . - Overlay021_UpdateAndComplete

