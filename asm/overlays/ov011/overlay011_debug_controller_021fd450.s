    .text
    .extern DebugText_Printf
    .extern data_020f4e14
    .extern data_ov011_021fe370
    .extern data_ov011_021fe3b0
    .extern data_ov011_021fe404
    .extern data_ov011_021fe620
    .extern data_ov011_021fe624
    .extern data_ov011_021fe628
    .extern data_ov011_021fe62c
    .extern data_ov011_021fe630
    .extern data_ov011_021fe634
    .extern data_ov011_021fe648
    .extern data_ov011_021fe660
    .extern data_ov011_021fe678
    .extern data_ov011_021fe690
    .extern data_ov011_021fe6a0
    .extern data_ov011_021fe6b0
    .extern GraphicsCharacterResource_GetUploadSize
    .extern GraphicsPaletteResource_GetUploadSize
    .extern GraphicsResourceSet_ReleaseHandles
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern GraphicsSpriteRenderer_Printf
    .extern GraphicsSpriteCanvas_DrawLine
    .extern Overlay011_InitSceneFields
    .extern Overlay011_SetupResources
    .extern func_ov011_021fdae0
    .extern gDebugFont

    ; Exact matching fallback; see the documented portable reconstruction in
    ; src/overlays/ov011/overlay011_debug_controller.c.
    .global Overlay011_UpdateDebugController
Overlay011_UpdateDebugController: ; 0x021fd450
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r9, r0
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x200
    beq L_021fd4b0
    ldr r0, [r9, #0x104]
    ldr r1, L_021fda98
    cmp r0, #0x0
    beq L_021fd498
    mov r0, #0x0
    str r0, [r9, #0x104]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1200
    str r0, [r1, #0x0]
    b L_021fd4b0
L_021fd498:
    mov r0, #0x1
    str r0, [r9, #0x104]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1300
    str r0, [r1, #0x0]
L_021fd4b0:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x8
    movne r0, #0x0
    strne r0, [r9, #0xfc]
    strne r0, [r9, #0x100]
    ldr r1, [r9, #0x50]
    ldrh r0, [r1, #0x0]
    tst r0, #0x100
    beq L_021fd52c
    tst r0, #0x20
    ldrne r0, [r9, #0xfc]
    addne r0, r0, #0x2
    strne r0, [r9, #0xfc]
    bne L_021fd4fc
    tst r0, #0x10
    ldrne r0, [r9, #0xfc]
    subne r0, r0, #0x2
    strne r0, [r9, #0xfc]
L_021fd4fc:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    ldrne r0, [r9, #0x100]
    addne r0, r0, #0x2
    strne r0, [r9, #0x100]
    bne L_021fd734
    tst r0, #0x80
    ldrne r0, [r9, #0x100]
    subne r0, r0, #0x2
    strne r0, [r9, #0x100]
    b L_021fd734
L_021fd52c:
    ldrh r0, [r1, #0x6]
    tst r0, #0x40
    beq L_021fd550
    ldr r0, [r9, #0x108]
    subs r0, r0, #0x1
    str r0, [r9, #0x108]
    movmi r0, #0x3
    strmi r0, [r9, #0x108]
    b L_021fd570
L_021fd550:
    tst r0, #0x80
    beq L_021fd570
    ldr r0, [r9, #0x108]
    add r0, r0, #0x1
    str r0, [r9, #0x108]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r9, #0x108]
L_021fd570:
    ldr r0, [r9, #0x108]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fd734
L_021fd580: ; jump table
    b L_021fd590 ; case 0
    b L_021fd600 ; case 1
    b L_021fd6a4 ; case 2
    b L_021fd6fc ; case 3
L_021fd590:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fd734
    tst r0, #0x10
    beq L_021fd5c4
    ldr r0, [r9, #0xd0]
    add r0, r0, #0x1
    str r0, [r9, #0xd0]
    cmp r0, #0x5
    movge r0, #0x0
    strge r0, [r9, #0xd0]
    b L_021fd5e0
L_021fd5c4:
    tst r0, #0x20
    beq L_021fd5e0
    ldr r0, [r9, #0xd0]
    subs r0, r0, #0x1
    str r0, [r9, #0xd0]
    movmi r0, #0x4
    strmi r0, [r9, #0xd0]
L_021fd5e0:
    ldr r0, L_021fda9c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r9, #0x78
    bl GraphicsResourceSet_ReleaseHandles
    mov r0, r9
    bl Overlay011_SetupResources
    b L_021fd734
L_021fd600:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fd734
    tst r0, #0x10
    beq L_021fd64c
    ldr r1, [r9, #0xd0]
    add r2, r9, #0xe8
    ldr r0, [r2, r1, lsl #0x2]
    add r0, r0, #0x1
    str r0, [r2, r1, lsl #0x2]
    ldr r0, [r9, #0xd0]
    add r2, r9, r0, lsl #0x2
    ldr r1, [r2, #0xe8]
    ldr r0, [r2, #0xd4]
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r2, #0xe8]
    b L_021fd684
L_021fd64c:
    tst r0, #0x20
    beq L_021fd684
    ldr r1, [r9, #0xd0]
    add r2, r9, #0xe8
    ldr r0, [r2, r1, lsl #0x2]
    sub r0, r0, #0x1
    str r0, [r2, r1, lsl #0x2]
    ldr r0, [r9, #0xd0]
    add r1, r9, r0, lsl #0x2
    ldr r0, [r1, #0xe8]
    cmp r0, #0x0
    ldrlt r0, [r1, #0xd4]
    sublt r0, r0, #0x1
    strlt r0, [r1, #0xe8]
L_021fd684:
    ldr r0, L_021fda9c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r9, #0x78
    bl GraphicsResourceSet_ReleaseHandles
    mov r0, r9
    bl Overlay011_SetupResources
    b L_021fd734
L_021fd6a4:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fd734
    ldr r0, [r9, #0x104]
    ldr r1, L_021fda98
    cmp r0, #0x0
    beq L_021fd6e0
    mov r0, #0x0
    str r0, [r9, #0x104]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1200
    str r0, [r1, #0x0]
    b L_021fd734
L_021fd6e0:
    mov r0, #0x1
    str r0, [r9, #0x104]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1300
    str r0, [r1, #0x0]
    b L_021fd734
L_021fd6fc:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x6]
    tst r0, #0x30
    beq L_021fd734
    ldr r1, [r9, #0xcc]
    ldr r0, L_021fda9c
    rsb r1, r1, #0x1
    str r1, [r9, #0xcc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r9, #0x78
    bl GraphicsResourceSet_ReleaseHandles
    mov r0, r9
    bl Overlay011_SetupResources
L_021fd734:
    ldr r0, L_021fdaa0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r2, [r9, #0xd0]
    ldr r1, L_021fdaa4
    ldr r0, L_021fdaa0
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    mov r3, #0x6
    bl DebugText_Printf
    ldr r0, [r9, #0xd0]
    mov r2, #0x3
    add r0, r9, r0, lsl #0x2
    ldr r3, [r0, #0x84]
    ldr r1, [r0, #0xe8]
    ldr r0, L_021fdaa0
    add r1, r3, r1, lsl #0x5
    add r1, r1, #0xc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r2
    mov r1, #0x1
    bl DebugText_Printf
    ldr r0, L_021fdaa8
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r6, [sp, #0x1c]
    ldr r7, [sp, #0x20]
    ldr r8, [sp, #0x24]
    ldr r4, L_021fdaa0
    mov r5, #0x0
    mov r10, #0x5
    mov r11, #0x1
L_021fd7c8:
    cmp r5, #0x3
    addls pc, pc, r5, lsl #0x2
    b L_021fd888
L_021fd7d4: ; jump table
    b L_021fd7e4 ; case 0
    b L_021fd804 ; case 1
    b L_021fd834 ; case 2
    b L_021fd860 ; case 3
L_021fd7e4:
    ldr r0, [r9, #0xd0]
    mov r1, r11
    stmia sp, {r0, r10}
    ldr r0, [r4, #0x0]
    ldr r3, [sp, #0x18]
    add r2, r5, #0x5
    bl GraphicsSpriteRenderer_Printf
    b L_021fd888
L_021fd804:
    ldr r0, [r9, #0xd0]
    mov r1, #0x1
    add r3, r9, r0, lsl #0x2
    ldr r0, [r3, #0xe8]
    add r2, r5, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r3, #0xd4]
    mov r3, r6
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fd888
L_021fd834:
    ldr r0, [r9, #0x104]
    mov r1, #0x1
    cmp r0, #0x0
    ldrne r0, L_021fdaac
    add r2, r5, #0x5
    ldreq r0, L_021fdab0
    mov r3, r7
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteRenderer_Printf
    b L_021fd888
L_021fd860:
    ldr r0, [r9, #0xcc]
    mov r1, #0x1
    cmp r0, #0x0
    ldrne r0, L_021fdab4
    add r2, r5, #0x5
    ldreq r0, L_021fdab8
    mov r3, r8
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteRenderer_Printf
L_021fd888:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt L_021fd7c8
    ldr r1, L_021fdabc
    ldr r0, L_021fdaa0
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x108]
    ldr r0, [r0, #0x0]
    add r2, r1, #0x5
    mov r1, #0x1
    mov r3, #0x2
    bl DebugText_Printf
    ldr r0, [r9, #0x80]
    ldr r1, [r9, #0x7c]
    ldr r2, [r0, #0x20]
    ldr r5, [r1, #0x20]
    ldr r1, [r2, #0xc]
    ldr r0, L_021fdaa0
    str r1, [sp, #0x0]
    ldr r1, [r2, #0x10]
    ldr r3, L_021fdac0
    str r1, [sp, #0x4]
    ldrh r4, [r5, #0x4]
    mov r1, #0x1
    mov r2, #0xa
    str r4, [sp, #0x8]
    ldrh r4, [r5, #0x6]
    str r4, [sp, #0xc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x78]
    ldr r4, [r0, #0x10]
    bl GraphicsCharacterResource_GetUploadSize
    str r4, [sp, #0x0]
    ldr r1, L_021fdaa0
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    mov r2, #0xc
    ldr r3, L_021fdac4
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x7c]
    ldr r4, [r0, #0x10]
    bl GraphicsPaletteResource_GetUploadSize
    str r4, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, L_021fdaa0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0xd
    ldr r3, L_021fdac8
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x80]
    ldr r4, [r0, #0x10]
    bl func_ov011_021fdae0
    str r4, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, L_021fdaa0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    ldr r3, L_021fdacc
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0xfc]
    ldr r0, L_021fdaa0
    str r1, [sp, #0x0]
    ldr r2, [r9, #0x100]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x12
    ldr r3, L_021fdad0
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r9, #0x58]
    ldr r0, L_021fdaa0
    str r1, [sp, #0x0]
    ldr r1, [r9, #0x5c]
    ldr r3, L_021fdad4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x13
    bl GraphicsSpriteRenderer_Printf
    ldr r0, L_021fdaa0
    ldr r3, L_021fdad8
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x15
    bl GraphicsSpriteRenderer_Printf
    ldr r0, [r9, #0x44]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fda54
    ldr r0, L_021fda9c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r2, [r9, #0x5c]
    mov r1, #0x2
    str r2, [sp, #0x0]
    ldr r0, L_021fda9c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r3, #0xff
    bl GraphicsSpriteCanvas_DrawLine
    ldr r1, [r9, #0x58]
    mov r0, #0xbf
    str r0, [sp, #0x0]
    mov r2, #0x2
    ldr r0, L_021fda9c
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x0
    bl GraphicsSpriteCanvas_DrawLine
L_021fda54:
    ldr r0, [r9, #0x50]
    ldrh r0, [r0, #0x2]
    tst r0, #0x2
    beq L_021fda8c
    ldr r0, L_021fdadc
    add r1, sp, #0x10
    ldr r2, [r0, #0x4]
    ldr r3, [r0, #0x0]
    sub r0, r2, #0x48
    str r0, [sp, #0x14]
    str r3, [sp, #0x10]
    add r0, r9, #0x24
    ldmia r1, {r1, r2}
    bl Overlay011_InitSceneFields
L_021fda8c:
    mov r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fda98: .word 0x4001000
L_021fda9c: .word gDebugFont
L_021fdaa0: .word data_020f4e14
L_021fdaa4: .word data_ov011_021fe404
L_021fdaa8: .word data_ov011_021fe370
L_021fdaac: .word data_ov011_021fe620
L_021fdab0: .word data_ov011_021fe624
L_021fdab4: .word data_ov011_021fe628
L_021fdab8: .word data_ov011_021fe62c
L_021fdabc: .word data_ov011_021fe630
L_021fdac0: .word data_ov011_021fe634
L_021fdac4: .word data_ov011_021fe648
L_021fdac8: .word data_ov011_021fe660
L_021fdacc: .word data_ov011_021fe678
L_021fdad0: .word data_ov011_021fe690
L_021fdad4: .word data_ov011_021fe6a0
L_021fdad8: .word data_ov011_021fe6b0
L_021fdadc: .word data_ov011_021fe3b0

    .size Overlay011_UpdateDebugController, . - Overlay011_UpdateDebugController
