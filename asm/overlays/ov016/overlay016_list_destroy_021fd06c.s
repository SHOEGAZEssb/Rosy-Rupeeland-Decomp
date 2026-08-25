    .text
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern TitleCharacterResourceCollection_Destroy
    .extern CxxArray_DestroyAndFree
    .extern Overlay016_ListDescriptor_NoOp

/* Exact fallback for list destruction; see src/overlays/ov016/overlay016_list_lifecycle.c. */
    .global Overlay016_List_Destroy

Overlay016_List_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq L_021fd09c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd09c:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq L_021fd0b8
    ldr r3, L_021fd0d8
    mov r1, #0x14
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
L_021fd0b8:
    add r0, r4, #0x28
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x18
    bl AnimationResourceState_Destroy
    add r0, r4, #0xc
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd0d8: .word Overlay016_ListDescriptor_NoOp

    .size Overlay016_List_Destroy, . - Overlay016_List_Destroy
