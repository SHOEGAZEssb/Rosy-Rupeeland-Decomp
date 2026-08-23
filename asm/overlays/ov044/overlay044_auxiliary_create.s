.text
.extern TitleScreenResourceCollection_Get
.extern GraphicsBgMapResource_UploadToMainBg
.extern Heap_Alloc
.extern func_020959d4
.extern ModalState_CopyAttachmentText
.extern ModalState_InitResources
.extern data_ov044_0220d350
.extern gHeapContext

    .global func_ov044_0220c8d0
func_ov044_0220c8d0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r3
    cmp r2, #0x0
    add r0, r6, #0x78
    bne .L_0220c904
    mov r1, #0x0
    bl TitleScreenResourceCollection_Get
    mov r1, #0x0
    mov r2, r1
    bl GraphicsBgMapResource_UploadToMainBg
    b .L_0220c918
.L_0220c904:
    mov r1, #0x1
    bl TitleScreenResourceCollection_Get
    mov r1, #0x0
    mov r2, r1
    bl GraphicsBgMapResource_UploadToMainBg
.L_0220c918:
    ldr r1, .L_0220c974
    ldr r3, .L_0220c978
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220c940
    mov r1, #0x0
    mov r2, r1
    bl func_020959d4
.L_0220c940:
    str r0, [r6, #0x238]
    cmp r4, #0x0
    beq .L_0220c958
    ldr r0, [r6, #0x238]
    mov r1, r4
    bl ModalState_CopyAttachmentText
.L_0220c958:
    ldr r0, [r6, #0x238]
    mov r1, r5
    bl ModalState_InitResources
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x1
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
.L_0220c974: .word data_ov044_0220d350
.L_0220c978: .word gHeapContext
.size func_ov044_0220c8d0, . - func_ov044_0220c8d0
