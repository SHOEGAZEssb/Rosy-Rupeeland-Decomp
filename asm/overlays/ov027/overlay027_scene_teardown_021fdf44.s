.text

/* Exact fallback; see corresponding documented C source. */
.extern data_020f4e14
.extern data_ov027_021fee60
.extern data_ov027_021feeb4
.extern GraphicsResourceSetVariant_Destroy
.extern GraphicsSpriteRenderer_Resume
.extern Graphics3DResourceOwner_Destroy
.extern func_020923a0
.extern func_02092418
.extern PresentationList_DeleteAll
.extern func_ov048_0220b7b4
.extern gDebugFont
.extern GX_SetGraphicsMode
.extern Heap_Free


    .global func_ov027_021fdf44
func_ov027_021fdf44:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe058
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x20]
    add r0, r4, #0x120
    bic r1, r1, #0x400
    str r1, [r4, #0x20]
    bl PresentationList_DeleteAll
    add r0, r4, #0x130
    bl PresentationList_DeleteAll
    add r0, r4, #0x140
    bl PresentationList_DeleteAll
    add r0, r4, #0x150
    bl PresentationList_DeleteAll
    ldr r5, [r4, #0x54]
    cmp r5, #0x0
    beq L_021fdf9c
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_021fdf9c:
    ldr r0, L_021fe05c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Resume
    ldr r0, L_021fe060
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Resume
    add r0, r4, #0x164
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_021fe064
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    add r0, r4, #0x198
    strh r2, [r1, #0x0]
    bl func_ov048_0220b7b4
    add r0, r4, #0x164
    bl func_020923a0
    ldr r1, L_021fe068
    add r0, r4, #0x150
    str r1, [r4, #0x150]
    bl PresentationList_DeleteAll
    ldr r1, L_021fe068
    add r0, r4, #0x140
    str r1, [r4, #0x140]
    bl PresentationList_DeleteAll
    ldr r1, L_021fe068
    add r0, r4, #0x130
    str r1, [r4, #0x130]
    bl PresentationList_DeleteAll
    ldr r1, L_021fe068
    add r0, r4, #0x120
    str r1, [r4, #0x120]
    bl PresentationList_DeleteAll
    add r0, r4, #0x74
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x68
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x5c
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe058: .word data_ov027_021feeb4
L_021fe05c: .word data_020f4e14
L_021fe060: .word gDebugFont
L_021fe064: .word 0x4000050
L_021fe068: .word data_ov027_021fee60
.size func_ov027_021fdf44, .-func_ov027_021fdf44

