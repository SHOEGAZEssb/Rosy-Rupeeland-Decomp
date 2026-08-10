    .text
    .extern Scene_Init
    .extern Scene_SetFlags03
    .extern CheckedFS_InitFile
    .extern CheckedFS_OpenFile
    .extern CheckedFS_GetFileLength
    .extern CheckedFS_ReadFile
    .extern CheckedFS_CloseFile
    .extern Heap_Alloc
    .extern G3X_Init
    .extern GX_DispOn
    .extern GX_SetGraphicsMode
    .extern func_02002700
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern Graphics3DResourceOwner_Init
    .extern Graphics3DLightSet_Init
    .extern Graphics3DSceneState_Init
    .extern Graphics3DResourceBinding_Init
    .extern func_02091e28
    .extern func_02092364
    .extern func_020923a4
    .extern func_02092638
    .extern func_020b0300
    .extern func_020b4554
    .extern func_020bf1f8
    .extern func_ov012_021fce00
    .extern func_ov012_021fd004
    .extern func_ov012_021fd020
    .extern func_ov012_021fd044
    .extern func_ov012_021fd080
    .extern func_ov012_021fd0bc
    .extern func_ov012_021fd0c4
    .extern func_ov012_021fd0d4
    .extern func_ov012_021fd148
    .extern func_ov012_021fd5ac
    .extern func_ov012_021fd63c
    .extern data_ov012_021fe670
    .extern data_ov012_021fe6a4
    .extern data_ov012_021fe4d0
    .extern data_ov012_021fe6b8
    .extern data_ov012_021fe6d4
    .extern data_ov012_021fe6dc
    .extern data_ov012_021fe6e4
    .extern data_020f4e14
    .extern data_020f4e18
    .extern gHeapContext
/* Exact compiler-order fallback; see src/overlays/ov012/overlay012_scene_construct.c. */
    .global func_ov012_021fd170
func_ov012_021fd170:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x60
    mov r4, r0
    bl Scene_Init
    add r0, r4, #0x24
    bl func_02091e28
    ldr r0, L_021fd424
    ldr r1, L_021fd428
    str r0, [r4]
    add r0, r4, #0x80
    str r1, [r4, #0x24]
    bl Graphics3DSceneState_Init
    add r0, r4, #0x114
    bl Graphics3DLightSet_Init
    add r0, r4, #0x158
    bl func_ov012_021fce00
    add r0, r4, #0x1c4
    bl func_02092364
    add r0, r4, #0x1c4
    bl func_020923a4
    mov r0, #0
    str r0, [r4, #0x74]
    ldr r0, L_021fd42c
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, sp, #0x18
    bl CheckedFS_InitFile
    ldr r1, L_021fd430
    add r0, sp, #0x18
    bl CheckedFS_OpenFile
    cmp r0, #0
    beq L_021fd254
    add r0, sp, #0x18
    bl CheckedFS_GetFileLength
    ldr r1, L_021fd434
    ldr r3, L_021fd438
    mov r5, r0
    mov r2, #4
    bl func_02002700
    str r0, [r4, #0x7c]
    mov r0, r5
    mov r1, #0x18
    bl func_020bf1f8
    str r0, [r4, #0x184]
    mov r0, #0
    str r0, [r4, #0x188]
    ldr r1, [r4, #0x7c]
    add r0, sp, #0x18
    mov r2, r5
    bl CheckedFS_ReadFile
    cmp r5, r0
    bne L_021fd254
    ldr r0, [r4, #0x7c]
    mov r1, r5
    bl func_020b4554
    add r0, sp, #0x18
    bl CheckedFS_CloseFile
L_021fd254:
    bl G3X_Init
    ldr r0, L_021fd43c
    ldr r1, L_021fd440
    ldr r3, L_021fd438
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_021fd280
    mov r1, #1
    mov r2, #2
    bl Graphics3DResourceOwner_Init
L_021fd280:
    ldr r1, L_021fd444
    str r0, [r4, #0x78]
    ldr r3, L_021fd438
    mov r0, #0x18
    mov r2, #4
    bl Heap_Alloc
    cmp r0, #0
    beq L_021fd2bc
    ldr r3, L_021fd448
    ldr r1, L_021fd44c
    str r3, [sp]
    ldr r1, [r1]
    ldr r2, [r4, #0x78]
    sub r3, r3, #1
    bl Graphics3DResourceBinding_Init
L_021fd2bc:
    str r0, [r4, #0x154]
    mov r1, #0
    str r1, [r4, #0x18c]
    mov r0, r4
    str r1, [r4, #0x190]
    bl func_ov012_021fd5ac
    mov r1, #0x11
    mov r0, #0
    str r1, [r4, #0x6c]
    bl func_ov012_021fd004
    bl GX_DispOn
    mov r0, #1
    mov r1, #0
    mov r2, r0
    bl GX_SetGraphicsMode
    mov r0, #0
    mov r1, #1
    mov r2, #2
    mov r3, #3
    bl func_02092638
    mov r0, #0x10
    str r0, [r4, #0x70]
    ldr r2, L_021fd450
    mov r0, #0
    ldr r1, [r2]
    orr r1, r1, #0x10000
    str r1, [r2]
    bl func_ov012_021fd020
    mov r0, #1
    bl func_ov012_021fd044
    mov r0, #1
    bl func_ov012_021fd080
    mov r2, #2
    ldr r1, L_021fd454
    mov r0, #0
    str r2, [r1]
    ldr r2, [r4, #0x194]
    mov r1, #0x1f
    str r0, [sp]
    orr r0, r2, r2, lsl #5
    orr r0, r0, r2, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr r2, L_021fd458
    mov r3, #0x3f
    bl func_020b0300
    mov r1, #0
    ldr r2, L_021fd45c
    ldr r0, L_021fd460
    str r1, [r2]
    str r0, [r2, #0xbc]
    mov r0, #1
    str r0, [r4, #0x80]
    add r0, r4, #0x80
    mov r2, r1
    mov r3, #0x4000
    bl func_ov012_021fd0bc
    add r0, r4, #0x80
    mov r1, #0
    mov r2, r1
    mov r3, r1
    bl func_ov012_021fd0c4
    mov r3, #0x1000
    rsb r3, r3, #0
    str r3, [sp]
    mov r0, #0x1f
    str r0, [sp, #4]
    str r0, [sp, #8]
    str r0, [sp, #0xc]
    add r0, r4, #0x114
    mov r1, #0
    mov r2, #0x1000
    bl func_ov012_021fd0d4
    mov r0, r4
    bl func_ov012_021fd63c
    mov r0, r4
    bl Scene_SetFlags03
    ldr r0, L_021fd464
    add r1, sp, #0x10
    ldr r3, [r0]
    ldr r2, [r0, #4]
    str r3, [sp, #0x10]
    sub r0, r2, #0x48
    str r0, [sp, #0x14]
    add r0, r4, #0x24
    ldmia r1, {r1, r2}
    bl func_ov012_021fd148
    mov r0, r4
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
L_021fd424:
    .word data_ov012_021fe670
L_021fd428:
    .word data_ov012_021fe6a4
L_021fd42c:
    .word data_020f4e14
L_021fd430:
    .word data_ov012_021fe6b8
L_021fd434:
    .word data_ov012_021fe6d4
L_021fd438:
    .word gHeapContext
L_021fd43c:
    .word 0x00000624
L_021fd440:
    .word data_ov012_021fe6dc
L_021fd444:
    .word data_ov012_021fe6e4
L_021fd448:
    .word 0x0000611b
L_021fd44c:
    .word data_020f4e18
L_021fd450:
    .word 0x04001000
L_021fd454:
    .word 0x04000540
L_021fd458:
    .word 0x00007fff
L_021fd45c:
    .word 0x040004c4
L_021fd460:
    .word 0xbfff0000
L_021fd464:
    .word data_ov012_021fe4d0
    .size func_ov012_021fd170, . - func_ov012_021fd170
