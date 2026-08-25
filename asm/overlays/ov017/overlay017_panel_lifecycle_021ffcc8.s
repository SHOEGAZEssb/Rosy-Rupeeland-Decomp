    .text
/* Exact fallback; see src/overlays/ov017/overlay017_panel_lifecycle.c. */
    .extern Heap_Alloc
    .extern data_ov017_022016bc
    .extern GraphicsBgMapResource_UploadToMainBg
    .extern TitleScreenResourceCollection_Get
    .extern ModalState_Init
    .extern ModalState_InitResources
    .extern ModalState_CopyAttachmentText
    .extern gHeapContext
.global func_ov017_021ffcc8
func_ov017_021ffcc8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r3
    cmp r2, #0x0
    add r0, r6, #0x1fc
    bne L_021ffcfc
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    b L_021ffd10
L_021ffcfc:
    mov r1, #0x1
    bl TitleScreenResourceCollection_Get
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
L_021ffd10:
    ldr r1, L_021ffd6c
    ldr r3, L_021ffd70
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffd38
    mov r1, #0x0
    mov r2, r1
    bl ModalState_Init
L_021ffd38:
    str r0, [r6, #0x400]
    cmp r4, #0x0
    beq L_021ffd50
    ldr r0, [r6, #0x400]
    mov r1, r4
    bl ModalState_CopyAttachmentText
L_021ffd50:
    ldr r0, [r6, #0x400]
    mov r1, r5
    bl ModalState_InitResources
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x4
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
L_021ffd6c: .word data_ov017_022016bc
L_021ffd70: .word gHeapContext
    .size func_ov017_021ffcc8, . - func_ov017_021ffcc8
