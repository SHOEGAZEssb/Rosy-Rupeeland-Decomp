    .text
/* Exact fallback; see src/overlays/ov021/overlay021_widget_helpers.c. */
    .extern Heap_Free
    .extern Overlay021_List_Deinit

.global Overlay021_DestroyListsAndSavePositions
Overlay021_DestroyListsAndSavePositions:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0x0
    mov r5, r0
    str r4, [r5, #0x2c0]
    mov r6, r4
L_021fe650:
    add r1, r5, r4, lsl #0x2
    ldr r0, [r1, #0x2a4]
    cmp r0, #0x0
    beq L_021fe6a0
    ldr r0, [r0, #0x58]
    ldr r0, [r0, #0xc]
    str r0, [r1, #0x2ac]
    ldr r0, [r1, #0x2a4]
    ldr r0, [r0, #0x58]
    ldr r0, [r0, #0x14]
    str r0, [r1, #0x2b4]
    ldr r7, [r1, #0x2a4]
    cmp r7, #0x0
    beq L_021fe698
    mov r0, r7
    bl Overlay021_List_Deinit
    mov r0, r7
    bl Heap_Free
L_021fe698:
    add r0, r5, r4, lsl #0x2
    str r6, [r0, #0x2a4]
L_021fe6a0:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt L_021fe650
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size Overlay021_DestroyListsAndSavePositions, . - Overlay021_DestroyListsAndSavePositions

