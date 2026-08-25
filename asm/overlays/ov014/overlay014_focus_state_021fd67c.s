    .text
    .extern data_ov014_021fd948
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_StopPackedEffect
    .extern InventoryScroll_BeginMarkerDrag
    .extern InventoryScroll_EndMarkerDrag
    .extern Overlay000_Grid_Update
    .extern func_ov000_021fc450
    .extern Overlay000_Grid_UpdateTransition
    .extern func_ov000_021fc560
    .extern Overlay014_SetCallbackDescriptor
    .extern Overlay014_UpdatePresentationEnabled

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_state_machines.c. */
    .global Overlay014_UpdateFocusState

Overlay014_UpdateFocusState:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x78]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x26c]
    cmp r0, #0x0
    beq L_021fd6ac
    cmp r0, #0x1
    beq L_021fd6cc
    cmp r0, #0x2
    beq L_021fd734
    b L_021fd798
L_021fd6ac:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fd6cc:
    ldr r0, [r5, #0x78]
    bl func_ov000_021fc450
    cmp r0, #0x0
    beq L_021fd728
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_021fd710
    mov r0, r5
    mov r1, #0x0
    bl Overlay014_UpdatePresentationEnabled
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_021fd710:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fd734
L_021fd728:
    ldr r0, [r5, #0x78]
    bl Overlay000_Grid_UpdateTransition ; func_ov001_021fc460
    b L_021fd798
L_021fd734:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fd77c
    ldr r0, [r5, #0x78]
    add r1, r5, #0x30
    bl func_ov000_021fc560
    cmp r0, #0x0
    beq L_021fd798
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fd798
L_021fd77c:
    mov r0, r4
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r1, L_021fd7b0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay014_SetCallbackDescriptor
L_021fd798:
    ldr r0, [r5, #0x78]
    cmp r0, #0x0
    beq L_021fd7a8
    bl Overlay000_Grid_Update
L_021fd7a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd7b0: .word data_ov014_021fd948
    .size Overlay014_UpdateFocusState, . - Overlay014_UpdateFocusState
