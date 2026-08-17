    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern GraphicsBgResourceData_GetDecoded

.global Overlay021_UpdateTileTransitionOffset20
Overlay021_UpdateTileTransitionOffset20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3f4]
    str r0, [r4, #0x3f0]
    ldr r0, [r4, #0x400]
    bl GraphicsBgResourceData_GetDecoded
    add r0, r0, #0x20
    str r0, [r4, #0x3f4]
    mov r0, #0x0
    str r0, [r4, #0x3f8]
    ldmia sp!, {r4, pc}
    .size Overlay021_UpdateTileTransitionOffset20, . - Overlay021_UpdateTileTransitionOffset20

