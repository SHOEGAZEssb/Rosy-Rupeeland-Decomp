.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_lifecycle.c for documented portable C. */
.extern data_020f4e18
.extern data_ov031_021fe758
.extern data_ov031_021fe788
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02091e28
.extern Presentation_InitVariant
.extern Presentation_SetPosition
.extern SpritePresentation_Init
.extern SpritePresentation_SyncPosition
.extern gDebugFont
.extern genrand_int32
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov031_021fd258
func_ov031_021fd258:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_02091e28
    ldr r1, L_021fd494
    add r0, r4, #0x5c
    str r1, [r4, #0x0]
    bl func_02071ea4
    add r0, r4, #0xb4
    bl Presentation_InitVariant
    mov r0, #0x0
    str r0, [r4, #0x150]
    bl genrand_int32
    str r0, [r4, #0x150]
    ldr r0, L_021fd498
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x54]
    ldr r0, L_021fd498
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x58]
    ldr r3, L_021fd49c
    add r0, r4, #0x5c
    str r3, [sp, #0x0]
    ldr r1, L_021fd4a0
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, L_021fd4a4
    add r1, r4, #0x5c
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xce]
    str r0, [r4, #0x6c]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x2000
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r2, #0xa0
    mov r3, #0x48
    bl func_02073e48
    ldr r0, [r4, #0x58]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x2
    mov r2, #0xa0
    mov r3, #0x80
    bl func_02073e48
    ldr r0, [r4, #0x58]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0xd1
    mov r3, #0x11
    bl func_02073e48
    ldr r0, [r4, #0x6c]
    cmp r0, #0x0
    bne L_021fd3c0
    ldr r0, [r4, #0x58]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x3
    str r1, [sp, #0x0]
    mov r1, #0x1800
    str r1, [sp, #0x4]
    mov ip, #0x0
    mov r1, #0x8
    mov r2, #0xa0
    mov r3, #0x48
    str ip, [sp, #0x8]
    bl func_02073e48
L_021fd3c0:
    ldr r1, L_021fd4a8
    mov ip, #0x0
    ldr r3, L_021fd4ac
    mov r0, #0xa0
    mov r2, #0x4
    str ip, [r4, #0x68]
    bl Heap_Alloc
    movs r5, r0
    beq L_021fd404
    ldr r0, [r4, #0x54]
    add r1, r4, #0x5c
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, r5
    bl SpritePresentation_Init
    mov r5, r0
L_021fd404:
    str r5, [r4, #0x70]
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r0, #0x1000
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x70]
    mov r1, #0x1
    ldr r0, [r0, #0x9c]
    mov r2, #0xa0
    mov r3, #0x12
    bl func_02073e48
    ldr r0, [r4, #0x6c]
    mov r1, #0xa0000
    cmp r0, #0x0
    ldr r0, [r4, #0x70]
    mov r3, #0x0
    bne L_021fd45c
    mov r2, #0x70000
    bl Presentation_SetPosition
    b L_021fd464
L_021fd45c:
    mov r2, #0x12000
    bl Presentation_SetPosition
L_021fd464:
    ldr r0, [r4, #0x70]
    bl SpritePresentation_SyncPosition
    mov r2, #0x0
    mov r1, r2
L_021fd474:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x74]
    cmp r2, #0x10
    blt L_021fd474
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fd494: .word data_ov031_021fe758
L_021fd498: .word gDebugFont
L_021fd49c: .word 0x23b0
L_021fd4a0: .word data_020f4e18
L_021fd4a4: .word gGameWork
L_021fd4a8: .word data_ov031_021fe788
L_021fd4ac: .word gHeapContext
.size func_ov031_021fd258, .-func_ov031_021fd258
