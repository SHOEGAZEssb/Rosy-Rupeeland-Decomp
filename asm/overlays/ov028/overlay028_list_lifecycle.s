.text

/* Exact fallback; see src/overlays/ov028/overlay028_list_lifecycle.c. */
.extern data_020f4e18
.extern data_ov028_021ff2c0
.extern data_ov028_021ff2c8
.extern func_02003e20
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern TitleCharacterResourceCollection_Init
.extern func_020927b8
.extern func_02092814
.extern func_02094154
.extern InventoryScroll_SetSpritePriority
.extern InventoryScroll_UpdatePresentation
.extern func_020c09cc
.extern func_020c0c24
.extern func_ov028_021fcff4
.extern func_ov028_021fd208
.extern gHeapContext
.extern Heap_Alloc

.global func_ov028_021fd00c
func_ov028_021fd00c:
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
    str r0, [r5, #0x4]
    mov r1, #0x2f
    str r1, [r0, #0x18]
    mov r1, #0x1c
    str r1, [r0, #0x1c]
    mov r0, #0x62
    str r0, [sp, #0x0]
    ldr r1, L_021fd190
    add r0, r5, #0x8
    ldr r1, [r1, #0x0]
    mov r2, #0x60
    mov r3, #0x61
    bl func_02071ee0
    str r6, [r5, #0x3c]
    mov ip, #0x0
    str ip, [r5, #0x40]
    ldr r6, [r5, #0x3c]
    mov r2, #0x4
    cmp r6, #0x0
    beq L_021fd11c
    mov r0, #0xc
    mul r0, r6, r0
    ldr r1, L_021fd194
    ldr r3, L_021fd198
    add r0, r0, #0x8
    bl func_02003e20
    cmp r0, #0x0
    beq L_021fd0cc
    ldr r2, L_021fd19c
    mov r1, r6
    str r2, [sp, #0x0]
    mov ip, #0x0
    mov r2, #0xc
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_020c09cc
L_021fd0cc:
    ldr r1, L_021fd1a0
    str r0, [r5, #0x38]
    ldr r3, L_021fd198
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd114
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
L_021fd114:
    str r0, [r5, #0x44]
    b L_021fd164
L_021fd11c:
    ldr r1, L_021fd1a0
    ldr r3, L_021fd198
    mov r0, #0x80
    str ip, [r5, #0x38]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd160
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
L_021fd160:
    str r0, [r5, #0x44]
L_021fd164:
    ldr r0, [r5, #0x44]
    mov r1, #0x0
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r5, #0x44]
    bl InventoryScroll_UpdatePresentation
    ldr r1, L_021fd1a4
    add r0, r5, #0x14
    bl func_02092814
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd190: .word data_020f4e18
L_021fd194: .word data_ov028_021ff2c0
L_021fd198: .word gHeapContext
L_021fd19c: .word func_ov028_021fcff4
L_021fd1a0: .word data_ov028_021ff2c8
L_021fd1a4: .word 0x7006
.size func_ov028_021fd00c, .-func_ov028_021fd00c

.global func_ov028_021fd1a8
func_ov028_021fd1a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq L_021fd1d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd1d0:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_021fd1ec
    ldr r3, L_021fd204
    mov r1, #0xc
    mov r2, #0x8
    bl func_020c0c24
L_021fd1ec:
    add r0, r4, #0x14
    bl func_020927b8
    add r0, r4, #0x8
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd204: .word func_ov028_021fd208
.size func_ov028_021fd1a8, .-func_ov028_021fd1a8

.global func_ov028_021fd208
func_ov028_021fd208:
    bx lr
.size func_ov028_021fd208, .-func_ov028_021fd208

.global func_ov028_021fd20c
func_ov028_021fd20c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, [r0, #0x38]
    mov r2, #0x0
    cmp r5, #0x0
    beq L_021fd26c
    ldr ip, [r0, #0x40]
    ldr r3, [r0, #0x3c]
    cmp ip, r3
    movge r0, r2
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r3, #0xc
    mul r4, ip, r3
    str r1, [r5, r4]
    ldr lr, [r0, #0x40]
    ldr ip, [r0, #0x38]
    mov r1, #0x18
    mla r3, lr, r3, ip
    mul r1, lr, r1
    strh r2, [r3, #0x8]
    strh r1, [r3, #0xa]
    ldr r1, [r0, #0x40]
    add r2, r5, r4
    add r1, r1, #0x1
    str r1, [r0, #0x40]
L_021fd26c:
    mov r0, r2
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov028_021fd20c, .-func_ov028_021fd20c

.global func_ov028_021fd274
func_ov028_021fd274:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x1
    str r3, [r4, #0x48]
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq L_021fd2a8
    ldr r2, [r4, #0x44]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    strlt r3, [r0, #0x20]
    b L_021fd2b4
L_021fd2a8:
    ldr r0, [r4, #0x44]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
L_021fd2b4:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}
.size func_ov028_021fd274, .-func_ov028_021fd274
