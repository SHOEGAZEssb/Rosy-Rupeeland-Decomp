    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern Heap_Alloc
    .extern data_020f4e18
    .extern data_ov020_021fe518
    .extern data_ov020_021fe520
    .extern Heap_AllocAlternateEntry
    .extern AnimationResourceState_InitEmbedded
    .extern func_02071ee0
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern TitleCharacterResourceCollection_Init
    .extern func_02092814
    .extern func_02094154
    .extern InventoryScroll_SetSpritePriority
    .extern InventoryScroll_UpdatePresentation
    .extern func_020c09cc
    .extern func_ov020_021fce00
    .extern gHeapContext

.global func_ov020_021fce18
func_ov020_021fce18:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r0, r5, #0x8
    mov r4, r1
    mov r6, r2
    bl AnimationResourceState_InitEmbedded
    add r0, r5, #0x14
    bl TitleCharacterResourceCollection_Init
    str r4, [r5, #0x0]
    mov r0, r4
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r3, L_021fcfb4
    str r0, [r5, #0x4]
    mov r1, #0x2f
    str r1, [r0, #0x18]
    mov r1, #0x1c
    str r1, [r0, #0x1c]
    ldr r1, L_021fcfb8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0x8
    sub r3, r3, #0x1
    bl func_02071ee0
    str r6, [r5, #0x3c]
    mov ip, #0x0
    str ip, [r5, #0x40]
    ldr r6, [r5, #0x3c]
    mov r2, #0x4
    cmp r6, #0x0
    beq L_021fcf28
    mov r0, #0xc
    mul r0, r6, r0
    ldr r1, L_021fcfbc
    ldr r3, L_021fcfc0
    add r0, r0, #0x8
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_021fced8
    ldr r2, L_021fcfc4
    mov r1, r6
    str r2, [sp, #0x0]
    mov ip, #0x0
    mov r2, #0xc
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_020c09cc
L_021fced8:
    ldr r1, L_021fcfc8
    str r0, [r5, #0x38]
    ldr r3, L_021fcfc0
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf20
    mov r1, #0xda
    str r1, [sp, #0x0]
    mov r1, #0x18
    str r1, [sp, #0x4]
    mov r1, #0xc
    str r1, [sp, #0x8]
    ldr r2, [r5, #0x3c]
    mov r1, r4
    mov r3, #0x5
    bl func_02094154
L_021fcf20:
    str r0, [r5, #0x44]
    b L_021fcf70
L_021fcf28:
    ldr r1, L_021fcfc8
    ldr r3, L_021fcfc0
    mov r0, #0x80
    str ip, [r5, #0x38]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf6c
    mov r1, #0xda
    mov r2, #0x1
    str r1, [sp, #0x0]
    mov ip, #0x18
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    mov r4, #0xc
    str r4, [sp, #0x8]
    bl func_02094154
L_021fcf6c:
    str r0, [r5, #0x44]
L_021fcf70:
    ldr r0, [r5, #0x44]
    mov r1, #0x0
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r5, #0x44]
    bl InventoryScroll_UpdatePresentation
    add r0, r5, #0x14
    mov r1, #0x7000
    bl func_02092814
    ldr r1, L_021fcfcc
    add r0, r5, #0x14
    bl func_02092814
    ldr r1, L_021fcfd0
    add r0, r5, #0x14
    bl func_02092814
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fcfb4: .word 0x1153
L_021fcfb8: .word data_020f4e18
L_021fcfbc: .word data_ov020_021fe518
L_021fcfc0: .word gHeapContext
L_021fcfc4: .word func_ov020_021fce00
L_021fcfc8: .word data_ov020_021fe520
L_021fcfcc: .word 0x7006
L_021fcfd0: .word 0x7005
    .size func_ov020_021fce18, . - func_ov020_021fce18
