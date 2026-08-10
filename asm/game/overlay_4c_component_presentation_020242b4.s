; Matching retail form; see src/game/overlay_4c_component_presentation.c.
.text
.extern Heap_Free
.extern data_020d690c
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern func_0201e28c
.extern func_ov094_0221900c

    .global func_020242b4
    .type func_020242b4, @function
func_020242b4: ; 0x020242b4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02024308
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_020242e0
    mov r0, r4
    bl func_ov094_0221900c
    mov r0, r4
    bl Heap_Free
.L_020242e0:
    add r0, r5, #0xc
    bl OverlaySlot_UnloadOverlay
    add r0, r5, #0xc
    bl OverlaySlot_Destroy
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02024308: .word data_020d690c
    .size func_020242b4, . - func_020242b4
