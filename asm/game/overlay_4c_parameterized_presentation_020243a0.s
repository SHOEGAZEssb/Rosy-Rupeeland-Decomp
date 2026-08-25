; Matching retail form; see src/game/overlay_4c_parameterized_presentation.c.
.text
.extern Heap_Free
.extern data_020d68bc
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_022196a4

    .global Overlay4cParameterizedPresentation_Destroy
    .type Overlay4cParameterizedPresentation_Destroy, @function
Overlay4cParameterizedPresentation_Destroy: ; 0x020243a0
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020243ec
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_020243cc
    mov r0, r4
    bl func_ov094_022196a4
    mov r0, r4
    bl Heap_Free
.L_020243cc:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_020243ec: .word data_020d68bc
    .size Overlay4cParameterizedPresentation_Destroy, . - Overlay4cParameterizedPresentation_Destroy
