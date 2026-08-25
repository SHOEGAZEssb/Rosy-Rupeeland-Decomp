    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */
    .extern SpriteMotionController_SetAnimation

.global Overlay021_RefreshListButtonAnimations
Overlay021_RefreshListButtonAnimations:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    mov r6, #0xac
    mov r4, #0x0
    add r8, r5, #0x14c
    mov r7, r6
L_021fe864:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x2a4]
    cmp r0, #0x0
    beq L_021fe888
    mla r0, r4, r7, r8
    mov r1, r4, lsl #0x1
    add r1, r1, #0x16
    bl SpriteMotionController_SetAnimation
    b L_021fe898
L_021fe888:
    mla r0, r4, r6, r8
    mov r1, r4, lsl #0x1
    add r1, r1, #0x17
    bl SpriteMotionController_SetAnimation
L_021fe898:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_021fe864
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size Overlay021_RefreshListButtonAnimations, . - Overlay021_RefreshListButtonAnimations

