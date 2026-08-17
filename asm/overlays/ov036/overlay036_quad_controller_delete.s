.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_lifecycle.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern GraphicsArchive_ReleaseOwlvResource
    .extern Graphics3DResourceOwner_RemoveManager
    .extern Graphics3DLightSet_Destroy
    .extern GraphicsResourceSetVariant_Destroy
    .extern Heap_Free
    .extern data_ov036_02205fb8
    .extern data_020f4e18
    .extern data_ov036_02205eac

    .global func_ov036_02202590
func_ov036_02202590:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_0220261c
    add r0, r4, #0xfc
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x10c
    bl PresentationList_DeleteAll
    ldr r0, L_02202620
    ldr r1, [r4, #0xf4]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
    ldr r1, [r4, #0xf8]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    add r0, r4, #0x11c
    bl Graphics3DLightSet_Destroy
    ldr r1, L_02202624
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl PresentationList_DeleteAll
    ldr r1, L_02202624
    add r0, r4, #0xfc
    str r1, [r4, #0xfc]
    bl PresentationList_DeleteAll
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
L_0220261c: .word data_ov036_02205fb8
L_02202620: .word data_020f4e18
L_02202624: .word data_ov036_02205eac
    .size func_ov036_02202590, .-func_ov036_02202590

