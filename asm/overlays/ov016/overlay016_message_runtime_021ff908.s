    .text

/* Exact fallback; see src/overlays/ov016/overlay016_message_runtime.c. */
    .extern Heap_Alloc
    .extern data_ov016_022015b0
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern TitleScreenResourceCollection_Get
    .extern ModalState_Init
    .extern ModalState_InitResources
    .extern ModalState_CopyAttachmentText
    .extern gHeapContext
.global Overlay016_CreateTransientMessage
Overlay016_CreateTransientMessage:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x44c]
    mov r5, r1
    mov r4, r3
    cmp r0, #0x0
    beq L_021ff934
    cmp r2, #0x0
    moveq r1, #0x2
    movne r1, #0x3
    b L_021ff940
L_021ff934:
    cmp r2, #0x0
    moveq r1, #0x0
    movne r1, #0x1
L_021ff940:
    add r0, r6, #0x84
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r1, L_021ff9b0
    ldr r3, L_021ff9b4
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff97c
    mov r1, #0x0
    mov r2, r1
    bl ModalState_Init
L_021ff97c:
    str r0, [r6, #0x460]
    cmp r4, #0x0
    beq L_021ff994
    ldr r0, [r6, #0x460]
    mov r1, r4
    bl ModalState_CopyAttachmentText
L_021ff994:
    ldr r0, [r6, #0x460]
    mov r1, r5
    bl ModalState_InitResources
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x2
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
L_021ff9b0: .word data_ov016_022015b0
L_021ff9b4: .word gHeapContext
    .size Overlay016_CreateTransientMessage, . - Overlay016_CreateTransientMessage

