.text

/* Exact fallback; see src/overlays/ov035/overlay035_tertiary_scene_lifecycle.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsResourceSetVariant_Destroy
    .extern Heap_Free
    .extern data_ov035_02203cb0
    .extern data_ov035_02203af8


    .global func_ov035_021ffa44
func_ov035_021ffa44: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021ffad0
    add r0, r4, #0x174
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x184
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x124]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_021ffad4
    add r0, r4, #0x184
    str r1, [r4, #0x184]
    bl PresentationList_DeleteAll
    ldr r1, L_021ffad4
    add r0, r4, #0x174
    str r1, [r4, #0x174]
    bl PresentationList_DeleteAll
    add r0, r4, #0x118
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x10c
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x100
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xf4
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ffad0: .word data_ov035_02203cb0
L_021ffad4: .word data_ov035_02203af8
.size func_ov035_021ffa44, .-func_ov035_021ffa44

    .global func_ov035_021ffad8

func_ov035_021ffad8: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021ffb6c
    add r0, r4, #0x174
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x184
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x124]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_021ffb70
    add r0, r4, #0x184
    str r1, [r4, #0x184]
    bl PresentationList_DeleteAll
    ldr r1, L_021ffb70
    add r0, r4, #0x174
    str r1, [r4, #0x174]
    bl PresentationList_DeleteAll
    add r0, r4, #0x118
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x10c
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x100
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xf4
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ffb6c: .word data_ov035_02203cb0
L_021ffb70: .word data_ov035_02203af8
.size func_ov035_021ffad8, .-func_ov035_021ffad8

