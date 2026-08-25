    .text
    .extern Heap_Alloc
    .extern gGamePhaseRuntime
    .extern data_ov013_021fed88
    .extern data_ov013_021fed90
    .extern GamePhaseRuntime_SetPlacementMode
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern SpriteMotionController_IsVisible
    .extern ModalState_Init
    .extern ModalState_DrawFrame
    .extern ModalState_InitResources
    .extern ModalState_CopyAttachmentText
    .extern Overlay006_Presentation_Init
    .extern gHeapContext

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_auxiliary_helpers.c. */
    .global Overlay013_InitRecordCounter
    .global func_ov013_021fda40
    .global func_ov013_021fda9c
    .global func_ov013_021fdb10
    .global func_ov013_021fdb50
Overlay013_InitRecordCounter:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr

    .global func_ov013_021fda40
    .size Overlay013_InitRecordCounter, . - Overlay013_InitRecordCounter
func_ov013_021fda40:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fda90
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
    ldr r1, L_021fda94
    ldr r3, L_021fda98
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fda7c
    bl Overlay006_Presentation_Init
L_021fda7c:
    str r0, [r4, #0x9a8]
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    ldmia sp!, {r4, pc}
L_021fda90: .word gGamePhaseRuntime
L_021fda94: .word data_ov013_021fed88
L_021fda98: .word gHeapContext

    .global func_ov013_021fda9c
    .size func_ov013_021fda40, . - func_ov013_021fda40
func_ov013_021fda9c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    ldr r1, L_021fdb08
    ldr r3, L_021fdb0c
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdad4
    mov r1, #0x0
    mov r2, r1
    bl ModalState_Init
L_021fdad4:
    str r0, [r6, #0x9a4]
    cmp r4, #0x0
    beq L_021fdaec
    ldr r0, [r6, #0x9a4]
    mov r1, r4
    bl ModalState_CopyAttachmentText
L_021fdaec:
    ldr r0, [r6, #0x9a4]
    mov r1, r5
    bl ModalState_InitResources
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x2
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
L_021fdb08: .word data_ov013_021fed90
L_021fdb0c: .word gHeapContext

    .global func_ov013_021fdb10
    .size func_ov013_021fda9c, . - func_ov013_021fda9c
func_ov013_021fdb10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x9a4]
    bl ModalState_DrawFrame
    ldr r0, [r4, #0x9a4]
    cmp r0, #0x0
    beq L_021fdb38
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdb38:
    mov r0, #0x0
    str r0, [r4, #0x9a4]
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x2
    str r0, [r4, #0x48]
    ldmia sp!, {r4, pc}

    .global func_ov013_021fdb50
    .size func_ov013_021fdb10, . - func_ov013_021fdb10
func_ov013_021fdb50:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, #0xac
    mul r3, r4, r1
    mov r5, r0
    add r2, r5, #0x124
    ldrh r1, [r2, r3]
    add r0, r5, #0x8c
    add r0, r0, r3
    orr r1, r1, #0x2
    strh r1, [r2, r3]
    bl SpriteMotionController_IsVisible
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x950]
    mov r1, #0x1a
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x950]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}

    .size func_ov013_021fdb50, . - func_ov013_021fdb50
