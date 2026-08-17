.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_exit_state.c for documented portable C. */
.extern data_020f4e14
.extern data_ov030_021ff790
.extern DisplayBrightness_IsMainTransitionComplete
.extern InventoryRecordCollection_RemoveQuantity
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02092c8c
.extern func_ov030_021fd27c
.extern func_ov030_021fda14
.extern func_ov030_021fe768
.extern func_ov030_021fe808
.extern func_ov030_021fea00
.extern func_ov030_021feb0c
.extern gDebugFont
.extern Heap_Free


    .global func_ov030_021ff5a4
func_ov030_021ff5a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov030_021fea00
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021ff5c8
    cmp r0, #0x1
    beq L_021ff5e8
    b L_021ff6c8
L_021ff5c8:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff5e8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff6c8
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    ldr r0, [r4, #0x2c4]
    bne L_021ff628
    ldr r1, [r0, #0x1b4]
    ldr r2, [r4, #0x384]
    ldr r0, [r4, #0x37c]
    sub r1, r2, r1
    mov r2, r1, lsl #0x10
    ldr r1, [r4, #0x380]
    mov r2, r2, lsr #0x10
    bl InventoryRecordCollection_RemoveQuantity
    b L_021ff648
L_021ff628:
    ldr r1, [r0, #0x1b4]
    ldr r2, [r4, #0x38c]
    ldr r0, [r4, #0x37c]
    sub r1, r2, r1
    mov r2, r1, lsl #0x10
    ldr r1, [r4, #0x388]
    mov r2, r2, lsr #0x10
    bl InventoryRecordCollection_RemoveQuantity
L_021ff648:
    ldr r5, [r4, #0x2c4]
    cmp r5, #0x0
    beq L_021ff664
    mov r0, r5
    bl func_ov030_021fd27c
    mov r0, r5
    bl Heap_Free
L_021ff664:
    mov r1, #0x0
    ldr r0, L_021ff6d8
    str r1, [r4, #0x2c4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021ff6dc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, [r4, #0x48]
    mov r0, r4
    bic r1, r1, #0x3
    str r1, [r4, #0x48]
    bl func_ov030_021fe808
    ldr r1, [r4, #0x78]
    mov r2, #0x1
    mov r0, r4
    str r2, [r1, #0x20]
    bl func_ov030_021feb0c
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    mov r0, r4
    ldr r1, L_021ff6e0
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
L_021ff6c8:
    mov r0, r4
    bl func_ov030_021fe768
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff6d8: .word data_020f4e14
L_021ff6dc: .word gDebugFont
L_021ff6e0: .word data_ov030_021ff790
.size func_ov030_021ff5a4, .-func_ov030_021ff5a4
