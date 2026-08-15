.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_scene_lifecycle.c for documented portable C. */

    .extern func_ov035_021fd4dc
    .extern Heap_Free
    .extern PresentationList_DeleteAll
    .extern Graphics3DResourceOwner_RemoveManager
    .extern func_02071e04
    .extern GraphicsResourceSetVariant_Destroy
    .extern data_ov035_02203c24
    .extern data_020f4e18
    .extern data_ov035_02203af8

    .global func_ov035_02200d40
func_ov035_02200d40:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02200df0
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x170]
    cmp r4, #0x0
    beq L_02200d6c
    mov r0, r4
    bl func_ov035_021fd4dc
    mov r0, r4
    bl Heap_Free
L_02200d6c:
    add r0, r5, #0x108
    bl PresentationList_DeleteAll
    add r0, r5, #0x118
    bl PresentationList_DeleteAll
    add r0, r5, #0x128
    bl PresentationList_DeleteAll
    ldr r1, [r5, #0xf8]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_02200df4
    ldr r1, [r5, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_02200df8
    add r0, r5, #0x128
    str r1, [r5, #0x128]
    bl PresentationList_DeleteAll
    ldr r1, L_02200df8
    add r0, r5, #0x118
    str r1, [r5, #0x118]
    bl PresentationList_DeleteAll
    ldr r1, L_02200df8
    add r0, r5, #0x108
    str r1, [r5, #0x108]
    bl PresentationList_DeleteAll
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r5, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r5, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_02200df0: .word data_ov035_02203c24
L_02200df4: .word data_020f4e18
L_02200df8: .word data_ov035_02203af8
    .size func_ov035_02200d40, .-func_ov035_02200d40

    .global func_ov035_02200dfc
func_ov035_02200dfc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02200eb4
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x170]
    cmp r4, #0x0
    beq L_02200e28
    mov r0, r4
    bl func_ov035_021fd4dc
    mov r0, r4
    bl Heap_Free
L_02200e28:
    add r0, r5, #0x108
    bl PresentationList_DeleteAll
    add r0, r5, #0x118
    bl PresentationList_DeleteAll
    add r0, r5, #0x128
    bl PresentationList_DeleteAll
    ldr r1, [r5, #0xf8]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_02200eb8
    ldr r1, [r5, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_02200ebc
    add r0, r5, #0x128
    str r1, [r5, #0x128]
    bl PresentationList_DeleteAll
    ldr r1, L_02200ebc
    add r0, r5, #0x118
    str r1, [r5, #0x118]
    bl PresentationList_DeleteAll
    ldr r1, L_02200ebc
    add r0, r5, #0x108
    str r1, [r5, #0x108]
    bl PresentationList_DeleteAll
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r5, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r5, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_02200eb4: .word data_ov035_02203c24
L_02200eb8: .word data_020f4e18
L_02200ebc: .word data_ov035_02203af8
    .size func_ov035_02200dfc, .-func_ov035_02200dfc

