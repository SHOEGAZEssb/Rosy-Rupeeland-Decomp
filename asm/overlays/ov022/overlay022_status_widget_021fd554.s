    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern GraphicsSpriteState_SetAnimationIndex

.global Overlay022_StatusWidget_SetMode3
Overlay022_StatusWidget_SetMode3:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x3
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x20]
    mov r1, #0x2
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x20]
    mov r0, #0x3
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    str r0, [r4, #0x28]
    ldmia sp!, {r4, pc}
.size Overlay022_StatusWidget_SetMode3, . - Overlay022_StatusWidget_SetMode3
