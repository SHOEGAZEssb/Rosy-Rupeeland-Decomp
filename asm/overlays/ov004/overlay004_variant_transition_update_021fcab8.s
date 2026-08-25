    .text
    .extern SceneInputBase_Update
    .extern DisplayBrightness_StartMaskedTransitions
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_02092314
    .extern func_ov004_021fb6e4
    .extern Heap_Alloc
    .extern func_ov004_021fb70c
    .extern data_ov004_021fcd28
    .extern data_ov004_021fcde4
    .extern gHeapContext
    .extern data_ov004_021fcd58

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov004/overlay004_variant_transition_update.c. */
    .global func_ov004_021fcab8
func_ov004_021fcab8: ; 0x021fcab8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_021fcce0
L_021fcad0:
    b L_021fcae8
    b L_021fcb0c
    b L_021fcb68
    b L_021fcc40
    b L_021fcc70
    b L_021fcca8
L_021fcae8:
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fcb0c:
    ldr r0, [r4, #0x54]
    mov r1, #0x1
    bl SceneInputBase_Update
    cmp r0, #0x0
    beq L_021fcce0
    ldr r0, [r4, #0x58]
    cmp r0, #0x1
    blt L_021fcb34
    cmp r0, #0xa
    ble L_021fcb44
L_021fcb34:
    mov r0, #0x3
    sub r1, r0, #0x13
    bl DisplayBrightness_StartMaskedTransitions
    b L_021fcb50
L_021fcb44:
    mov r0, #0x3
    mov r1, #0x10
    bl DisplayBrightness_StartMaskedTransitions
L_021fcb50:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fcce0
L_021fcb68:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fcce0
    ldr r0, [r4, #0x58]
    cmp r0, #0x1
    blt L_021fcb94
    cmp r0, #0xa
    ble L_021fcbb8
L_021fcb94:
    mov r0, r4
    mov r1, #0x3d
    mov r2, #0x10
    bl func_02092314
    ldr r1, L_021fcce8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
    b L_021fcce0
L_021fcbb8:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq L_021fcbdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fcbdc:
    mov r0, #0x0
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fccec
    orr ip, r0, #0x400
    ldr r3, L_021fccf0
    mov r0, #0x15c
    mov r2, #0x4
    str ip, [r4, #0x20]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcc18
    ldr r1, [r4, #0x58]
    ldr r2, [r4, #0x60]
    bl func_ov004_021fb70c
L_021fcc18:
    str r0, [r4, #0x54]
    mov r0, #0x3
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fcce0
L_021fcc40:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fcce0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fcce0
L_021fcc70:
    ldr r0, [r4, #0x54]
    mov r1, #0x1
    bl SceneInputBase_Update
    cmp r0, #0x0
    beq L_021fcce0
    mov r0, #0x3
    sub r1, r0, #0x13
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fcce0
L_021fcca8:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl SceneInputBase_Update
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fcce0
    mov r0, r4
    mov r1, #0x3d
    mov r2, #0x10
    bl func_02092314
    ldr r1, L_021fccf4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
L_021fcce0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fcce8: .word data_ov004_021fcd28
L_021fccec: .word data_ov004_021fcde4
L_021fccf0: .word gHeapContext
L_021fccf4: .word data_ov004_021fcd58
    .size func_ov004_021fcab8, .-func_ov004_021fcab8
