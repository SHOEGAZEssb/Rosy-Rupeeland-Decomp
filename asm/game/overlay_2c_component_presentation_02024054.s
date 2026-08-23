; Matching retail form; see src/game/overlay_2c_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d695c
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_02217d20

    .global func_02024054
    .type func_02024054, @function
func_02024054: ; 0x02024054
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020240a8
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_02024080
    mov r0, r4
    bl func_ov094_02217d20
    mov r0, r4
    bl Heap_Free
.L_02024080:
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
.L_020240a8: .word data_020d695c
    .size func_02024054, . - func_02024054
