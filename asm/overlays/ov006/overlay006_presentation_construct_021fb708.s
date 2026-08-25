    .text
    .extern SceneInputBase_Init
    .extern IndexedSelectionController_Init
    .extern func_02091b6c
    .extern IndexedSelectionController_ConfigureRange
    .extern Heap_Alloc
    .extern func_ov046_0220b7bc
    .extern func_ov046_0220c4a0
    .extern IndexedSelectionController_SetValue
    .extern func_ov046_0220bffc
    .extern func_ov046_0220c478
    .extern AreaInfoPanelPresentation_Init
    .extern func_02091b98
    .extern func_ov006_021fb6e0
    .extern data_ov006_021fbc88
    .extern gGameWork
    .extern data_ov006_021fbc9c
    .extern gHeapContext
    .extern gDebugFont
    .extern data_ov006_021fbca4
    .extern data_ov006_021fbc58

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov006/overlay006_presentation_construct.c. */
    .global func_ov006_021fb708
func_ov006_021fb708: ; 0x021fb708
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, L_021fb82c
    add r0, r4, #0x58
    str r1, [r4, #0x0]
    bl IndexedSelectionController_Init
    add r0, r4, #0x98
    bl func_02091b6c
    ldr r0, L_021fb830
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r3, r1
    add r0, r0, #0x100
    ldrsh r0, [r0, #0x2e]
    str r0, [r4, #0x54]
    cmp r0, #0xb
    movge r0, #0xa
    strge r0, [r4, #0x54]
    ldr r2, [r4, #0x54]
    add r0, r4, #0x58
    bl IndexedSelectionController_ConfigureRange
    mov ip, #0xc
    ldr r1, L_021fb834
    ldr r3, L_021fb838
    mov r0, #0x118
    mov r2, #0x4
    str ip, [r4, #0x84]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fb794
    ldr r1, L_021fb83c
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov046_0220b7bc
L_021fb794:
    str r0, [r4, #0x90]
    bl func_ov046_0220c4a0
    mov r1, r0
    add r0, r4, #0x58
    bl IndexedSelectionController_SetValue
    mov r2, #0x0
    ldr r0, [r4, #0x90]
    ldr r1, [r4, #0x64]
    mov r3, r2
    bl func_ov046_0220bffc
    ldr r0, [r4, #0x90]
    ldr r1, [r4, #0x64]
    bl func_ov046_0220c478
    ldr r1, L_021fb840
    ldr r3, L_021fb838
    mov r0, #0x3c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fb7f0
    ldr r1, L_021fb83c
    ldr r1, [r1, #0x0]
    bl AreaInfoPanelPresentation_Init
L_021fb7f0:
    str r0, [r4, #0x94]
    add r0, r4, #0x98
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r4, #0xb4]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fb844
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov006_021fb6e0
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fb82c: .word data_ov006_021fbc88
L_021fb830: .word gGameWork
L_021fb834: .word data_ov006_021fbc9c
L_021fb838: .word gHeapContext
L_021fb83c: .word gDebugFont
L_021fb840: .word data_ov006_021fbca4
L_021fb844: .word data_ov006_021fbc58

    .size func_ov006_021fb708, .-func_ov006_021fb708
