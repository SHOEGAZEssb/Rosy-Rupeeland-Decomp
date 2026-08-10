    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_lifecycle.c. */
    .extern GX_SetGraphicsMode
    .extern Heap_Free
    .extern data_020f4e14
    .extern data_ov017_02201628
    .extern data_ov017_02201638
    .extern data_ov017_02201754
    .extern func_020597fc
    .extern func_02071eb8
    .extern GraphicsResourceSetVariant_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern func_02075290
    .extern Graphics3DResourceOwner_Destroy
    .extern Graphics3DLightSet_Destroy
    .extern Graphics3DRenderObject_Destroy
    .extern func_020923a0
    .extern func_02092418
    .extern func_02092638
    .extern func_020926f8
    .extern func_020927b8
    .extern func_02095308
    .extern func_ov017_021fd780
    .extern func_ov017_021fd948
    .extern func_ov017_021fe58c
    .extern gSoundContext
.global func_ov017_021ff354
func_ov017_021ff354:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021ff530
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x260]
    cmp r0, #0x0
    beq L_021ff388
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff388:
    ldr r0, L_021ff534
    mov r1, #0x82
    ldr r0, [r0, #0x0]
    bl func_020597fc
    ldr r0, L_021ff538
    bl func_02095308
    add r0, r4, #0x3d8
    bl func_02095308
    add r0, r4, #0x3ec
    bl func_02095308
    ldr r0, [r4, #0x400]
    cmp r0, #0x0
    beq L_021ff3c8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff3c8:
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    beq L_021ff3d8
    bl Heap_Free
L_021ff3d8:
    ldr r5, [r4, #0x254]
    cmp r5, #0x0
    beq L_021ff3f4
    mov r0, r5
    bl func_ov017_021fe58c
    mov r0, r5
    bl Heap_Free
L_021ff3f4:
    ldr r5, [r4, #0x25c]
    cmp r5, #0x0
    beq L_021ff420
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteGroup_Destroy
    add r0, r5, #0x10
    bl func_02071eb8
    add r0, r5, #0x4
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
L_021ff420:
    ldr r5, [r4, #0x2bc]
    cmp r5, #0x0
    beq L_021ff43c
    mov r0, r5
    bl Graphics3DRenderObject_Destroy
    mov r0, r5
    bl Heap_Free
L_021ff43c:
    ldr r5, [r4, #0x240]
    cmp r5, #0x0
    beq L_021ff458
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_021ff458:
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x4
    add r0, r0, #0x400
    bl func_02092418
    ldr r0, L_021ff53c
    ldr r0, [r0, #0x0]
    bl func_02075290
    mov r1, #0x0
    mov r0, #0x1
    mov r2, r1
    bl GX_SetGraphicsMode
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    add r0, r4, #0x4
    add r0, r0, #0x400
    bl func_020923a0
    ldr r1, L_021ff540
    add r0, r4, #0x3ec
    str r1, [r4, #0x3ec]
    bl func_02095308
    ldr r1, L_021ff540
    add r0, r4, #0x3d8
    str r1, [r4, #0x3d8]
    bl func_02095308
    add r0, r4, #0x2d0
    bl Graphics3DLightSet_Destroy
    add r0, r4, #0x290
    bl func_ov017_021fd780
    add r0, r4, #0x264
    bl func_ov017_021fd780
    add r0, r4, #0x248
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x1fc
    bl func_020926f8
    add r0, r4, #0x1d8
    bl func_020927b8
    add r0, r4, #0x12c
    bl func_ov017_021fd948
    add r0, r4, #0x80
    bl func_ov017_021fd948
    add r0, r4, #0x74
    bl func_02071eb8
    add r0, r4, #0x68
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021ff530: .word data_ov017_02201638
L_021ff534: .word gSoundContext
L_021ff538: .word data_ov017_02201754
L_021ff53c: .word data_020f4e14
L_021ff540: .word data_ov017_02201628

    .size func_ov017_021ff354, . - func_ov017_021ff354
