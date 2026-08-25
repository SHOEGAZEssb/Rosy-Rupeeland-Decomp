; Matching retail form; see src/game/overlay_50_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d69ac
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_022186dc

    .global Overlay50ComponentPresentation_Destroy
    .type Overlay50ComponentPresentation_Destroy, @function
Overlay50ComponentPresentation_Destroy: ; 0x02024138
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02024184
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_02024164
    mov r0, r4
    bl func_ov094_022186dc
    mov r0, r4
    bl Heap_Free
.L_02024164:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02024184: .word data_020d69ac
    .size Overlay50ComponentPresentation_Destroy, . - Overlay50ComponentPresentation_Destroy
