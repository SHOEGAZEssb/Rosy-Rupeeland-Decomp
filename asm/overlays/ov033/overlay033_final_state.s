.text

/* Exact fallback; see src/overlays/ov033/overlay033_final_state.c for documented portable C. */

    .extern func_020791e0
    .extern func_02092e9c
    .extern func_ov033_021fd418
    .extern func_0205929c
    .extern func_02091b98
    .extern func_020939d8
    .extern func_ov033_021fd4cc
    .extern VecFx32Object_Add
    .extern func_02091c7c
    .extern func_0205974c
    .extern func_02059278
    .extern func_02091bac
    .extern func_02091cf0
    .extern func_ov033_021fce04
    .extern GraphicsSpriteGroup_ReplaceStateResources
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern Sound_Play
    .extern Type7Actor_ResetMotionAndCooldown
    .extern func_020597fc
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern data_021f3ecc
    .extern gSoundContext
    .extern data_020c9670

    .global func_ov033_021fd9a0
func_ov033_021fd9a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xd0]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_021fdcc0
L_021fd9b8:
    b L_021fd9d0
    b L_021fd9f8
    b L_021fda6c
    b L_021fdadc
    b L_021fdc08
    b L_021fdcb8
L_021fd9d0:
    ldr r0, L_021fdcd0
    mov r1, #0x1fc
    bl func_020791e0
    mov r1, r0
    ldr r0, [r5, #0xc4]
    mov r2, #0x2
    bl func_02092e9c
    ldr r0, [r5, #0xd0]
    add r0, r0, #0x1
    str r0, [r5, #0xd0]
L_021fd9f8:
    mov r0, r5
    bl func_ov033_021fd418
    cmp r0, #0x0
    beq L_021fda40
    ldr r0, L_021fdcd4
    mov r1, #0x68
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl func_0205929c
    add r0, r5, #0x84
    mov r1, #0xc
    bl func_02091b98
    ldr r0, [r5, #0xc4]
    bl func_020939d8
    ldr r0, [r5, #0xd0]
    add r0, r0, #0x1
    str r0, [r5, #0xd0]
    b L_021fdcc0
L_021fda40:
    mov r0, r5
    mov r1, #0x800
    bl func_ov033_021fd4cc
    mov r0, #0x0
    str r0, [r5, #0x1c]
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x4]
    add r1, r5, #0x14
    add r0, r0, #0x18
    bl VecFx32Object_Add
    b L_021fdcc0
L_021fda6c:
    add r0, r5, #0x84
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fdcc0
    ldr r0, L_021fdcd4
    mov r1, #0x1f4
    ldr r0, [r0, #0x0]
    bl func_0205974c
    ldr r0, L_021fdcd4
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    mov r4, #0x78
    add r0, r5, #0x84
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x800
    str r4, [sp, #0x0]
    bl func_02091bac
    add r0, r5, #0x68
    mov r1, #0x14
    bl func_02091b98
    ldr r0, [r5, #0xd0]
    add r0, r0, #0x1
    str r0, [r5, #0xd0]
    b L_021fdcc0
L_021fdadc:
    add r0, r5, #0x84
    mov r1, #0x1
    bl func_02091c7c
    mov r0, r0, lsl #0x18
    mov r2, r0, lsr #0x10
    mov r1, r2, asr #0x4
    ldr r0, L_021fdcd8
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    str r2, [r5, #0x3c]
    add r0, r5, #0x84
    mov r2, r1, lsl #0x5
    mov r1, r2, asr #0xb
    add r1, r2, r1, lsr #0x14
    mov r1, r1, asr #0xc
    str r1, [r5, #0x40]
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fdbd0
    ldr r0, [r5, #0x48]
    mov r1, #0x0
    bl func_ov033_021fce04
    ldr r0, [r5, #0x48]
    mov r1, #0x8
    bl func_ov033_021fce04
    ldr r0, [r5, #0x4]
    ldr r4, [r0, #0x54]
    ldr r3, [r0, #0x21c]
    mov r1, r4
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    mov r0, r4
    mov r1, #0x9
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x100
    strh r0, [r4, #0x36]
    ldrh r0, [r4, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x10
    strh r0, [r4, #0x24]
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq L_021fdba4
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
L_021fdba4:
    mov r0, #0x1e
    mov r2, #0x0
    str r0, [sp, #0x0]
    add r0, r5, #0x84
    sub r3, r2, #0xa0
    mov r1, #0x5
    bl func_02091bac
    ldr r0, [r5, #0xd0]
    add r0, r0, #0x1
    str r0, [r5, #0xd0]
    b L_021fdcc0
L_021fdbd0:
    add r0, r5, #0x68
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fdcc0
    add r0, r5, #0x68
    mov r1, #0x14
    bl func_02091b98
    ldr r0, L_021fdcd4
    mov r1, #0x1f4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    b L_021fdcc0
L_021fdc08:
    add r0, r5, #0x84
    mov r1, #0x1
    bl func_02091c7c
    sub r0, r0, #0x18
    str r0, [r5, #0x44]
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    beq L_021fdc58
    ldr r0, [r5, #0x4]
    ldr r0, [r0, #0x1c]
    sub r0, r0, #0x18000
    str r0, [r1, #0x1c]
    ldr r1, [r5, #0x4]
    ldr r0, [r5, #0x8]
    ldr r1, [r1, #0x20]
    str r1, [r0, #0x20]
    ldr r1, [r5, #0x4]
    ldr r0, [r5, #0x8]
    ldr r1, [r1, #0x24]
    str r1, [r0, #0x24]
L_021fdc58:
    add r0, r5, #0x84
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fdcc0
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq L_021fdc84
    ldr r1, [r0, #0x268]
    bic r1, r1, #0x40000
    str r1, [r0, #0x268]
    bl Type7Actor_ResetMotionAndCooldown
L_021fdc84:
    ldr r0, L_021fdcd4
    mov r1, #0x1f4
    ldr r0, [r0, #0x0]
    bl func_020597fc
    ldr r0, L_021fdcd4
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x1e
    bl func_0205929c
    ldr r0, [r5, #0xd0]
    add r0, r0, #0x1
    str r0, [r5, #0xd0]
    b L_021fdcc0
L_021fdcb8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_021fdcc0:
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fdcd0: .word data_021f3ecc
L_021fdcd4: .word gSoundContext
L_021fdcd8: .word data_020c9670
.size func_ov033_021fd9a0, .-func_ov033_021fd9a0
