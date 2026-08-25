    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern Overlay000_GetActiveMetadata
    .extern Overlay021_RenderSelectionCategory
    .extern Overlay021_RenderSelectionName
    .extern Overlay021_TestNestedFlags

.global Overlay021_RefreshPrimarySelectionDisplay
Overlay021_RefreshPrimarySelectionDisplay:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x354]
    bl Overlay000_GetActiveMetadata
    ldr r4, [r0, #0xc]
    mov r0, r5
    mov r1, r4
    bl Overlay021_RenderSelectionName
    ldr r0, [r5, #0x354]
    bl Overlay000_GetActiveMetadata
    mov r1, #0x1
    bl Overlay021_TestNestedFlags
    cmp r0, #0x0
    beq L_021ff600
    mov r0, r5
    mov r1, #0x0
    bl Overlay021_RenderSelectionCategory
    ldmia sp!, {r3, r4, r5, pc}
L_021ff600:
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl Overlay021_RenderSelectionCategory
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay021_RefreshPrimarySelectionDisplay, . - Overlay021_RefreshPrimarySelectionDisplay

