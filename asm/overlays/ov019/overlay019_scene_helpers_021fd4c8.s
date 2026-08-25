    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_helpers.c. */
    .extern func_ov019_021fd170

.global Overlay019_UpdateAndComplete
Overlay019_UpdateAndComplete:
    stmdb sp!, {r3, lr}
    bl func_ov019_021fd170
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size Overlay019_UpdateAndComplete, . - Overlay019_UpdateAndComplete
