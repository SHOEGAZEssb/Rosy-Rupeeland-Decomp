    .text
    .extern CheckedFS_CloseFile
    .extern CheckedFS_GetFileLength
    .extern CheckedFS_InitFile
    .extern CheckedFS_OpenFile
    .extern CheckedFS_ReadFile
    .extern GX_DispOn
    .extern GX_SetGraphicsMode
    .extern Heap_Alloc
    .extern Scene_Init
    .extern Scene_SetFlags03
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_ov010_021fea38
    .extern data_ov010_021fea50
    .extern data_ov010_021fec34
    .extern data_ov010_021fec68
    .extern data_ov010_021fec7c
    .extern data_ov010_021fec84
    .extern data_ov010_021fec8c
    .extern func_02002700
    .extern func_020720c0
    .extern GraphicsSpriteRenderer_HideAllSprites
    .extern func_02075238
    .extern func_020755bc
    .extern Graphics3DResourceOwner_Init
    .extern Graphics3DResourceOwner_CreateManager
    .extern Graphics3DSceneState_Init
    .extern Graphics3DResourceBinding_Init
    .extern func_02091e28
    .extern func_02092364
    .extern func_020923a4
    .extern func_02092638
    .extern func_0209285c
    .extern func_020b0300
    .extern func_020b4554
    .extern func_ov010_021fce00
    .extern func_ov010_021fce1c
    .extern func_ov010_021fce40
    .extern func_ov010_021fce7c
    .extern func_ov010_021fce84
    .extern func_ov010_021fce94
    .extern func_ov010_021fd39c
    .extern func_ov010_021fd45c
    .extern gHeapContext

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov010/overlay010_scene_construct.c. */
    .global func_ov010_021fcebc
func_ov010_021fcebc: ; 0x021fcebc
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x54
    mov r10, r0
    bl Scene_Init
    add r0, r10, #0x24
    bl func_02091e28
    ldr r0, L_021fd19c
    ldr r1, L_021fd1a0
    str r0, [r10, #0x0]
    add r0, r10, #0x7c
    str r1, [r10, #0x24]
    bl func_020720c0
    add r0, r10, #0x98
    bl Graphics3DSceneState_Init
    add r0, r10, #0x180
    bl func_02092364
    add r0, r10, #0x180
    bl func_020923a4
    mov r1, #0x0
    ldr r0, L_021fd1a4
    str r1, [r10, #0x74]
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r9, #0x0
    ldr r5, L_021fd1a8
    ldr r7, L_021fd1ac
    add r8, sp, #0xc
    mov r11, #0x4
    mov r4, r9
L_021fcf30:
    mov r0, r8
    bl CheckedFS_InitFile
    ldr r1, [r7, r9, lsl #0x2]
    mov r0, r8
    bl CheckedFS_OpenFile
    cmp r0, #0x0
    beq L_021fcfac
    mov r0, r8
    bl CheckedFS_GetFileLength
    ldr r3, L_021fd1b0
    mov r1, r5
    mov r2, r11
    mov r6, r0
    bl func_02002700
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0x90]
    mov r0, r6, lsr #0x5
    str r0, [r1, #0x134]
    str r4, [r1, #0x13c]
    ldr r1, [r1, #0x90]
    mov r0, r8
    mov r2, r6
    bl CheckedFS_ReadFile
    cmp r6, r0
    bne L_021fcfac
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x90]
    mov r1, r6
    bl func_020b4554
    mov r0, r8
    bl CheckedFS_CloseFile
L_021fcfac:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt L_021fcf30
    ldr r0, L_021fd1a4
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_021fd1a4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_HideAllSprites
    ldr r0, L_021fd1b4
    ldr r1, L_021fd1b8
    ldr r3, L_021fd1b0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcff8
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_021fcff8:
    str r0, [r10, #0x78]
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r10, #0x88]
    mov r4, #0x0
    ldr r1, L_021fd1bc
    ldr r3, L_021fd1b0
    mov r0, #0x18
    mov r2, #0x4
    str r4, [r10, #0x8c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd044
    ldr r3, L_021fd1c0
    ldr r1, L_021fd1c4
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r10, #0x78]
    sub r3, r3, #0x1
    bl Graphics3DResourceBinding_Init
L_021fd044:
    str r0, [r10, #0x130]
    mov r1, #0x0
    str r1, [r10, #0x144]
    str r1, [r10, #0x148]
    str r1, [r10, #0x150]
    str r1, [r10, #0x14c]
    mov r0, r10
    str r1, [r10, #0x12c]
    bl func_ov010_021fd39c
    mov r0, r10
    bl func_ov010_021fd45c
    mov r1, #0x11
    mov r0, #0x0
    str r1, [r10, #0x6c]
    bl func_ov010_021fce00
    bl GX_DispOn
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl GX_SetGraphicsMode
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    mov r0, #0x10
    str r0, [r10, #0x70]
    ldr r2, L_021fd1c8
    mov r0, #0x0
    ldr r1, [r2, #0x0]
    orr r1, r1, #0x10000
    str r1, [r2, #0x0]
    bl func_ov010_021fce1c
    ldr r3, L_021fd1cc
    ldr r1, L_021fd1d0
    ldrh r2, [r3, #0x0]
    mov r0, #0x1
    and r1, r2, r1
    strh r1, [r3, #0x0]
    bl func_ov010_021fce40
    mov r2, #0x2
    ldr r1, L_021fd1d4
    mov r0, #0x0
    str r2, [r1, #0x0]
    ldr r2, [r10, #0x154]
    mov r1, #0x1f
    str r0, [sp, #0x0]
    orr r0, r2, r2, lsl #0x5
    orr r0, r0, r2, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr r2, L_021fd1d8
    mov r3, #0x3f
    bl func_020b0300
    ldr r2, L_021fd1dc
    ldr r1, L_021fd1e0
    mov r0, #0x1
    str r2, [r1, #0x0]
    str r0, [r10, #0x98]
    add r0, r10, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, #0x2000
    bl func_ov010_021fce7c
    add r0, r10, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov010_021fce84
    mov r0, #0x0
    bl func_0209285c
    mov r0, r10
    bl Scene_SetFlags03
    ldr r0, L_021fd1e4
    add r1, sp, #0x4
    ldr r3, [r0, #0x20]
    ldr r2, [r0, #0x24]
    str r3, [sp, #0x4]
    sub r0, r2, #0x48
    str r0, [sp, #0x8]
    add r0, r10, #0x24
    ldmia r1, {r1, r2}
    bl func_ov010_021fce94
    mov r0, r10
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd19c: .word data_ov010_021fec34
L_021fd1a0: .word data_ov010_021fec68
L_021fd1a4: .word data_020f4e14
L_021fd1a8: .word data_ov010_021fec7c
L_021fd1ac: .word data_ov010_021fea50
L_021fd1b0: .word gHeapContext
L_021fd1b4: .word 0x624
L_021fd1b8: .word data_ov010_021fec84
L_021fd1bc: .word data_ov010_021fec8c
L_021fd1c0: .word 0x611b
L_021fd1c4: .word data_020f4e18
L_021fd1c8: .word 0x4001000
L_021fd1cc: .word 0x4000060
L_021fd1d0: .word 0xcfef
L_021fd1d4: .word 0x4000540
L_021fd1d8: .word 0x7fff
L_021fd1dc: .word 0xbfff0000
L_021fd1e0: .word 0x4000580
L_021fd1e4: .word data_ov010_021fea38

    .size func_ov010_021fcebc, . - func_ov010_021fcebc
