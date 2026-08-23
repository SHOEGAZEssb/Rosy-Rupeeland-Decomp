.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern data_ov025_022033ac
.extern GraphicsBgMapResource_UploadToMainBg
.extern TitleScreenResourceCollection_Get
.extern func_020959d4
.extern ModalState_InitResources
.extern ModalState_CopyAttachmentText
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov025_02200224
func_ov025_02200224:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    add r0, r6, #0x530
    mov r1, #0x0
    mov r4, r2
    bl TitleScreenResourceCollection_Get
    mov r1, #0x1
    mov r2, #0x0
    bl GraphicsBgMapResource_UploadToMainBg
    ldr r1, L_022002a8
    mov r0, #0x2d0
    mov r2, #0x4
    ldr r3, L_022002ac
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200274
    mov r1, #0x0
    mov r2, r1
    bl func_020959d4
L_02200274:
    str r0, [r6, #0x59c]
    cmp r4, #0x0
    beq L_0220028c
    ldr r0, [r6, #0x59c]
    mov r1, r4
    bl ModalState_CopyAttachmentText
L_0220028c:
    ldr r0, [r6, #0x59c]
    mov r1, r5
    bl ModalState_InitResources
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x2
    str r0, [r6, #0x48]
    ldmia sp!, {r4, r5, r6, pc}
L_022002a8: .word data_ov025_022033ac
L_022002ac: .word gHeapContext
.size func_ov025_02200224, .-func_ov025_02200224

