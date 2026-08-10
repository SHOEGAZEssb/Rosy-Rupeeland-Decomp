    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern Heap_Free
    .extern OverlaySlot_UnloadOverlay
    .extern func_ov002_021fb9c4

.global func_ov021_021fee14
func_ov021_021fee14:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x390]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq L_021fee3c
    mov r0, r4
    bl func_ov002_021fb9c4
    mov r0, r4
    bl Heap_Free
L_021fee3c:
    add r0, r5, #0x1c
    mov r1, #0x0
    add r0, r0, #0x400
    str r1, [r5, #0x390]
    bl OverlaySlot_UnloadOverlay
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov021_021fee14, . - func_ov021_021fee14

