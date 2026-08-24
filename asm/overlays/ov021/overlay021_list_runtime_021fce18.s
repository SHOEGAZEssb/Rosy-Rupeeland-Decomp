    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_runtime.c. */
    .extern Heap_Alloc
    .extern MIi_CpuCopy16
    .extern data_020f4e18
    .extern data_021f3ecc
    .extern data_ov021_02202f78
    .extern data_ov021_02202f80
    .extern func_02003e20
    .extern AnimationResourceState_InitEmbedded
    .extern func_02071ee0
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern LanguageLookupDatabase_GetResourceSize
    .extern LanguageLookupDatabase_GetResourceById
    .extern TitleCharacterResourceCollection_Init
    .extern func_02092814
    .extern func_02094154
    .extern InventoryScroll_SetSpritePriority
    .extern InventoryScroll_UpdatePresentation
    .extern func_020c09cc
    .extern func_ov021_021fce00
    .extern func_ov021_021fd224
    .extern gHeapContext

.global func_ov021_021fce18
func_ov021_021fce18:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r7, r0
    add r0, r7, #0x4
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl AnimationResourceState_InitEmbedded
    add r0, r7, #0x10
    bl AnimationResourceState_InitEmbedded
    add r0, r7, #0x28
    bl TitleCharacterResourceCollection_Init
    str r6, [r7, #0x0]
    mov r0, r6
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r7, #0x1c]
    mov r1, #0x2c
    str r1, [r0, #0x18]
    mov r1, #0x1c
    str r1, [r0, #0x1c]
    ldr r0, [r7, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r7, #0x20]
    ldr r0, L_021fd050
    ldr r1, L_021fd054
    bl LanguageLookupDatabase_GetResourceSize
    mov r8, r0
    ldr r0, L_021fd050
    ldr r1, L_021fd054
    bl LanguageLookupDatabase_GetResourceById
    mov r2, r8
    add r1, r7, #0x64
    bl MIi_CpuCopy16
    mov r0, #0x3f
    str r0, [sp, #0x0]
    ldr r1, L_021fd058
    add r0, r7, #0x4
    ldr r1, [r1, #0x0]
    mov r2, #0x3d
    mov r3, #0x3e
    bl func_02071ee0
    ldr r3, L_021fd05c
    ldr r1, L_021fd058
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r7, #0x10
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r7, #0x20]
    add r1, r7, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r7, #0x24]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x24]
    mov r1, #0x1c
    mov r2, #0x38
    mov r3, #0x86
    bl GraphicsSpriteState_ApplyRenderConfig
    str r4, [r7, #0x60]
    str r5, [r7, #0x50]
    mov r4, #0x0
    str r4, [r7, #0x54]
    ldr r5, [r7, #0x50]
    mov r2, #0x4
    cmp r5, #0x0
    beq L_021fcfc8
    mov r0, #0xc
    mul r0, r5, r0
    ldr r1, L_021fd060
    ldr r3, L_021fd064
    add r0, r0, #0x8
    bl func_02003e20
    cmp r0, #0x0
    beq L_021fcf78
    ldr r2, L_021fd068
    mov r1, r5
    str r2, [sp, #0x0]
    mov r2, #0xc
    mov r3, #0x8
    str r4, [sp, #0x4]
    bl func_020c09cc
L_021fcf78:
    ldr r1, L_021fd06c
    str r0, [r7, #0x4c]
    ldr r3, L_021fd064
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcfc0
    mov r2, #0xda
    mov r1, #0x18
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    sub r1, r1, #0x24
    str r1, [sp, #0x8]
    ldr r2, [r7, #0x50]
    mov r1, r6
    mov r3, #0x4
    bl func_02094154
L_021fcfc0:
    str r0, [r7, #0x58]
    b L_021fd010
L_021fcfc8:
    ldr r1, L_021fd06c
    ldr r3, L_021fd064
    mov r0, #0x80
    str r4, [r7, #0x4c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd00c
    mov r1, #0xda
    mov r2, #0x1
    str r1, [sp, #0x0]
    mov r4, #0x18
    mov r1, r6
    mov r3, r2
    str r4, [sp, #0x4]
    mov r4, #0xc
    str r4, [sp, #0x8]
    bl func_02094154
L_021fd00c:
    str r0, [r7, #0x58]
L_021fd010:
    ldr r0, [r7, #0x58]
    mov r1, #0x0
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r7, #0x58]
    bl InventoryScroll_UpdatePresentation
    mov r0, r7
    bl func_ov021_021fd224
    ldr r1, L_021fd070
    add r0, r7, #0x28
    bl func_02092814
    add r0, r7, #0x28
    mov r1, #0x7000
    bl func_02092814
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_021fd050: .word data_021f3ecc
L_021fd054: .word 0x2e5
L_021fd058: .word data_020f4e18
L_021fd05c: .word 0x329d
L_021fd060: .word data_ov021_02202f78
L_021fd064: .word gHeapContext
L_021fd068: .word func_ov021_021fce00
L_021fd06c: .word data_ov021_02202f80
L_021fd070: .word 0x7007
    .size func_ov021_021fce18, . - func_ov021_021fce18

