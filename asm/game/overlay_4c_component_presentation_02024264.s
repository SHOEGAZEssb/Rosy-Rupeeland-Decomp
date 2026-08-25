; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d690c
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_0221900c

    .global Overlay4cComponentPresentation_Destroy
    .type Overlay4cComponentPresentation_Destroy, @function
Overlay4cComponentPresentation_Destroy: ; 0x02024264
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020242b0
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_02024290
    mov r0, r4
    bl func_ov094_0221900c
    mov r0, r4
    bl Heap_Free
.L_02024290:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_020242b0: .word data_020d690c
    .size Overlay4cComponentPresentation_Destroy, . - Overlay4cComponentPresentation_Destroy
