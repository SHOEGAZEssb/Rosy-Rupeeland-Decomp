.text

/* Exact fallback; see src/overlays/ov032/overlay032_constructor.c for documented portable C. */
.extern __construct_array
.extern gDisplayBrightnessPair
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov032_02202220
.extern data_ov032_02202340
.extern DisplayBrightnessPair_GetScreen
.extern GamePhaseProgress_GetCurrentAdjustedThreshold
.extern GamePhaseProgress_GetOrCreateGlobal
.extern func_02058eb8
.extern Sound_LoadGroup
.extern GraphicsArchive_AcquireVfdResource
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02092364
.extern TitleDialog_Init
.extern func_020adc90
.extern func_020bf1f8
.extern func_ov032_021fce00
.extern func_ov032_021fce08
.extern func_ov032_021fd7a4
.extern func_ov032_021fd7c0
.extern Overlay032Child_Destroy
.extern func_ov032_02200f88
.extern func_ov032_0220142c
.extern Overlay032Controller_CreateObject
.extern func_ov032_022014c0
.extern GameWork_ClearFlag
.extern gDebugFont
.extern genrand_int32
.extern gGameWork
.extern gHeapContext
.extern GraphicsResourceSet_Init
.extern gSoundContext
.extern Heap_Alloc


    .global func_ov032_021fce20
func_ov032_021fce20:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    add r0, r4, #0x1c
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x28
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x34
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x40
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x4c
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x58
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x64
    bl func_ov032_0220142c
    add r0, r4, #0x94
    bl func_ov032_0220142c
    add r0, r4, #0xc4
    bl func_ov032_0220142c
    add r0, r4, #0xf4
    bl func_ov032_0220142c
    add r0, r4, #0x124
    bl func_ov032_0220142c
    add r0, r4, #0x154
    bl func_ov032_0220142c
    add r0, r4, #0x184
    bl func_ov032_0220142c
    add r0, r4, #0x1b4
    bl func_ov032_0220142c
    add r0, r4, #0x1e4
    bl func_ov032_0220142c
    add r0, r4, #0x214
    bl func_ov032_0220142c
    add r0, r4, #0x244
    bl func_ov032_0220142c
    add r0, r4, #0x274
    bl func_ov032_0220142c
    add r0, r4, #0x2a4
    bl func_ov032_0220142c
    add r0, r4, #0x2d4
    bl func_ov032_0220142c
    add r0, r4, #0x304
    bl func_ov032_0220142c
    ldr r1, L_021fd758
    add r0, r4, #0x334
    str r1, [sp, #0x0]
    mov r1, #0x28
    mov r2, #0x30
    ldr r3, L_021fd75c
    bl __construct_array
    add r0, r4, #0x2b4
    add r0, r0, #0x800
    bl func_ov032_0220142c
    add r0, r4, #0x2e4
    add r0, r0, #0x800
    bl func_ov032_0220142c
    add r0, r4, #0x314
    add r0, r0, #0x800
    bl func_ov032_0220142c
    add r0, r4, #0x344
    add r0, r0, #0x800
    bl GraphicsResourceSet_Init
    add r0, r4, #0x354
    add r0, r0, #0x800
    bl func_ov032_021fd7a4
    add r0, r4, #0x3e8
    add r0, r0, #0x800
    bl func_02092364
    ldr r1, L_021fd760
    add r0, r4, #0x44
    str r1, [sp, #0x0]
    ldr r3, L_021fd764
    add r0, r0, #0xc00
    mov r1, #0x5
    mov r2, #0x6c
    bl __construct_array
    add r0, r4, #0x2dc
    add r0, r0, #0xc00
    bl func_ov032_0220142c
    add r0, r4, #0x318
    add r0, r0, #0xc00
    bl GraphicsResourceSet_Init
    mov r0, #0x0
    str r0, [r4, #0xf2c]
    mov r0, #0x49
    str r0, [r4, #0xe64]
    mov r2, #0x2
L_021fcf84:
    add r1, r2, #0x4c
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0xe60]
    cmp r2, #0x15
    blt L_021fcf84
    mov r0, #0xf000
    mov r1, #0x28000
    bl func_020adc90
    str r0, [r4, #0xc30]
    mov r0, #0x100000
    mov r1, #0x3c000
    bl func_020adc90
    ldr r1, L_021fd768
    str r0, [r4, #0xc38]
    ldr r0, [r1, #0x0]
    mov r1, #0x81
    bl Sound_LoadGroup
    mov r0, #0x1e
    str r0, [sp, #0x0]
    ldr r0, L_021fd768
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    mov r3, #0x14
    bl func_02058eb8
    ldr r0, L_021fd76c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    ldrsh r0, [r0, #0xce]
    str r0, [r4, #0xc1c]
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgress_GetCurrentAdjustedThreshold
    str r0, [r4, #0xc20]
    ldr r1, [r4, #0xc1c]
    mov r0, #0x0
    str r1, [r4, #0xc24]
    str r0, [r4, #0xb74]
    str r0, [r4, #0xc2c]
    str r0, [r4, #0xbd8]
    str r0, [r4, #0xb78]
    str r0, [r4, #0xf28]
    bl genrand_int32
    mov r1, #0x78
    bl func_020bf1f8
    str r1, [r4, #0xbdc]
    ldr r0, L_021fd770
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    str r0, [r4, #0xbe0]
    ldr r0, L_021fd770
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    str r0, [r4, #0xbe4]
    ldr r0, L_021fd774
    ldr r1, L_021fd778
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquireVfdResource
    str r0, [r4, #0x8]
    mov r0, #0xec
    ldr r1, L_021fd77c
    mov r2, #0x4
    ldr r3, L_021fd780
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd09c
    ldr r1, L_021fd784
    ldr r2, [r4, #0x8]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fd09c:
    str r0, [r4, #0x10]
    mov r0, #0x32
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x10]
    mov r1, #0x20
    mov r2, #0x7e
    mov r3, #0xbe
    bl func_ov032_021fce08
    mov r3, #0x0
    ldr r0, [r4, #0x10]
    sub r2, r3, #0x2
    str r3, [r0, #0xb4]
    ldr r0, [r4, #0x10]
    mov r1, #0xc
    str r2, [r0, #0xbc]
    ldr r2, [r4, #0x10]
    ldr r0, L_021fd784
    str r1, [r2, #0xd0]
    str r3, [r2, #0xd4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x4]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, L_021fd788
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x0]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    add r0, r4, #0x44
    mov r7, #0x0
    add r6, r0, #0xc00
    mov r5, #0x6c
L_021fd11c:
    mla r0, r7, r5, r6
    ldr r3, [r4, #0x0]
    mov r1, r4
    mov r2, r7
    bl func_ov032_02200f88
    add r7, r7, #0x1
    cmp r7, #0x5
    blt L_021fd11c
    ldr r3, L_021fd78c
    ldr r0, L_021fd774
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x1c
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_02071ee0
    mov r1, #0x28
    ldr r0, L_021fd774
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x34
    mov r2, #0x26
    mov r3, #0x27
    bl func_02071ee0
    mov r1, #0x5c
    ldr r0, L_021fd774
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r4, #0x28
    mov r2, #0x5b
    mov r3, #0x8
    bl func_02071ee0
    ldr r3, L_021fd790
    add r0, r4, #0x40
    str r3, [sp, #0x0]
    ldr r1, L_021fd774
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r3, L_021fd794
    add r0, r4, #0x4c
    str r3, [sp, #0x0]
    ldr r1, L_021fd774
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r3, L_021fd798
    add r0, r4, #0x58
    str r3, [sp, #0x0]
    ldr r1, L_021fd774
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    add r0, r4, #0x64
    ldr r1, [r4, #0x4]
    add r2, r4, #0x1c
    bl Overlay032Controller_CreateObject
    mov r0, #0x4c
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x64
    mov r2, r1
    mov r3, #0x80
    bl func_ov032_022014c0
    add r0, r4, #0x94
    ldr r1, [r4, #0x4]
    add r2, r4, #0x1c
    bl Overlay032Controller_CreateObject
    mov r0, #0x4c
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    add r0, r4, #0x94
    mov r1, #0x1
    mov r2, r1
    mov r3, #0x94
    bl func_ov032_022014c0
    ldr r1, [r4, #0x4]
    add r0, r4, #0xc4
    add r2, r4, #0x1c
    bl Overlay032Controller_CreateObject
    mov r0, #0x67
    mov r1, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r2, r1
    str r0, [sp, #0x10]
    add r0, r4, #0xc4
    mov r3, #0x88
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x184
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x38
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x10
    str r0, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    mov r1, #0x0
    str r1, [sp, #0x10]
    add r0, r4, #0x184
    mov r2, #0x1
    mov r3, #0x80
    bl func_ov032_022014c0
    add r0, r4, #0x1b4
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x2e
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x1b4
    mov r1, #0x14
    mov r2, r1
    mov r3, #0xad
    bl func_ov032_022014c0
    add r0, r4, #0xf4
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x58
    str r0, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r2, [sp, #0x10]
    add r0, r4, #0xf4
    mov r2, #0x3
    mov r3, #0x80
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x124
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x78
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x10
    str r0, [sp, #0x8]
    mov r1, #0x4
    str r1, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x10]
    add r0, r4, #0x124
    mov r2, #0x5
    mov r3, #0x80
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x1e4
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x6e
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r1, #0x14
    add r0, r4, #0x1e4
    mov r2, r1
    mov r3, #0xad
    bl func_ov032_022014c0
    add r0, r4, #0x154
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0xa0
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    sub r0, r0, #0x5
    str r0, [sp, #0x10]
    add r0, r4, #0x154
    mov r1, #0x6
    mov r2, #0x7
    mov r3, #0xd8
    bl func_ov032_022014c0
    add r0, r4, #0x214
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x60
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x214
    mov r1, #0x8
    mov r2, #0x9
    mov r3, #0x50
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x244
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x60
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x244
    mov r1, #0xa
    mov r2, #0xb
    mov r3, #0xb0
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x2d4
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x3c
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r1, #0xc
    add r0, r4, #0x2d4
    mov r2, r1
    mov r3, #0x38
    bl func_ov032_022014c0
    add r0, r4, #0x314
    add r0, r0, #0x800
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x6c
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x314
    add r0, r0, #0x800
    mov r1, #0xd
    mov r2, #0xe
    mov r3, #0x80
    bl func_ov032_022014c0
    add r0, r4, #0x2b4
    add r0, r0, #0x800
    ldr r1, [r4, #0x0]
    add r2, r4, #0x40
    bl Overlay032Controller_CreateObject
    mov r3, #0x64
    str r3, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x2b4
    add r0, r0, #0x800
    mov r2, #0x1
    bl func_ov032_022014c0
    add r0, r4, #0x2e4
    ldr r1, [r4, #0x0]
    add r0, r0, #0x800
    add r2, r4, #0x40
    bl Overlay032Controller_CreateObject
    mov r1, #0x64
    add r0, r4, #0x2e4
    str r1, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r3, #0x0
    str r3, [sp, #0x8]
    mov r2, #0x4
    str r2, [sp, #0xc]
    str r3, [sp, #0x10]
    add r0, r0, #0x800
    mov r2, #0x3
    mov r3, #0x96
    bl func_ov032_022014c0
    ldr r1, [r4, #0x0]
    add r0, r4, #0x274
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x84
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x274
    mov r1, #0xf
    mov r2, #0x10
    mov r3, #0x40
    bl func_ov032_022014c0
    add r0, r4, #0x2a4
    ldr r1, [r4, #0x0]
    add r2, r4, #0x28
    bl Overlay032Controller_CreateObject
    mov r0, #0x84
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r1, [sp, #0x10]
    add r0, r4, #0x2a4
    mov r1, #0x11
    mov r2, #0x12
    mov r3, #0xe4
    bl func_ov032_022014c0
    add r0, r4, #0x304
    ldr r1, [r4, #0x0]
    add r2, r4, #0x58
    bl Overlay032Controller_CreateObject
    mov r0, #0x90
    str r0, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    mov r0, #0x4
    str r0, [sp, #0xc]
    str r2, [sp, #0x10]
    add r0, r4, #0x304
    mov r2, r1
    mov r3, #0x20
    bl func_ov032_022014c0
    mov r1, #0x0
    str r1, [r4, #0xb84]
    str r1, [r4, #0xb80]
    str r1, [r4, #0xbcc]
    str r1, [r4, #0xbc8]
    str r1, [r4, #0xbd0]
    str r1, [r4, #0xbd4]
    ldr r0, L_021fd76c
    ldr r1, L_021fd79c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021fd7a0
    mov r1, #0x0
    ldr r3, [r0, #0x18]
    ldr r2, [r0, #0x1c]
    mov r0, r4
    str r3, [r4, #0xb6c]
    str r2, [r4, #0xb70]
    str r1, [r4, #0xb64]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fd758: .word func_ov032_021fce00
L_021fd75c: .word func_ov032_0220142c
L_021fd760: .word Overlay032Child_Destroy
L_021fd764: .word func_ov032_021fd7c0
L_021fd768: .word gSoundContext
L_021fd76c: .word gGameWork
L_021fd770: .word gDisplayBrightnessPair
L_021fd774: .word data_020f4e18
L_021fd778: .word 0x7007
L_021fd77c: .word data_ov032_02202340
L_021fd780: .word gHeapContext
L_021fd784: .word gDebugFont
L_021fd788: .word data_020f4e14
L_021fd78c: .word 0x14f1
L_021fd790: .word 0x1371
L_021fd794: .word 0x21e5
L_021fd798: .word 0x3347
L_021fd79c: .word 0x3fb
L_021fd7a0: .word data_ov032_02202220
.size func_ov032_021fce20, .-func_ov032_021fce20
