.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern Heap_Alloc
.extern __construct_array
.extern data_020f4e18
.extern data_ov055_0220f078
.extern AnimationResourceState_InitEmbedded
.extern AnimationResourceState_Destroy
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.extern func_ov055_0220e400
.extern gHeapContext

.global func_ov055_0220e574
func_ov055_0220e574:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr ip, .L_0220e7ac
    mov r4, r3
    mov r5, r1
    mov r7, r2
    ldr r3, .L_0220e7b0
    mov r6, r0
    str ip, [sp, #0x0]
    mov r1, #0x3
    mov r2, #0xc
    bl __construct_array
    str r5, [r6, #0x24]
    ldr r3, .L_0220e7b4
    str r7, [r6, #0x28]
    mov r0, #0x0
    str r0, [r6, #0x38]
    str r0, [r6, #0x3c]
    str r0, [r6, #0x40]
    ldr r0, .L_0220e7b8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    mov r0, r6
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r1, .L_0220e7bc
    add r0, r6, #0xc
    str r1, [sp, #0x0]
    sub r2, r1, #0x2
    ldr r1, .L_0220e7b8
    mov r3, #0x2240
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r3, .L_0220e7c0
    ldr r1, .L_0220e7b8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r6, #0x18
    sub r3, r3, #0x1
    bl func_02071ee0
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldmia r6, {r1, r2, r3}
    ldr r0, [r6, #0x24]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r6, #0x2c]
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldmia r6, {r1, r2, r3}
    ldr r0, [r6, #0x24]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r6, #0x30]
    ldr r2, [r6, #0x2c]
    mov r1, #0x3
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x2c]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x2c]
    mov r0, #0x54
    strh r0, [r1, #0x2c]
    mov r0, #0x46
    strh r0, [r1, #0x2e]
    ldr r3, [r6, #0x2c]
    mov r2, #0x2
    ldrh r0, [r3, #0x24]
    mov r1, #0x3
    orr r0, r0, #0x2
    strh r0, [r3, #0x24]
    ldr r0, [r6, #0x2c]
    strb r2, [r0, #0x3a]
    ldr r2, [r6, #0x30]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x30]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x30]
    mov r0, #0xac
    strh r0, [r1, #0x2c]
    mov r0, #0x46
    strh r0, [r1, #0x2e]
    ldr r2, [r6, #0x30]
    mov r1, #0x2
    ldrh r0, [r2, #0x24]
    cmp r4, #0x1
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x30]
    strb r1, [r0, #0x3a]
    str r1, [sp, #0x0]
    bgt .L_0220e72c
    ldr r0, [r6, #0x24]
    ldr r1, [r6, #0xc]
    ldr r2, [r6, #0x10]
    ldr r3, [r6, #0x14]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r6, #0x34]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x34]
    mov r0, #0x80
    strh r0, [r1, #0x2c]
    mov r0, #0xe
    strh r0, [r1, #0x2e]
    ldr r2, [r6, #0x34]
    mov r1, #0x2
    b .L_0220e768
.L_0220e72c:
    ldr r0, [r6, #0x28]
    ldr r1, [r6, #0xc]
    ldr r2, [r6, #0x10]
    ldr r3, [r6, #0x14]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r6, #0x34]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r6, #0x34]
    mov r0, #0x80
    strh r0, [r1, #0x2c]
    mov r0, #0x50
    strh r0, [r1, #0x2e]
    ldr r2, [r6, #0x34]
    mov r1, #0x1
.L_0220e768:
    ldrh r0, [r2, #0x24]
    ldr r3, .L_0220e7c4
    orr r0, r0, #0x20
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x34]
    mov r2, #0x4
    strb r1, [r0, #0x3a]
    ldr r1, .L_0220e7c8
    mov r0, #0xc
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220e7a0
    mov r1, r5
    bl func_ov055_0220e400
.L_0220e7a0:
    str r0, [r6, #0x44]
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220e7ac: .word AnimationResourceState_Destroy
.L_0220e7b0: .word AnimationResourceState_InitEmbedded
.L_0220e7b4: .word 0x223b
.L_0220e7b8: .word data_020f4e18
.L_0220e7bc: .word 0x2241
.L_0220e7c0: .word 0x224d
.L_0220e7c4: .word gHeapContext
.L_0220e7c8: .word data_ov055_0220f078
.size func_ov055_0220e574, . - func_ov055_0220e574
