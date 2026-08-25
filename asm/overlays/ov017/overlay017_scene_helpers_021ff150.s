    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_helpers.c. */
    .extern data_ov017_02201618
.global Overlay017_InitSceneHelper
Overlay017_InitSceneHelper:
    ldr r2, L_021ff168
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021ff168: .word data_ov017_02201618
    .size Overlay017_InitSceneHelper, . - Overlay017_InitSceneHelper
