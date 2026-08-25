.text
/* Exact fallback; see overlay039_script_render.c for portable C. */
    .extern func_ov039_022036f0
    .extern func_ov039_0220431c
    .extern func_ov039_022014f8
    .extern func_020befec
    .extern func_ov039_022049cc
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Assign
    .extern VecFx32Object_Destroy
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    .extern Sound_Play
    .extern SoundContext_PlayDefaultStream
    .extern Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt
    .extern func_ov069_02210a24
    .extern func_ov007_021fc200
    .extern func_ov039_02201b1c
    .extern func_ov039_0220159c
    .extern func_ov069_02211594
    .extern Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    .extern func_020a63d0
    .extern func_ov069_022119dc
    .extern Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    .extern func_ov069_02210a44
    .extern func_ov069_022119bc
    .extern genrand_int32
    .extern gGamePhaseRuntime
    .extern gSoundContext
    .extern data_ov039_022080c6
    .extern gFx32CosSinTable
    .global func_ov039_02201fec
func_ov039_02201fec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4c
    mov r5, r0
    bl func_ov039_022036f0
    mov r0, r5
    bl func_ov039_0220431c
    add r0, sp, #0x3c
    add r1, r5, #0x2c
    add r2, r5, #0xac
    bl func_ov039_022014f8
    add r0, r5, #0x1c00
    ldrh r0, [r0, #0xaa]
    mov r1, #0x7
    bl func_020befec
    rsbs r0, r0, #0xa
    movmi r0, #0x0
    str r0, [sp, #0x0]
    add r0, r5, #0x1000
    add r1, r5, #0x1c00
    ldr r0, [r0, #0xccc]
    ldrh r3, [r1, #0xa6]
    mov r2, r0, lsl #0x10
    add r1, sp, #0x3c
    add r0, r5, #0xbc
    mov r2, r2, lsr #0x10
    bl func_ov039_022049cc
    add r4, r5, #0x1c00
    ldrh r0, [r4, #0xb0]
    cmp r0, #0x0
    beq L_0220237c
    cmp r0, #0x1
    bne L_022020ac
    mov r1, #0x0
    add r6, r0, #0x1
    add r0, sp, #0x1c
    mov r3, r1
    sub r2, r1, #0x5a000
    strh r6, [r4, #0xb0]
    bl VecFx32Object_InitComponents
    add r1, sp, #0x1c
    add r0, r5, #0xac
    bl VecFx32Object_Assign
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    add r0, r5, #0x1000
    mov r1, #0x0
    str r1, [r0, #0xcc0]
    b L_022029c0
L_022020ac:
    cmp r0, #0x2
    bne L_02202180
    add r3, r5, #0x1000
    ldr r0, [r3, #0xcc0]
    mov r1, #0xa000
    add r0, r0, #0x9a
    add r2, r0, #0x100
    str r2, [r3, #0xcc0]
    ldr r0, [r5, #0xb4]
    rsb r1, r1, #0x0
    add r0, r0, r2
    str r0, [r5, #0xb4]
    cmp r0, r1
    ble L_022029c0
    str r1, [r5, #0xb4]
    ldrh r2, [r4, #0xb0]
    add r0, sp, #0x2c
    add r1, r5, #0x2c
    add r2, r2, #0x1
    strh r2, [r4, #0xb0]
    mov r4, #0x0
    add r2, r5, #0xac
    str r4, [r3, #0xcc0]
    bl func_ov039_022014f8
    ldr r0, L_02202ce4
    ldr r1, [sp, #0x34]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x10000
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    str r1, [sp, #0x34]
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x7
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x30]
    ldr r1, [sp, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x3
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    ldr r2, [r5, #0x48]
    mov r0, #0xc
    str r0, [r2, #0x44]
    mov r1, #0x2
    str r1, [r2, #0x48]
    ldr r0, L_02202ce8
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, #0x57
    bl Sound_Play
    add r0, sp, #0x2c
    bl VecFx32Object_Destroy
    b L_022029c0
L_02202180:
    cmp r0, #0x3
    bne L_022021dc
    ldr r1, [r5, #0x48]
    add r0, r1, #0x24
    add r1, r1, #0x34
    bl VecFx32Object_Assign
    add r1, r5, #0x1000
    ldr r0, [r1, #0xcc0]
    add r0, r0, #0x1
    str r0, [r1, #0xcc0]
    cmp r0, #0x6e
    ble L_022029c0
    mov r0, r4
    ldrh r4, [r0, #0xb0]
    mov r3, #0x0
    ldr r2, L_02202ce8
    add r4, r4, #0x1
    strh r4, [r0, #0xb0]
    str r3, [r1, #0xcc0]
    ldr r0, [r2, #0x0]
    mov r1, #0x13
    bl SoundContext_PlayDefaultStream
    b L_022029c0
L_022021dc:
    cmp r0, #0x4
    bne L_0220222c
    ldr r0, [r5, #0xa8]
    tst r0, #0x3
    bne L_022029c0
    ldr r0, L_02202ce4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r2, L_02202cec
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r5, #0x34]
    ldr r4, [r5, #0x30]
    mov r3, r2, asr #0xc
    mov r2, r4, asr #0xc
    sub r3, r3, #0x19
    bl Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt
    b L_022029c0
L_0220222c:
    cmp r0, #0x5
    bne L_022022fc
    add r0, r5, #0x1000
    mov r1, #0x3
    str r1, [r0, #0xcc4]
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x5a
    ble L_022029c0
    ldrh r3, [r4, #0xb0]
    mov r2, #0x0
    mov r1, #0x8
    add r3, r3, #0x1
    strh r3, [r4, #0xb0]
    str r2, [r0, #0xcc4]
    str r2, [r0, #0xcc0]
    mov r2, #0x32
    str r2, [r0, #0xcb4]
    mov r2, #0x2
    str r2, [r0, #0xcb8]
    ldr r2, [r5, #0x4c]
    sub r3, r1, #0x1
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
L_02202294:
    add r0, r5, r3, lsl #0x2
    ldr r1, [r0, #0x50]
    subs r3, r3, #0x1
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl L_02202294
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x18]
    add r0, r0, #0x30c
    add r0, r0, #0x800
    bl func_ov069_02210a24
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc200
    ldr r0, L_02202ce8
    ldr r1, L_02202cf0
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl Sound_Play
    ldr r0, L_02202ce8
    ldr r1, L_02202cf0
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl Sound_Play
    b L_022029c0
L_022022fc:
    cmp r0, #0x8
    bhi L_0220235c
    add r1, r5, #0x1000
    ldr r2, [r1, #0xcb4]
    ldr r0, [r1, #0xcb8]
    sub r0, r2, r0
    str r0, [r1, #0xcb4]
    ldr r0, [r1, #0xcb8]
    add r0, r0, #0x1
    str r0, [r1, #0xcb8]
    ldr r0, [r1, #0xcb4]
    cmp r0, #0x0
    bge L_022029c0
    mov r0, #0x0
    str r0, [r1, #0xcb4]
    ldr r0, [r1, #0xcb8]
    rsb r0, r0, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r1, #0xcb8]
    ldrh r0, [r4, #0xb0]
    add r0, r0, #0x1
    strh r0, [r4, #0xb0]
    b L_022029c0
L_0220235c:
    cmp r0, #0x9
    bne L_022029c0
    mov r0, #0x0
    strh r0, [r4, #0xb0]
    ldr r0, [r5, #0x48]
    mov r1, #0x2e
    str r1, [r0, #0x74]
    b L_022029c0
L_0220237c:
    ldrh r0, [r4, #0xa8]
    cmp r0, #0x0
    bne L_022023c8
    mov r0, r5
    bl func_ov039_02201b1c
    add r0, r5, #0x1000
    ldr r0, [r0, #0xcc4]
    cmp r0, #0x0
    bne L_022029c0
    add r1, sp, #0x18
    mov r0, r5
    bl func_ov039_0220159c
    ldr r0, [sp, #0x18]
    cmp r0, #0x46000
    movlt r0, #0x1
    strlt r0, [r5, #0x45c]
    movge r0, #0x0
    strge r0, [r5, #0x45c]
    b L_022029c0
L_022023c8:
    cmp r0, #0x1
    subhi r0, r0, #0x1
    strhih r0, [r4, #0xa8]
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x74]
    cmp r0, #0x19
    bne L_02202410
    add r0, r5, #0x1c00
    ldrh r0, [r0, #0xa8]
    cmp r0, #0x20
    blo L_02202410
    add r0, r5, #0x30c
    add r0, r0, #0x800
    bl func_ov069_02211594
    cmp r0, #0x0
    addeq r0, r5, #0x1c00
    moveq r1, #0x20
    streqh r1, [r0, #0xa8]
L_02202410:
    add r0, r5, #0x1c00
    ldrh r2, [r0, #0xaa]
    ldr r1, L_02202ce4
    add r2, r2, #0x1
    strh r2, [r0, #0xaa]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r1, r5, #0x1c00
    ldrh r1, [r1, #0xaa]
    mov r4, r0
    cmp r1, #0xa
    bne L_02202564
    ldr r3, [r5, #0x4c]
    mov r1, #0x8c
    str r1, [sp, #0x0]
    ldr r2, [r3, #0x30]
    ldr r1, [r3, #0x34]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    sub r2, r2, #0x50
    add r3, r1, #0x4b
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    ldr r2, [r5, #0x4c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    add r2, r2, #0x41
    add r3, r1, #0x3c
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    ldr r2, [r5, #0x4c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    sub r2, r2, #0x41
    sub r3, r1, #0x41
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    ldr r3, [r5, #0x4c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    mov r0, r4
    mov r1, #0x2
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x34]
    mov r2, r2, asr #0xc
    add r2, r2, #0x50
    mov r3, r3, asr #0xc
    sub r3, r3, #0x55
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    ldr r3, [r5, #0x4c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    mov r0, r4
    mov r1, #0x2
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x34]
    mov r2, r2, asr #0xc
    sub r2, r2, #0x1e
    mov r3, r3, asr #0xc
    add r3, r3, #0x1e
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
    ldr r3, [r5, #0x4c]
    mov r0, #0x8c
    str r0, [sp, #0x0]
    mov r0, r4
    mov r1, #0x2
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x34]
    mov r2, r2, asr #0xc
    add r2, r2, #0x24
    mov r3, r3, asr #0xc
    sub r3, r3, #0x24
    bl Graphics3dPresentation_CreatePreset25To27TimedPointSpriteEffectAt
L_02202564:
    add r0, r5, #0x1c00
    ldrh r1, [r0, #0xaa]
    ldr r0, L_02202cf4
    cmp r1, r0
    bne L_0220258c
    ldr r0, [r5, #0x48]
    mov r1, #0x1
    ldr r0, [r0, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a63d0
L_0220258c:
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq L_022025b0
    bl func_ov069_022119dc
    cmp r0, #0x0
    addne r0, r5, #0x1000
    movne r1, #0x1
    strne r1, [r0, #0xcac]
L_022025b0:
    add r0, r5, #0x1c00
    ldrh r2, [r0, #0xaa]
    ldr r1, L_02202cf4
    cmp r2, r1
    bne L_02202680
    ldr r2, [r5, #0x50]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    sub r2, r2, #0x1e
    add r3, r1, #0x1e
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r3, [r5, #0x50]
    add r0, r5, #0x30c
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    mov r1, #0x6
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r5, #0x60]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r5, #0x48]
    ldr r4, [r5, #0x50]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_02202ce8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r5, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_022029c0
L_02202680:
    add r0, r1, #0x28
    cmp r2, r0
    bne L_02202748
    ldr r2, [r5, #0x54]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    add r2, r2, #0x1e
    add r3, r1, #0x1e
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r3, [r5, #0x54]
    add r0, r5, #0x30c
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    mov r1, #0x7
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r5, #0x64]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r5, #0x48]
    ldr r4, [r5, #0x54]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_02202ce8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r1, [r5, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_022029c0
L_02202748:
    add r0, r1, #0x50
    cmp r2, r0
    bne L_02202810
    ldr r2, [r5, #0x58]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    sub r2, r2, #0x1e
    sub r3, r1, #0x1e
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r3, [r5, #0x58]
    add r0, r5, #0x30c
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    mov r1, #0x8
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r5, #0x68]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r5, #0x48]
    ldr r4, [r5, #0x58]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_02202ce8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r5, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_022029c0
L_02202810:
    add r0, r1, #0x78
    cmp r2, r0
    bne L_022028d8
    ldr r2, [r5, #0x5c]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r1, [r2, #0x30]
    ldr r0, [r2, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    mov r0, r4
    add r2, r2, #0x1e
    sub r3, r1, #0x1e
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r3, [r5, #0x5c]
    add r0, r5, #0x30c
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    mov r1, #0x9
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r3, [r5, #0x6c]
    ldrh r2, [r3, #0x42]
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldr r2, [r5, #0x48]
    ldr r4, [r5, #0x5c]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_02202ce8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    ldr r1, [r5, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_022029c0
L_022028d8:
    cmp r2, #0x1f4
    bne L_02202994
    ldr r1, [r5, #0x4c]
    mov r0, #0x64
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x34]
    ldr r2, [r1, #0x30]
    mov r1, r0, asr #0xc
    mov r0, r4
    mov r2, r2, asr #0xc
    add r3, r1, #0x1e
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset6To10SpriteEffectsAt
    ldr r3, [r5, #0x4c]
    add r0, r5, #0x30c
    ldrh r2, [r3, #0x42]
    add r0, r0, #0x800
    mov r1, #0xa
    orr r2, r2, #0x4
    strh r2, [r3, #0x42]
    ldrh r2, [r5, #0x42]
    orr r2, r2, #0x4
    strh r2, [r5, #0x42]
    ldr r2, [r5, #0x48]
    ldr r4, [r5, #0x4c]
    ldr r2, [r2, #0x8]
    ldr r3, [r2, #0x48]
    ldr r2, [r3, #0x30]
    str r2, [sp, #0x0]
    ldr r2, [r3, #0x34]
    str r2, [sp, #0x4]
    ldr r2, [r4, #0x30]
    ldr r3, [r4, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r3, asr #0xc
    bl func_ov069_02210a44
    ldr r0, L_02202ce8
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r5, #0x48]
    mov r0, #0x14
    str r0, [r1, #0x44]
    mov r0, #0x7
    str r0, [r1, #0x48]
    b L_022029c0
L_02202994:
    add r0, r1, #0xab
    cmp r2, r0
    bne L_022029c0
    ldr r0, [r5, #0x48]
    mov r1, #0x19
    str r1, [r0, #0x74]
    ldr r0, [r5, #0x48]
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    beq L_022029c0
    bl func_ov069_022119bc ; func_ov071_022119bc
L_022029c0:
    add r0, r5, #0x1c00
    ldrh r1, [r0, #0xa6]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa6]
    bne L_022029fc
    add r0, r5, #0x1000
    ldr r2, [r5, #0x30]
    ldr r1, [r0, #0xcec]
    add r1, r2, r1
    str r1, [r5, #0x30]
    ldr r1, [r5, #0x34]
    ldr r0, [r0, #0xcf0]
    add r0, r1, r0
    str r0, [r5, #0x34]
L_022029fc:
    ldr r0, [r5, #0x4c]
    add r1, r5, #0x2c
    add r0, r0, #0x2c
    bl VecFx32Object_Assign
    mov r0, #0x8
    ldr r3, L_02202cf8
    add r2, sp, #0x8
    sub r4, r0, #0x1
    mov r1, #0x4
L_02202a20:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_02202a20
L_02202a30:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x50]
    add r1, r5, #0x2c
    add r0, r0, #0x2c
    bl VecFx32Object_Assign
    add r0, r5, #0x1c00
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    beq L_02202ad0
    add r3, sp, #0x8
    add r2, sp, #0x10
    mov r1, #0x4
L_02202a60:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_02202a60
    mov r1, r4, lsl #0x1e
    add r0, sp, #0x10
    mov r1, r1, lsr #0x1d
    ldrh r1, [r0, r1]
    add r0, r5, #0x1000
    add r8, r5, r4, lsl #0x2
    mov r1, r1, asr #0x4
    mov r9, r1, lsl #0x1
    ldr r2, L_02202cfc
    mov r1, r9, lsl #0x1
    ldrsh r1, [r2, r1]
    ldr r3, [r0, #0xcb4]
    ldr r7, [r8, #0x50]
    mul r6, r3, r1
    ldr r3, [r7, #0x30]
    add r1, r2, r9, lsl #0x1
    sub r2, r3, r6
    str r2, [r7, #0x30]
    ldr r3, [r8, #0x50]
    ldrsh r1, [r1, #0x2]
    ldr r2, [r3, #0x34]
    ldr r0, [r0, #0xcb4]
    mla r1, r0, r1, r2
    str r1, [r3, #0x34]
L_02202ad0:
    add r2, r5, r4, lsl #0x1
    add r0, r2, #0x1c00
    ldrh r3, [r0, #0xf4]
    add r1, r5, r4, lsl #0x2
    ldr r0, [r1, #0x50]
    mov r3, r3, asr #0x4
    ldr r7, L_02202cfc
    mov r3, r3, lsl #0x2
    ldrsh r6, [r7, r3]
    ldr r8, [r0, #0x30]
    add r3, r2, #0xf4
    add r6, r6, r6, lsl #0x1
    add r6, r8, r6
    str r6, [r0, #0x30]
    add r0, r2, #0x1d00
    ldrh r6, [r0, #0x4]
    ldr r0, [r1, #0x50]
    add r1, r2, #0x104
    mov r2, r6, asr #0x4
    add r2, r7, r2, lsl #0x2
    ldrsh r6, [r2, #0x2]
    ldr r7, [r0, #0x34]
    add r2, r5, #0x1c00
    add r6, r6, r6, lsl #0x1
    add r6, r7, r6
    str r6, [r0, #0x34]
    ldrh r0, [r2, #0xaa]
    add r9, r5, r4, lsl #0x1
    add r8, r1, #0x1c00
    mov r0, r0, lsr #0x3
    rsbs r6, r0, #0xa
    add r0, r9, #0x1d00
    ldrh r2, [r0, #0x14]
    ldr r0, L_02202cfc
    movmi r6, #0x0
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x2
    ldrsh r0, [r0, r2]
    add r7, r3, #0x1c00
    mov r1, #0xa
    mul r0, r6, r0
    mov r0, r0, asr #0x3
    bl func_020befec
    ldrh r3, [r7, #0x0]
    add r1, r9, #0x1d00
    ldr r2, L_02202cfc
    add r0, r3, r0
    strh r0, [r7, #0x0]
    ldrh r0, [r1, #0x24]
    mov r1, #0xa
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r2, r0]
    mul r0, r6, r0
    mov r0, r0, asr #0x3
    bl func_020befec
    ldrh r3, [r8, #0x0]
    add r1, r9, #0x1d00
    add r2, r5, #0x1c00
    add r0, r3, r0
    strh r0, [r8, #0x0]
    ldrh r0, [r1, #0x14]
    add r0, r0, #0x64
    strh r0, [r1, #0x14]
    ldrh r0, [r1, #0x24]
    add r0, r0, #0x8c
    strh r0, [r1, #0x24]
    ldrh r0, [r2, #0xa6]
    cmp r0, #0x0
    beq L_02202c5c
    bl genrand_int32
    add r1, r5, #0x1c00
    ldr r2, L_02202d00
    ldrh r3, [r1, #0xa6]
    and r0, r0, r2
    tst r4, #0x1
    mul r0, r3, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mvneq r6, #0x4
    ldr r1, L_02202cfc
    mov r0, r0, lsl #0x2
    ldrsh r3, [r1, r0]
    add r0, r5, r4, lsl #0x2
    ldr r2, [r0, #0x50]
    add r0, r4, r4, lsr #0x1f
    movne r6, #0x5
    ldr r1, [r2, #0x30]
    movs r0, r0, asr #0x1
    mla r0, r3, r6, r1
    str r0, [r2, #0x30]
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x50]
    moveq r2, #0x5
    ldr r0, [r1, #0x34]
    mvnne r2, #0x4
    mla r0, r3, r2, r0
    str r0, [r1, #0x34]
L_02202c5c:
    subs r4, r4, #0x1
    bpl L_02202a30
    add r0, r5, #0x1c00
    ldrsh r0, [r0, #0xa4]
    cmp r0, #0x0
    ble L_02202cd4
    cmp r0, #0x14
    ldrle r0, [r5, #0xa8]
    mov r1, #0x1
    andle r1, r0, #0x3
    ble L_02202c94
    cmp r0, #0x28
    ldrle r0, [r5, #0xa8]
    andle r1, r0, #0x7
L_02202c94:
    cmp r1, #0x0
    bne L_02202cd4
    ldr r0, L_02202ce4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    ldr r2, L_02202cec
    mov r1, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r5, #0x34]
    ldr r4, [r5, #0x30]
    mov r3, r2, asr #0xc
    mov r2, r4, asr #0xc
    sub r3, r3, #0x19
    bl Graphics3dPresentation_CreatePreset30ColoredRegionSpriteEffectAt
L_02202cd4:
    add r0, sp, #0x3c
    bl VecFx32Object_Destroy
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_02202ce4: .word gGamePhaseRuntime
L_02202ce8: .word gSoundContext
L_02202cec: .word 0x5bf4
L_02202cf0: .word 0x1c5
L_02202cf4: .word 0x14a
L_02202cf8: .word data_ov039_022080c6
L_02202cfc: .word gFx32CosSinTable
L_02202d00: .word 0x7ff
    .size func_ov039_02201fec, .-func_ov039_02201fec

