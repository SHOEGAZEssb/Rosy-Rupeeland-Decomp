; Matching retail form; see src/game/overlay_18_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d6984
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_022199e0

    .global func_0202451c
    .type func_0202451c, @function
func_0202451c: ; 0x0202451c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02024570
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_02024548
    mov r0, r4
    bl func_ov094_022199e0
    mov r0, r4
    bl Heap_Free
.L_02024548:
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
.L_02024570: .word data_020d6984
    .size func_0202451c, . - func_0202451c
