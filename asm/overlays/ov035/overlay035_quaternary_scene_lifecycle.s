.text

/* Exact fallback; see src/overlays/ov035/overlay035_quaternary_scene_lifecycle.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsArchive_ReleaseOwlvResource
    .extern Graphics3DLightSet_Destroy
    .extern GraphicsResourceSetVariant_Destroy
    .extern Heap_Free
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern func_ov035_021fdd70
    .extern GraphicsAnimationInstanceManager_Update
    .extern data_ov035_02203c78
    .extern data_020f4e18
    .extern data_ov035_02203af8

    .global func_ov035_0220043c
func_ov035_0220043c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_022004c8
    add r0, r4, #0x160
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x170
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x104]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_022004cc
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
    ldr r1, L_022004d0
    add r0, r4, #0x170
    str r1, [r4, #0x170]
    bl PresentationList_DeleteAll
    ldr r1, L_022004d0
    add r0, r4, #0x160
    str r1, [r4, #0x160]
    bl PresentationList_DeleteAll
    add r0, r4, #0x120
    bl Graphics3DLightSet_Destroy
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
L_022004c8: .word data_ov035_02203c78
L_022004cc: .word data_020f4e18
L_022004d0: .word data_ov035_02203af8
    .size func_ov035_0220043c, .-func_ov035_0220043c

    .global func_ov035_022004d4
func_ov035_022004d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02200568
    add r0, r4, #0x160
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x170
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x104]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_0220056c
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
    ldr r1, L_02200570
    add r0, r4, #0x170
    str r1, [r4, #0x170]
    bl PresentationList_DeleteAll
    ldr r1, L_02200570
    add r0, r4, #0x160
    str r1, [r4, #0x160]
    bl PresentationList_DeleteAll
    add r0, r4, #0x120
    bl Graphics3DLightSet_Destroy
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
L_02200568: .word data_ov035_02203c78
L_0220056c: .word data_020f4e18
L_02200570: .word data_ov035_02203af8
    .size func_ov035_022004d4, .-func_ov035_022004d4

    .global func_ov035_02200574
func_ov035_02200574:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x160
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x170
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r3, [r4, #0x110]
    add r0, r4, #0xc
    ldr r1, [r3, #0x10]
    ldr r2, [r3, #0x20]
    ldr r3, [r3, #0x30]
    bl func_ov035_021fdd70
    ldr r0, [r4, #0x104]
    bl GraphicsAnimationInstanceManager_Update
    ldmia sp!, {r4, pc}
    .size func_ov035_02200574, .-func_ov035_02200574

