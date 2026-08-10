.text

/* Exact fallback; see src/overlays/ov028/overlay028_scene_graphics.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_021f3d68
.extern data_ov028_021ff2e8
.extern data_ov028_021ff300
.extern GamePhaseCurrencyHud_Update
.extern func_02070638
.extern func_02070874
.extern func_02070e0c
.extern func_02070f34
.extern func_02072048
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern func_0209189c
.extern func_020925a4
.extern func_020925f8
.extern func_02092638
.extern func_02092850
.extern func_02094574
.extern func_020948e4
.extern func_02095360
.extern func_020958d8
.extern func_020b2058
.extern func_020b44e8
.extern func_ov028_021fcf2c
.extern func_ov028_021fd00c
.extern func_ov028_021fd20c
.extern func_ov028_021fd2ec
.extern func_ov028_021fda4c
.extern func_ov028_021fe540
.extern gHeapContext
.extern gLupyContext
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern Heap_Alloc


    .global func_ov028_021fe1b0
func_ov028_021fe1b0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r3, L_021fe384
    mov r1, #0x1e
    ldrh r2, [r3, #0x0]
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r0, #0x48]
    mov r0, #0x0
    bl func_020925a4
    ldr r1, L_021fe388
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3a00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x3c00
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x6]
    bl func_020925f8
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    ldr r0, L_021fe38c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r1, [r0, #0x1a]
    strh r1, [r0, #0x2]
    ldrh r1, [r0, #0x1e]
    strh r1, [r0, #0x4]
    add r0, sp, #0x1c
    bl GraphicsResourceSet_Init
    add r0, sp, #0x10
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe390
    ldr r1, L_021fe394
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x1c
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r3, L_021fe398
    ldr r1, L_021fe394
    str r3, [sp, #0x0]
    sub r2, r3, #0x3
    ldr r1, [r1, #0x0]
    add r0, sp, #0x10
    sub r3, r3, #0x2
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x1c
    mov r1, #0x1
    mov r2, #0x0
    bl func_02072048
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    bl func_02072048
    add r0, sp, #0x10
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x1c
    bl GraphicsResourceSet_Destroy
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, L_021fe39c
    ldr r0, L_021fe394
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r1, #0x8
    bl func_02070f34
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r5, [sp, #0x8]
    mov r0, r5
    bl func_02070874
    mov r4, r0
    mov r0, r5
    bl func_02070874
    mov r1, r0
    mov r0, r4
    mov r2, #0x0
    bl func_ov028_021fcf2c
    ldr r0, L_021fe3a0
    mov r1, #0x100
    mov r2, #0x20
    bl func_020b2058
    mov r0, #0x0
    bl func_02092850
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
L_021fe384: .word 0x4000304
L_021fe388: .word 0x4000008
L_021fe38c: .word data_020f4e14
L_021fe390: .word 0x803f
L_021fe394: .word data_020f4e18
L_021fe398: .word 0x8040
L_021fe39c: .word 0xc00b
L_021fe3a0: .word data_ov028_021ff300
.size func_ov028_021fe1b0, .-func_ov028_021fe1b0
    .global func_ov028_021fe3a4
func_ov028_021fe3a4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, L_021fe428
    mov r6, r0
    ldr r3, L_021fe42c
    mov r0, #0x4c
    mov r2, #0x4
    ldr r4, L_021fe430
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe3dc
    ldr r1, L_021fe434
    ldr r2, [r4, #0x10c]
    ldr r1, [r1, #0x0]
    bl func_ov028_021fd00c
L_021fe3dc:
    mov r5, #0x0
    str r0, [r6, #0x220]
    mov r8, r5
    mov r7, #0x18
    b L_021fe410
L_021fe3f0:
    add r1, r4, r5, lsl #0x2
    ldr r0, [r6, #0x220]
    ldr r1, [r1, #0x8]
    bl func_ov028_021fd20c
    mul r1, r5, r7
    strh r8, [r0, #0x8]
    strh r1, [r0, #0xa]
    add r5, r5, #0x1
L_021fe410:
    ldr r0, [r4, #0x10c]
    cmp r5, r0
    blt L_021fe3f0
    ldr r0, [r6, #0x220]
    bl func_ov028_021fd2ec
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe428: .word data_ov028_021ff2e8
L_021fe42c: .word gHeapContext
L_021fe430: .word data_021f3d68
L_021fe434: .word data_020f4e14
.size func_ov028_021fe3a4, .-func_ov028_021fe3a4
    .global func_ov028_021fe438
func_ov028_021fe438:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x264
    bl func_02095360
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    beq L_021fe45c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
L_021fe45c:
    ldr r0, [r4, #0x260]
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    beq L_021fe4e8
    add r0, r4, #0x27c
    mvn r1, #0x1
    mov r2, #0x2
    bl func_0209189c
    ldr r2, [r4, #0x274]
    ldr r1, [r4, #0x260]
    add r2, r2, r0, lsl #0xc
    add r0, r1, #0xc
    mov r1, #0x2
    bl func_020948e4
    add r0, r4, #0x27c
    mvn r1, #0x1
    mov r2, #0x2
    bl func_0209189c
    ldr r2, [r4, #0x278]
    ldr r1, [r4, #0x260]
    add r2, r2, r0, lsl #0xc
    add r0, r1, #0x1c
    mov r1, #0x2
    bl func_020948e4
    add r0, r4, #0x27c
    mov r1, #0x10
    mov r2, #0x20
    bl func_0209189c
    mov r1, r0
    ldr r0, [r4, #0x260]
    bl func_ov028_021fe540
L_021fe4e8:
    ldr r0, L_021fe53c
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    add r0, r4, #0x98
    bl func_020958d8
    add r0, r4, #0x144
    bl func_020958d8
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq L_021fe528
    ldr r0, [r0, #0x44]
    bl func_02094574
L_021fe528:
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov028_021fda4c
    ldmia sp!, {r4, pc}
L_021fe53c: .word gLupyContext
.size func_ov028_021fe438, .-func_ov028_021fe438
