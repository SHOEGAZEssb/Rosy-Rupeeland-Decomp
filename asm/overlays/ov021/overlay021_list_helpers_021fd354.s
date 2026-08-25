    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern GraphicsSpriteState_ReleaseFromGroup

.global Overlay021_List_DestroyRowSprite
Overlay021_List_DestroyRowSprite:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x54]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0xc
    mul r4, r1, r0
    ldr r0, [r5, #0x4c]
    add r0, r0, r4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r5, #0x4c]
    mov r1, #0x0
    add r0, r0, r4
    str r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay021_List_DestroyRowSprite, . - Overlay021_List_DestroyRowSprite

