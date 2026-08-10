; Matching retail form; see src/game/overlay_18_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d6984
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern func_0201e28c
.extern func_ov094_022199e0

    .global func_020244cc
    .type func_020244cc, @function
func_020244cc: ; 0x020244cc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02024518
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_020244f8
    mov r0, r4
    bl func_ov094_022199e0
    mov r0, r4
    bl Heap_Free
.L_020244f8:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02024518: .word data_020d6984
    .size func_020244cc, . - func_020244cc
