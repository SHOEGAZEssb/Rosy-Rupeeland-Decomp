.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern Heap_Alloc
.extern Scene_GetEmbedded10
.extern TouchRegionManager_Add
.extern TouchRegionManager_Allocate
.extern __construct_array
.extern data_020f4e18
.extern data_ov059_02211ba8
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateState
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov059_02210554
.extern func_ov059_022105a8
.extern func_ov059_0221067c
.extern func_ov059_02210950
.extern gDebugFont
.extern gHeapContext

.global func_ov059_022106fc
func_ov059_022106fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r8, r0
    mov r5, r3
    ldr r4, .L_02210938
    mov r7, r1
    mov r6, r2
    ldr r3, .L_0221093c
    add r0, r8, #0x4
    mov r1, #0x2
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r1, #0x4
    ldr r0, .L_02210940
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r8, #0x4
    mov r2, #0x3
    mov r3, #0x1
    bl func_02071ee0
    ldr r0, .L_02210944
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r8, #0x0]
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, #0x3
    bl TouchRegionManager_Allocate
    mov r0, #0x10
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, sp, #0x4
    mov r2, r1
    mov r3, #0x30
    bl func_ov059_02210950
    ldr r1, .L_02210948
    ldr r3, .L_0221094c
    mov r0, #0x28
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_022107b8
    add r2, sp, #0x4
    mov r1, #0x64
    bl func_ov059_02210554
    mov r4, r0
.L_022107b8:
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, r4
    bl TouchRegionManager_Add
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldmia r8, {r0, r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    mov r1, r0
    ldrh r3, [r1, #0x24]
    mov r0, r4
    mov r2, #0xa
    bic r3, r3, #0x8
    strh r3, [r1, #0x24]
    mov r3, #0xb
    bl func_ov059_022105a8
    mov r0, r4
    sub r1, r6, #0x18
    sub r2, r5, #0x30
    bl func_ov059_0221067c
    ldr r1, .L_02210948
    ldr r3, .L_0221094c
    mov r0, #0x28
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_02210834
    add r2, sp, #0x4
    mov r1, #0x65
    bl func_ov059_02210554
    mov r4, r0
.L_02210834:
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, r4
    bl TouchRegionManager_Add
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldmia r8, {r0, r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    mov r1, r0
    ldrh r3, [r1, #0x24]
    mov r0, r4
    mov r2, #0xc
    bic r3, r3, #0x8
    strh r3, [r1, #0x24]
    mov r3, #0xd
    bl func_ov059_022105a8
    mov r0, r4
    sub r1, r6, #0x18
    add r2, r5, #0x10
    bl func_ov059_0221067c
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r1, .L_02210940
    add r0, r8, #0x10
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    mov r3, #0x1
    bl func_02071ee0
    ldr r1, .L_02210948
    ldr r3, .L_0221094c
    mov r0, #0x28
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_022108d0
    add r2, sp, #0x4
    mov r1, #0x66
    bl func_ov059_02210554
    mov r4, r0
.L_022108d0:
    mov r0, r7
    bl Scene_GetEmbedded10
    mov r1, r4
    bl TouchRegionManager_Add
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldr r0, [r8, #0x0]
    ldr r1, [r8, #0x10]
    ldr r2, [r8, #0x14]
    ldr r3, [r8, #0x18]
    bl GraphicsSpriteGroup_CreateState
    mov r1, r0
    ldrh r3, [r1, #0x24]
    mov r0, r4
    mov r2, #0x3a
    bic r3, r3, #0x8
    strh r3, [r1, #0x24]
    mov r3, r2
    bl func_ov059_022105a8
    mov r0, r4
    sub r1, r6, #0x18
    add r2, r5, #0x30
    bl func_ov059_0221067c
    mov r0, r8
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02210938: .word AnimationResourceState_Destroy
.L_0221093c: .word AnimationResourceState_InitEmbedded
.L_02210940: .word data_020f4e18
.L_02210944: .word gDebugFont
.L_02210948: .word data_ov059_02211ba8
.L_0221094c: .word gHeapContext
.size func_ov059_022106fc, . - func_ov059_022106fc
