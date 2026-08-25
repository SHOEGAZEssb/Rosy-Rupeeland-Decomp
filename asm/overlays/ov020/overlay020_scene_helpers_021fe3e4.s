    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */
    .extern Overlay020_UpdateSceneUi

.global Overlay020_UpdateAndComplete
Overlay020_UpdateAndComplete:
    stmdb sp!, {r3, lr}
    bl Overlay020_UpdateSceneUi
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size Overlay020_UpdateAndComplete, . - Overlay020_UpdateAndComplete
