    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_construct.c. */
    .extern data_020c9670
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_021e9ac0
    .extern data_021e9e1c
    .extern data_ov017_02201414
    .extern data_ov017_02201548
    .extern data_ov017_02201638
    .extern data_ov017_02201684
    .extern data_ov017_0220168c
    .extern data_ov017_02201694
    .extern data_ov017_0220169c
    .extern data_ov017_022016a4
    .extern data_ov017_022016ac
    .extern data_ov017_022016e0
    .extern func_0205974c
    .extern func_02062a50
    .extern func_02062b0c
    .extern func_0206492c
    .extern func_02064e7c
    .extern func_0206fc20
    .extern func_0206fc38
    .extern func_0206fca0
    .extern func_0206fd30
    .extern func_02071ea4
    .extern func_02071ee0
    .extern func_020720c0
    .extern func_020720e8
    .extern func_02073ffc
    .extern func_020742cc
    .extern func_02075358
    .extern Graphics3DResourceOwner_Init
    .extern Graphics3DResourceOwner_CreateManager
    .extern Graphics3DResourceOwner_PrepareResources
    .extern Graphics3DLightSet_Init
    .extern Graphics3DSceneState_Init
    .extern Graphics3DRenderObject_Init
    .extern func_020918f4
    .extern func_02091e28
    .extern func_02092364
    .extern func_020923a4
    .extern func_020926d8
    .extern func_02092754
    .extern func_02092798
    .extern func_02092814
    .extern func_02094bbc
    .extern func_020953f4
    .extern func_020954f4
    .extern func_02095508
    .extern func_020957bc
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940
    .extern func_020ae778
    .extern func_020ae7b0
    .extern func_ov017_021fce00
    .extern func_ov017_021fd744
    .extern func_ov017_021fd7f8
    .extern func_ov017_021fe40c
    .extern func_ov017_021fe75c
    .extern func_ov017_021fe9c0
    .extern func_ov017_021fea00
    .extern func_ov017_021fea08
    .extern func_ov017_021fea18
    .extern func_ov017_021fea8c
    .extern func_ov017_021ff150
    .extern func_ov017_021ff58c
    .extern func_ov017_021ff75c
    .extern func_ov017_021ff8a8
    .extern func_ov017_02200064
    .extern genrand_int32
    .extern gHeapContext
    .extern gSoundContext
    .extern Heap_Alloc
    .global func_ov017_021feab4
func_ov017_021feab4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    mov r7, r1
    mov r9, r2
    mov r4, r3
    bl func_02091e28
    ldr r1, L_021ff0e4
    add r0, r10, #0x5c
    str r1, [r10, #0x0]
    bl func_02071ea4
    add r0, r10, #0x68
    bl func_02071ea4
    add r0, r10, #0x74
    bl func_02071ea4
    add r0, r10, #0x80
    bl func_020957bc
    add r0, r10, #0x12c
    bl func_020957bc
    add r0, r10, #0x1d8
    bl func_02092798
    add r0, r10, #0x1fc
    bl func_020926d8
    add r0, r10, #0x248
    bl func_020720c0
    add r0, r10, #0x264
    bl func_ov017_021fd744
    add r0, r10, #0x290
    bl func_ov017_021fd744
    add r0, r10, #0x2d0
    bl Graphics3DLightSet_Init
    add r0, r10, #0x310
    bl Graphics3DSceneState_Init
    add r0, r10, #0x3ac
    bl func_ov017_021ff150
    add r0, r10, #0x3d8
    bl func_ov017_021fe9c0
    add r0, r10, #0x3ec
    bl func_ov017_021fe9c0
    mov r0, #0x0
    str r0, [r10, #0x3fc]
    add r0, r10, #0x4
    add r0, r0, #0x400
    bl func_02092364
    mov r0, #0x0
    str r0, [r10, #0x50]
    bl genrand_int32
    str r0, [r10, #0x3fc]
    ldr r0, [sp, #0x38]
    ldr r1, L_021ff0e8
    mov r3, #0x0
    str r0, [r1, #0xc]
    str r3, [r1, #0x0]
    str r3, [r10, #0x3d4]
    str r3, [r10, #0x3e8]
    str r3, [r10, #0x400]
    ldr r2, L_021ff0ec
    ldr r0, L_021ff0f0
    str r2, [r1, #0x8]
    str r3, [r10, #0x440]
    ldr r0, [r0, #0x0]
    bl func_02075358
    add r0, r10, #0x4
    add r0, r0, #0x400
    bl func_020923a4
    bl func_020ae7b0
    bl func_020ae778
    ldr r0, L_021ff0f4
    ldr r1, L_021ff0f8
    mov r2, #0x4
    ldr r3, L_021ff0fc
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021febe8
    mov r1, #0x1
    mov r2, r1
    bl Graphics3DResourceOwner_Init
L_021febe8:
    str r0, [r10, #0x240]
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r10, #0x244]
    ldr r1, L_021ff100
    add r0, r10, #0x1d8
    bl func_02092814
    mov r0, #0xf
    str r0, [sp, #0x0]
    ldr r1, L_021ff104
    add r0, r10, #0x5c
    ldr r1, [r1, #0x0]
    mov r2, #0xd
    mov r3, #0xe
    bl func_02071ee0
    mov r0, #0x12
    str r0, [sp, #0x0]
    ldr r1, L_021ff104
    add r0, r10, #0x68
    ldr r1, [r1, #0x0]
    mov r2, #0x10
    mov r3, #0x11
    bl func_02071ee0
    mov r0, #0x15
    str r0, [sp, #0x0]
    ldr r1, L_021ff104
    add r0, r10, #0x74
    ldr r1, [r1, #0x0]
    mov r2, #0x13
    mov r3, #0x14
    bl func_02071ee0
    ldr r3, L_021ff108
    ldr r1, L_021ff104
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x248
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r0, [r10, #0x240]
    add r1, r10, #0x248
    bl Graphics3DResourceOwner_PrepareResources
    ldr r1, L_021ff10c
    add r0, r10, #0x1fc
    bl func_02092754
    ldr r1, L_021ff110
    add r0, r10, #0x1fc
    bl func_02092754
    ldr r0, L_021ff0f0
    ldr r0, [r0, #0x0]
    bl func_020742cc
    add r1, r10, #0x5c
    mov r2, #0x1
    str r0, [r10, #0x58]
    bl func_02073ffc
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0x12c
    mov r2, #0x5
    mov r3, #0x2
    bl func_020957f0
    add r0, r10, #0x12c
    mov r1, #0x50
    mov r2, #0xa0
    bl func_02095820
    add r0, r10, #0x12c
    bl func_02095940
    ldr r0, [r10, #0x58]
    add r1, r10, #0x5c
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r10, #0x80
    mov r2, #0x3
    mov r3, #0x2
    bl func_020957f0
    add r0, r10, #0x80
    mov r1, #0xb0
    mov r2, #0xa0
    bl func_02095820
    add r0, r10, #0x80
    bl func_02095940
    ldr r1, L_021ff114
    ldr r3, L_021ff0fc
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fed74
    ldr r0, [r10, #0x58]
    add r1, r10, #0x68
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, r5
    bl func_020953f4
    mov r5, r0
L_021fed74:
    str r5, [r10, #0x260]
    ldr r0, [r5, #0x9c]
    mov r1, #0x2
    strb r1, [r0, #0x3a]
    ldr r0, [r10, #0x260]
    bl func_020954f4
    mov r1, #0x40000
    ldr r0, [r10, #0x260]
    rsb r1, r1, #0x0
    mov r2, #0x60000
    mov r3, #0x0
    bl func_02094bbc
    ldr r0, [r10, #0x260]
    bl func_02095508
    mov r0, #0x1
    str r0, [r10, #0x310]
    add r0, r10, #0x310
    mov r1, #0x0
    mov r2, #0x1800
    mov r3, #0x1000
    bl func_ov017_021fea00
    mov r1, #0x0
    add r0, r10, #0x310
    mov r2, r1
    mov r3, r1
    bl func_ov017_021fea08
    mov r3, #0x1000
    rsb r3, r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r10, #0x2d0
    mov r1, #0x0
    mov r2, #0x1000
    bl func_ov017_021fea18
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r2, #0x800
    str r0, [sp, #0xc]
    add r0, r10, #0x2d0
    mov r1, #0x1
    sub r3, r2, #0x1800
    bl func_ov017_021fea18
    ldr r0, L_021ff118
    bl func_0206fc20
    ldr r0, L_021ff11c
    mov r6, #0x0
    ldr r5, [r0, #0x0]
    mov r0, r4, lsl #0x10
    str r7, [r10, #0x3c0]
    str r4, [r10, #0x3c4]
    str r6, [r10, #0x3c8]
    str r6, [r10, #0x3cc]
    str r6, [r10, #0x3d0]
    mov r11, r0, lsr #0x10
    b L_021fef2c
L_021fee68:
    ldr r1, [r9, r6, lsl #0x2]
    ldr r0, L_021ff118
    mov r1, r1, lsl #0x10
    mov r7, r1, lsr #0x10
    mov r1, r7
    mov r2, #0x1
    bl func_0206fc38
    mov r0, r5
    mov r1, r7
    bl func_0206492c
    mov r4, r0
    ldr r1, [r5, #0x8]
    mov r0, #0x24
    mla r0, r4, r0, r1
    bl func_02062b0c
    mov r1, r4
    mov r4, r0
    mov r0, r5
    mov r2, r11
    bl func_02064e7c
    add r0, r10, #0x3fc
    mov r1, #0x1000
    bl func_020918f4
    ldr r1, L_021ff0e8
    mov r8, r0, lsl #0x4
    ldr r2, [r1, #0xc]
    ldr r1, L_021ff120
    add r0, r10, #0x3fc
    ldr r1, [r1, r2, lsl #0x2]
    sub r1, r1, #0xc
    bl func_020918f4
    mov r3, r8, asr #0x3
    mov r1, r7
    mov r7, r0
    ldr r2, L_021ff124
    str r4, [sp, #0x0]
    mov r8, r3, lsl #0x1
    ldrsh r2, [r2, r8]
    ldr r8, L_021ff124
    mov r0, r10
    add r3, r8, r3, lsl #0x1
    ldrsh r3, [r3, #0x2]
    mul r2, r7, r2
    mul r3, r7, r3
    bl func_ov017_021ff8a8
    ldr r0, [r10, #0x3c8]
    add r6, r6, #0x1
    add r0, r0, r4
    str r0, [r10, #0x3c8]
L_021fef2c:
    ldr r0, [r10, #0x3c0]
    cmp r6, r0
    blt L_021fee68
    mov r0, #0x0
    str r0, [r10, #0x3b8]
    ldr r1, [r10, #0x3c4]
    ldr r0, L_021ff118
    bl func_0206fca0
    str r0, [r10, #0x3bc]
    ldr r0, L_021ff118
    bl func_0206fd30
    str r0, [r10, #0x258]
    cmp r0, #0x0
    moveq r0, #0xc
    streq r0, [r10, #0x2c4]
    moveq r0, #0x10
    streq r0, [r10, #0x2c8]
    moveq r0, #0x8
    beq L_021fefa0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x4
    bl func_02062a50
    and r2, r0, #0x1f
    mov r1, r0, asr #0x5
    mov r0, r0, asr #0xa
    str r2, [r10, #0x2c4]
    and r1, r1, #0x1f
    str r1, [r10, #0x2c8]
    and r0, r0, #0x1f
L_021fefa0:
    str r0, [r10, #0x2cc]
    mov r0, r10
    bl func_ov017_02200064
    mov r0, r10
    bl func_ov017_021ff58c
    mov r0, r10
    bl func_ov017_021ff75c
    ldr r1, L_021ff128
    add r0, r10, #0x264
    bl func_ov017_021fd7f8
    mov r0, #0x400
    str r0, [r10, #0x280]
    str r0, [r10, #0x27c]
    str r0, [r10, #0x278]
    ldr r1, L_021ff12c
    add r0, r10, #0x290
    bl func_ov017_021fd7f8
    ldr r1, L_021ff130
    ldr r3, L_021ff0fc
    mov r0, #0x58
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff008
    ldr r1, [r10, #0x240]
    bl func_ov017_021fe40c
L_021ff008:
    ldr r1, L_021ff134
    str r0, [r10, #0x254]
    ldr r3, L_021ff0fc
    mov r0, #0x68
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff034
    ldr r1, [r10, #0x3c0]
    ldr r2, [r10, #0x3c8]
    bl func_ov017_021fe75c
L_021ff034:
    ldr r1, L_021ff138
    str r0, [r10, #0x25c]
    ldr r3, L_021ff0fc
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff070
    ldr r3, L_021ff13c
    ldr r1, L_021ff104
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldr r2, [r10, #0x240]
    sub r3, r3, #0x1
    bl Graphics3DRenderObject_Init
L_021ff070:
    str r0, [r10, #0x2bc]
    ldr r0, L_021ff140
    ldr r1, L_021ff144
    ldr r3, L_021ff0fc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff0a8
    ldr r1, L_021ff0e8
    ldr r2, L_021ff120
    ldr r1, [r1, #0xc]
    ldr r1, [r2, r1, lsl #0x2]
    add r1, r1, #0xc
    bl func_ov017_021fce00
L_021ff0a8:
    ldr r1, L_021ff148
    str r0, [r10, #0x2c0]
    ldr r0, [r1, #0x0]
    mov r1, #0x82
    bl func_0205974c
    ldr r0, [r10, #0x20]
    ldr r1, L_021ff14c
    orr r0, r0, #0x400
    str r0, [r10, #0x20]
    mov r0, r10
    ldmia r1, {r1, r2}
    bl func_ov017_021fea8c
    mov r0, r10
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ff0e4: .word data_ov017_02201638
L_021ff0e8: .word data_ov017_022016e0
L_021ff0ec: .word 0x708
L_021ff0f0: .word data_020f4e14
L_021ff0f4: .word 0x624
L_021ff0f8: .word data_ov017_02201684
L_021ff0fc: .word gHeapContext
L_021ff100: .word 0x7006
L_021ff104: .word data_020f4e18
L_021ff108: .word 0x601d
L_021ff10c: .word 0x8002
L_021ff110: .word 0x8003
L_021ff114: .word data_ov017_0220168c
L_021ff118: .word data_021e9e1c
L_021ff11c: .word data_021e9ac0
L_021ff120: .word data_ov017_02201414
L_021ff124: .word data_020c9670
L_021ff128: .word 0x5011
L_021ff12c: .word 0x5052
L_021ff130: .word data_ov017_02201694
L_021ff134: .word data_ov017_0220169c
L_021ff138: .word data_ov017_022016a4
L_021ff13c: .word 0x6123
L_021ff140: .word 0xca8
L_021ff144: .word data_ov017_022016ac
L_021ff148: .word gSoundContext
L_021ff14c: .word data_ov017_02201548
    .size func_ov017_021feab4, . - func_ov017_021feab4
