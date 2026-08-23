; Matching retail form; see src/game/overlay_4c_parameterized_presentation.c.
.text
.extern Heap_Free
.extern data_020d68bc
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov094_022196a4

    .global func_020243f0
    .type func_020243f0, @function
func_020243f0: ; 0x020243f0
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02024444
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_0202441c
    mov r0, r4
    bl func_ov094_022196a4
    mov r0, r4
    bl Heap_Free
.L_0202441c:
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
.L_02024444: .word data_020d68bc
    .size func_020243f0, . - func_020243f0
