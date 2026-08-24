.text

/* Exact fallback; see src/overlays/ov022/overlay022_action_setup.c. */
.extern data_020c9670
.extern GraphicsSpriteState_ApplyRenderConfig
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern TitleRandom_NextBounded
.extern func_ov043_0220b740
.extern func_ov046_0220b77c
.extern genrand_int32


    .global func_ov022_021fe9e8
func_ov022_021fe9e8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, [r7, #0xa0]
    add r1, r7, #0x90
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, [r7, #0x358]
    mov r6, r1, lsl #0x1
    bl func_ov043_0220b740 ; func_ov044_0220b740, func_ov045_0220b740, func_ov046_0220b740, func_ov047_0220b740, func_ov048_0220b740, func_ov049_0220b740
    ldr r1, [r7, #0x364]
    mov r3, r6, lsl #0x1
    ldrsh r5, [r1, #0x6]
    ldr r2, L_021feac4
    mov r1, #0xc
    ldrsh r2, [r2, r3]
    add r3, r5, r0
    ldr r0, [r7, #0x358]
    smulbb r2, r2, r1
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    add r5, r3, r1, asr #0xc
    bl func_ov046_0220b77c
    add r1, r6, #0x1
    mov r2, r1, lsl #0x1
    ldr r3, [r7, #0x364]
    ldr r1, L_021feac4
    ldrsh r3, [r3, #0x8]
    ldrsh r2, [r1, r2]
    mov r1, #0xc
    add r3, r3, r0
    smulbb r2, r2, r1
    add r0, r7, #0x390
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    add r6, r3, r1, asr #0xc
    mov r1, #0x4
    bl TitleRandom_NextBounded
    mov r2, r5
    mov r3, r6
    mov r1, r0
    mov r0, r4
    mov r4, #0x0
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r4, #0x100
    str r4, [sp, #0x8]
    bl GraphicsSpriteState_ApplyRenderConfig
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021feac4: .word data_020c9670
.size func_ov022_021fe9e8, .-func_ov022_021fe9e8

