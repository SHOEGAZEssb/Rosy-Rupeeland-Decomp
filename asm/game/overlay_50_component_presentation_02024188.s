; Matching retail form; see src/game/overlay_50_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d69ac
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_022186dc

    .global func_02024188
    .type func_02024188, @function
func_02024188: ; 0x02024188
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020241dc
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_020241b4
    mov r0, r4
    bl func_ov094_022186dc
    mov r0, r4
    bl Heap_Free
.L_020241b4:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_020241dc: .word data_020d69ac
    .size func_02024188, . - func_02024188
