    .text
/* Exact fallback; see src/overlays/ov018/overlay018_scene_lifecycle.c (constructor). */
    .extern GameWork_SetFlag
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_020f4e18
    .extern gGamePhaseRuntime
    .extern data_ov018_021ffc10
    .extern data_ov018_021ffd3c
    .extern data_ov018_021ffd50
    .extern data_ov018_021ffd58
    .extern GamePhaseState_GetConfiguration
    .extern AnimationResourceState_InitEmbedded
    .extern AnimationResourceState_ReplaceResources
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern func_02091b6c
    .extern SceneInputBase_Init
    .extern TitleCharacterResourceCollection_Init
    .extern func_02092814
    .extern func_020957bc
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940
    .extern func_020b4554
    .extern func_ov000_021fb6e0
    .extern func_ov018_021fcf00
    .extern func_ov018_021fcf40
    .extern func_ov018_021fd36c
    .extern func_ov018_021fd5d0
    .extern func_ov018_021fd6c0
    .extern func_ov018_021fd740
    .extern func_ov018_021fe644
    .extern func_ov018_021ff330
    .extern gDebugFont
    .extern gGameWork
    .extern gHeapContext
    .extern genrand_int32
.global func_ov018_021fcf68
func_ov018_021fcf68:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r5, r1
    bl SceneInputBase_Init
    ldr r1, L_021fd31c
    add r0, r4, #0x64
    str r1, [r4, #0x0]
    bl func_ov018_021fd36c
    add r0, r4, #0x70
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x94
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xa0
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xac
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xb8
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xd8
    bl func_020957bc
    add r0, r4, #0x1a8
    bl func_02091b6c
    add r0, r4, #0x3cc
    bl func_ov018_021fcf00
    mov r0, #0x0
    str r0, [r4, #0x3dc]
    add r0, r4, #0x3e0
    bl func_02091b6c
    ldr r0, L_021fd320
    ldr r1, L_021fd324
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    str r5, [r4, #0x54]
    mov r0, #0x2c
    ldr r1, L_021fd328
    mov r2, #0x4
    ldr r3, L_021fd32c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd014
    mov r1, #0x80
    bl func_ov018_021ff330
L_021fd014:
    str r0, [r4, #0x58]
    mov r0, #0x0
    str r0, [r4, #0x3c8]
    str r0, [r4, #0x418]
    str r0, [r4, #0x68]
    str r0, [r4, #0x6c]
    bl genrand_int32
    str r0, [r4, #0x3dc]
    mov ip, #0x0
    str ip, [r4, #0x404]
    str ip, [r4, #0x408]
    str ip, [r4, #0x410]
    str ip, [r4, #0x40c]
    ldr r1, L_021fd330
    ldr r3, L_021fd32c
    mov r0, #0x24
    mov r2, #0x4
    str ip, [r4, #0x414]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd06c
    bl func_ov000_021fb6e0 ; func_ov001_021fb6e0, func_ov002_021fb6e0, func_ov003_021fb6e0, func_ov004_021fb6e0, func_ov005_021fb6e0, func_ov006_021fb6e0, func_ov007_021fb6e0, func_ov008_021fb6e0
L_021fd06c:
    ldr r1, L_021fd334
    str r0, [r4, #0x190]
    strh r1, [r0, #0x4]
    ldr r0, [r4, #0x190]
    ldr r2, L_021fd338
    ldr r1, L_021fd33c
    strh r2, [r0, #0x6]
    ldr r0, [r4, #0x190]
    ldr r2, L_021fd340
    strh r1, [r0, #0x8]
    ldr r0, [r4, #0x190]
    add r1, r1, #0x1d
    strh r2, [r0, #0xa]
    ldr r0, [r4, #0x190]
    ldr r2, L_021fd344
    strh r1, [r0, #0xc]
    ldr r0, [r4, #0x190]
    mov r1, #0x20
    strh r2, [r0, #0xe]
    ldr r0, [r4, #0x190]
    add r0, r0, #0x4
    bl func_020b4554
    ldr r0, L_021fd348
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    ldr r1, [r0, #0x0]
    ldr r0, L_021fd348
    str r1, [r4, #0x198]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    ldrsb r0, [r0, #0x4d]
    ldr r2, L_021fd348
    mov r3, #0x0
    str r0, [r4, #0x19c]
    ldr r1, [r2, #0x0]
    mov r0, r4
    add r1, r1, #0x3000
    ldr r1, [r1, #0xbc]
    ldrsb r1, [r1, #0x4e]
    str r1, [r4, #0x1a0]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x3000
    ldr r1, [r1, #0xbc]
    ldrsb r1, [r1, #0x4f]
    str r1, [r4, #0x1a4]
    str r3, [r4, #0x400]
    bl func_ov018_021fe644
    mov r0, #0x39
    str r0, [sp, #0x0]
    ldr r1, L_021fd34c
    add r0, r4, #0x94
    ldr r1, [r1, #0x0]
    mov r2, #0x38
    mov r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fd350
    ldr r1, L_021fd34c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0xa0
    sub r3, r3, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r1, L_021fd354
    mov r2, #0x4000
    str r1, [sp, #0x0]
    ldr r1, L_021fd34c
    add r0, r4, #0xac
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl AnimationResourceState_ReplaceResources
    ldr r3, L_021fd358
    ldr r1, L_021fd34c
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, r4, #0xb8
    sub r3, r3, #0x3
    bl AnimationResourceState_ReplaceResources
    ldr r0, L_021fd35c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021fd360
    str r0, [r4, #0xc4]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, L_021fd360
    str r0, [r4, #0xc8]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xcc]
    ldr r0, [r4, #0xc8]
    add r1, r4, #0x94
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r3, #0x0
    add r0, r4, #0xd8
    mov r2, #0x6
    str r3, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0xd8
    mov r1, #0xe8
    mov r2, #0xb4
    bl func_02095820
    add r0, r4, #0xd8
    bl func_02095940
    ldr r1, L_021fd364
    add r0, r4, #0x70
    bl func_02092814
    mov r0, r4
    bl func_ov018_021fd740
    mov r0, r4
    bl func_ov018_021fd5d0
    mov r0, r4
    bl func_ov018_021fd6c0
    mov r1, #0x0
    ldr r0, L_021fd348
    str r1, [r4, #0x188]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x184]
    ldr r2, [r0, #0x0]
    ldr r5, [r0, #0x54]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r4, #0xc4]
    add r1, r4, #0xb8
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xd0]
    ldrb r2, [r5, #0x3a]
    mov r0, #0x0
    mov r1, #0x21
    str r2, [sp, #0x0]
    ldrh r2, [r5, #0x28]
    str r2, [sp, #0x4]
    str r0, [sp, #0x8]
    ldrsh r2, [r5, #0x2c]
    ldrsh r3, [r5, #0x2e]
    ldr r0, [r4, #0xd0]
    bl GraphicsSpriteState_ApplyRenderConfig
    ldr r0, [r4, #0xc8]
    add r1, r4, #0xa0
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xd4]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xd4]
    mov r1, #0x18
    mov r2, #0xec
    mov r3, #0xac
    bl GraphicsSpriteState_ApplyRenderConfig
    mov r0, #0x0
    str r0, [r4, #0x18c]
    ldr r0, [r4, #0x20]
    ldr r1, L_021fd368
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fd31c: .word data_ov018_021ffd3c
L_021fd320: .word gGameWork
L_021fd324: .word 0x418
L_021fd328: .word data_ov018_021ffd50
L_021fd32c: .word gHeapContext
L_021fd330: .word data_ov018_021ffd58
L_021fd334: .word 0x3f1b
L_021fd338: .word 0x2655
L_021fd33c: .word 0x2042
L_021fd340: .word 0x6108
L_021fd344: .word 0x2218
L_021fd348: .word gGamePhaseRuntime
L_021fd34c: .word data_020f4e18
L_021fd350: .word 0x329a
L_021fd354: .word 0x4002
L_021fd358: .word 0x1004
L_021fd35c: .word data_020f4e14
L_021fd360: .word gDebugFont
L_021fd364: .word 0x7007
L_021fd368: .word data_ov018_021ffc10
    .size func_ov018_021fcf68, . - func_ov018_021fcf68
