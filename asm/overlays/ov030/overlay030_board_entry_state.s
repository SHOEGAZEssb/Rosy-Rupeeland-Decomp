.text

/* Exact fallback; see src/overlays/ov030/overlay030_board_entry_state.c for documented portable C. */
.extern data_020f4e14
.extern data_ov030_021ff7a8
.extern data_ov030_021ff7b0
.extern data_ov030_021ff8dc
.extern DisplayBrightness_IsMainTransitionComplete
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern func_020922f0
.extern DisplayBrightness_StartMaskedTransitions
.extern TitleDialog_ClearTextRect
.extern func_ov030_021fcf20
.extern func_ov030_021fda14
.extern func_ov030_021fe554
.extern func_ov030_021fe768
.extern func_ov030_021fe954
.extern func_ov030_021fea00
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov030_021fee6c
func_ov030_021fee6c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_ov030_021fea00
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021ff000
L_021fee8c: ; jump table
    b L_021fee9c ; case 0
    b L_021feebc ; case 1
    b L_021fef3c ; case 2
    b L_021fefd8 ; case 3
L_021fee9c:
    mov r0, r4
    mov r1, #0xe4
    bl func_020922f0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021feebc:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff000
    ldr r0, [r4, #0x78]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r1, L_021ff014
    ldr r3, L_021ff018
    mov r0, #0x1f0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fef00
    ldr r1, L_021ff01c
    ldr r2, [r4, #0x394]
    ldr r1, [r1, #0x0]
    ldr r3, [r4, #0x390]
    bl func_ov030_021fcf20
L_021fef00:
    mov r1, r0
    str r0, [r4, #0x2c4]
    mov r2, #0x10
    mov r0, r4
    str r2, [r1, #0x1c4]
    bl func_ov030_021fe554
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff000
L_021fef3c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff000
    ldr r0, [r4, #0x2bc]
    bl TitleDialog_ClearTextRect
    ldr r0, L_021ff020
    ldr r1, L_021ff024
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fefb8
    ldr r0, L_021ff020
    ldr r1, L_021ff024
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r4, #0x390]
    cmp r0, #0x1
    bne L_021fef94
    mov r0, r4
    mov r1, #0x1f8
    bl func_ov030_021fe954
    b L_021fefa0
L_021fef94:
    ldr r1, L_021ff028
    mov r0, r4
    bl func_ov030_021fe954
L_021fefa0:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fefc4
L_021fefb8:
    ldr r1, L_021ff02c
    mov r0, r4
    bl func_ov030_021fe954
L_021fefc4:
    ldr r1, L_021ff030
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
    b L_021ff000
L_021fefd8:
    ldr r0, [r4, #0x2bc]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1f
    str r1, [sp, #0x0]
    movs r0, r0, asr #0x1f
    beq L_021ff000
    ldr r1, L_021ff034
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
L_021ff000:
    mov r0, r4
    bl func_ov030_021fe768
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021ff014: .word data_ov030_021ff8dc
L_021ff018: .word gHeapContext
L_021ff01c: .word data_020f4e14
L_021ff020: .word gGameWork
L_021ff024: .word 0x3e1
L_021ff028: .word 0x31d
L_021ff02c: .word 0x1fa
L_021ff030: .word data_ov030_021ff7b0
L_021ff034: .word data_ov030_021ff7a8
.size func_ov030_021fee6c, .-func_ov030_021fee6c
