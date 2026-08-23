; Matching retail form; see src/game/overlay_worker_presentation.c.
.text
.extern Heap_Free
.extern data_020d6304
.extern data_021055cc
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern FieldEffect_DestroyBase
.extern func_ov047_0220ba64

.global func_020201fc
    .type func_020201fc, @function
func_020201fc: ; 0x020201fc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02020270
    mov r4, r0
    ldr r0, .L_02020274
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    sub r1, r1, #0x1
    str r1, [r0, #0x0]
    ldr r5, [r4, #0xc]
    cmp r5, #0x0
    beq .L_02020238
    mov r0, r5
    bl func_ov047_0220ba64
    mov r0, r5
    bl Heap_Free
.L_02020238:
    ldr r0, .L_02020274
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02020250
    add r0, r4, #0x10
    bl OverlaySlot_UnloadOverlay
.L_02020250:
    add r0, r4, #0x10
    bl OverlaySlot_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02020270: .word data_020d6304
.L_02020274: .word data_021055cc
    .size func_020201fc, .-func_020201fc
