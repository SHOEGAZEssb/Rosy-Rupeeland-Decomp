.text
.extern SceneInputBase_Init
.extern TitleCharacterResourceCollection_Init
.extern TitleScreenResourceCollection_Init
.extern AnimationResourceState_InitEmbedded
.extern func_020957bc
.extern func_02092814
.extern func_02092754
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov044_0220c610
.extern func_ov044_0220c19c
.extern func_ov044_0220c2e4
.extern func_ov044_0220c440
.extern Heap_Alloc
.extern func_ov001_021fb6f8
.extern GameWork_ClearFlag
.extern func_ov044_0220be38
.extern data_ov044_0220d31c
.extern data_020f4e18
.extern data_020f4e14
.extern data_ov044_0220d340
.extern gHeapContext
.extern gDebugFont
.extern gGameWork
.extern data_ov044_0220d2e0

    .global func_ov044_0220be60
func_ov044_0220be60:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl SceneInputBase_Init
    ldr r1, .L_0220bfa4
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl TitleCharacterResourceCollection_Init
    add r0, r4, #0x78
    bl TitleScreenResourceCollection_Init
    add r0, r4, #0xc0
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0xd0
    bl func_020957bc
    add r0, r4, #0x17c
    bl func_020957bc
    mov r0, #0x0
    str r0, [r4, #0x23c]
    str r0, [r4, #0x228]
    str r0, [r4, #0x238]
    add r0, r4, #0x54
    ldr r1, .L_0220bfa8
    bl func_02092814
    add r0, r4, #0x54
    ldr r1, .L_0220bfac
    bl func_02092814
    add r0, r4, #0x78
    ldr r1, .L_0220bfb0
    bl func_02092754
    add r0, r4, #0x78
    ldr r1, .L_0220bfb4
    bl func_02092754
    mov r0, #0xf
    str r0, [sp, #0x0]
    add r0, r4, #0xc0
    ldr r1, .L_0220bfb8
    mov r2, #0xd
    ldr r1, [r1, #0x0]
    mov r3, #0xe
    bl AnimationResourceState_ReplaceResources
    ldr r0, .L_0220bfbc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xbc]
    mov r0, r4
    bl func_ov044_0220c610
    mov r0, r4
    bl func_ov044_0220c19c
    mov r0, r4
    bl func_ov044_0220c2e4
    mov r0, #0x0
    str r0, [r4, #0x230]
    mov r0, #0x1
    str r0, [r4, #0x234]
    mov r0, r4
    bl func_ov044_0220c440
    mov r0, #0x48
    ldr r1, .L_0220bfc0
    mov r2, #0x4
    ldr r3, .L_0220bfc4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220bf68
    ldr r1, .L_0220bfc8
    ldr r1, [r1, #0x0]
    bl func_ov001_021fb6f8
.L_0220bf68:
    ldr r1, .L_0220bfcc
    str r0, [r4, #0x22c]
    ldr r0, [r1, #0x0]
    mov r1, #0x3b0
    bl GameWork_ClearFlag
    ldr r0, [r4, #0x20]
    ldr r1, .L_0220bfd0
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov044_0220be38
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0220bfa4: .word data_ov044_0220d31c
.L_0220bfa8: .word 0x7001
.L_0220bfac: .word 0x7005
.L_0220bfb0: .word 0x801b
.L_0220bfb4: .word 0x801c
.L_0220bfb8: .word data_020f4e18
.L_0220bfbc: .word data_020f4e14
.L_0220bfc0: .word data_ov044_0220d340
.L_0220bfc4: .word gHeapContext
.L_0220bfc8: .word gDebugFont
.L_0220bfcc: .word gGameWork
.L_0220bfd0: .word data_ov044_0220d2e0
.size func_ov044_0220be60, . - func_ov044_0220be60
