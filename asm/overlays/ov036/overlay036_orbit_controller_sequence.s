.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_controller_sequence.c for documented portable C. */

    .extern Sound_PlayDirectSequence
    .extern func_02091b98
    .extern func_02091d24
    .extern func_02091c7c
    .extern func_ov036_022009b8
    .extern func_02091dac
    .extern func_020956fc
    .extern func_ov036_02200b38
    .extern func_ov036_021fd28c
    .extern func_02095710
    .extern TitleInterpolatedValue_Configure
    .extern Sound_Play
    .extern Presentation_SetPosition
    .extern PresentationScalar_TransitionTo
    .extern GraphicsAnimationInstance_SetAnimation
    .extern Presentation_SetScript
    .extern Presentation_IsScriptComplete
    .extern Sound_StopDirectSequence
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update
    .extern gSoundContext
    .extern data_ov036_02205c2c
    .extern data_ov036_02205cac
    .extern data_ov036_02204d7c
    .extern data_ov036_02204d6c
    .extern data_ov036_02204e24

    .global func_ov036_02200bb0
func_ov036_02200bb0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x24
    mov r8, r0
    ldr r0, [r8, #0xa0]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b L_02200f80
L_02200bcc: ; jump table
    b L_02200bf4 ; case 0
    b L_02200c3c ; case 1
    b L_02200c84 ; case 2
    b L_02200cdc ; case 3
    b L_02200d24 ; case 4
    b L_02200d9c ; case 5
    b L_02200ea4 ; case 6
    b L_02200f14 ; case 7
    b L_02200f34 ; case 8
    b L_02200f68 ; case 9
L_02200bf4:
    ldr r0, L_02200f9c
    mov r1, #0xaf
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    add r0, r8, #0xa4
    mov r1, #0x8
    bl func_02091b98
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    str r0, [sp, #0x0]
    add r0, r8, #0x12c
    mov r3, #0x4
    bl func_02091d24
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
L_02200c3c:
    add r0, r8, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200f80
    ldr r1, [r8, #0x12c]
    ldr r2, L_02200fa0
    mov r0, r8
    add r1, r2, r1, lsl #0x5
    bl func_ov036_022009b8
    add r0, r8, #0x12c
    bl func_02091dac
    ldr r0, [r8, #0x13c]
    cmp r0, #0x0
    ldrne r0, [r8, #0xa0]
    addne r0, r0, #0x1
    strne r0, [r8, #0xa0]
    b L_02200f80
L_02200c84:
    add r0, r8, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200f80
    ldr r0, [r8, #0x104]
    bl func_020956fc
    ldr r1, [r8, #0x104]
    ldr r2, L_02200fa4
    mov r0, r8
    bl func_ov036_02200b38
    mvn r0, #0x0
    mov r1, #0x3
    mov r3, r1
    str r0, [sp, #0x0]
    add r0, r8, #0x12c
    mov r2, #0x1
    bl func_02091d24
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
    b L_02200f80
L_02200cdc:
    ldr r0, [r8, #0x104]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02200f80
    ldr r2, [r8, #0x12c]
    ldr r3, L_02200fa0
    ldr r1, [r8, #0x104]
    mov r0, r8
    add r2, r3, r2, lsl #0x5
    bl func_ov036_02200b38
    add r0, r8, #0x12c
    bl func_02091dac
    ldr r0, [r8, #0x13c]
    cmp r0, #0x0
    ldrne r0, [r8, #0xa0]
    addne r0, r0, #0x1
    strne r0, [r8, #0xa0]
    b L_02200f80
L_02200d24:
    ldr r0, [r8, #0x104]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02200f80
    ldr r0, [r8, #0x104]
    bl func_02095710
    ldr r0, [r8, #0x108]
    bl func_020956fc
    ldr r0, [r8, #0xd8]
    bl func_020956fc
    mov r1, #0x1
    mov r0, #0x1e
    str r0, [sp, #0x0]
    add r0, r8, #0xa4
    mov r2, r1
    mov r3, #0x1f
    bl TitleInterpolatedValue_Configure
    ldr r0, L_02200f9c
    ldr r1, L_02200fa8
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    mov r0, r8
    ldr r1, [r8, #0x108]
    ldr r2, L_02200fa0
    bl func_ov036_02200b38
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
    b L_02200f80
L_02200d9c:
    ldr r0, [r8, #0x108]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02200e88
    ldr r0, L_02200fac
    ldr r4, L_02200fb0
    add r6, sp, #0x14
    ldmia r0, {r0, r1, r2, r3}
    stmia r6, {r0, r1, r2, r3}
    ldmia r4, {r0, r1, r2, r3}
    add r5, sp, #0x4
    stmia r5, {r0, r1, r2, r3}
    mov r7, #0x1
    mov r4, #0x2
    mov r10, #0x3c
    mov r9, #0x0
L_02200ddc:
    ldr r2, [r8, #0x108]
    add r0, r8, r7, lsl #0x2
    ldr r3, [r2, #0x30]
    ldr r0, [r0, #0x108]
    ldr r1, [r2, #0x10]
    ldr r2, [r2, #0x20]
    sub r3, r3, r7
    bl Presentation_SetPosition
    add r2, r8, r7, lsl #0x2
    ldr r0, [r2, #0x108]
    add r1, r5, r7, lsl #0x2
    ldr r3, [r1, #-0x4]
    ldr r1, [r0, #0x9c]
    add r0, r6, r7, lsl #0x2
    strb r3, [r1, #0x5b]
    ldr r3, [r2, #0x108]
    ldr r2, [r0, #-0x4]
    mov r1, r4
    add r0, r3, #0xc
    bl PresentationScalar_TransitionTo
    add r1, r8, r7, lsl #0x2
    ldr r0, [r1, #0x108]
    str r10, [r0, #0x7c]
    str r9, [r0, #0x80]
    ldr r0, [r1, #0x108]
    bl func_020956fc
    add r7, r7, #0x1
    cmp r7, #0x5
    blt L_02200ddc
    mov r5, #0x0
    mov r4, #0x1
L_02200e58:
    add r0, r8, r5, lsl #0x2
    ldr r0, [r0, #0x108]
    mov r1, r4
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    add r5, r5, #0x1
    cmp r5, #0x5
    blt L_02200e58
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
    b L_02200f80
L_02200e88:
    add r0, r8, #0xa4
    mov r1, #0x1
    bl func_02091c7c
    ldr r1, [r8, #0xd8]
    ldr r1, [r1, #0x9c]
    strb r0, [r1, #0x5b]
    b L_02200f80
L_02200ea4:
    ldr r0, [r8, #0x10c]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_02200f80
    mov r4, #0x0
    ldr r6, L_02200fb4
    mov r7, r4
    mov r5, #0x1
L_02200ec4:
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0x108]
    mov r1, r7
    ldr r0, [r0, #0x9c]
    bl GraphicsAnimationInstance_SetAnimation
    add r0, r8, r4, lsl #0x2
    ldr r0, [r0, #0x108]
    mov r1, r6
    mov r2, r5
    bl Presentation_SetScript
    add r4, r4, #0x1
    cmp r4, #0x5
    blt L_02200ec4
    add r0, r8, #0xa4
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
    b L_02200f80
L_02200f14:
    add r0, r8, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldrne r0, [r8, #0xa0]
    addne r0, r0, #0x1
    strne r0, [r8, #0xa0]
    b L_02200f80
L_02200f34:
    ldr r0, [r8, #0x108]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02200f80
    ldr r0, L_02200f9c
    mov r1, #0xaf
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl Sound_StopDirectSequence
    ldr r0, [r8, #0xa0]
    add r0, r0, #0x1
    str r0, [r8, #0xa0]
    b L_02200f80
L_02200f68:
    add r0, r8, #0x11c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r8, #0x100]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    b L_02200f94
L_02200f80:
    add r0, r8, #0x11c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r8, #0x100]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
L_02200f94:
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_02200f9c: .word gSoundContext
L_02200fa0: .word data_ov036_02205c2c
L_02200fa4: .word data_ov036_02205cac
L_02200fa8: .word 0x1af
L_02200fac: .word data_ov036_02204d7c
L_02200fb0: .word data_ov036_02204d6c
L_02200fb4: .word data_ov036_02204e24
    .size func_ov036_02200bb0, .-func_ov036_02200bb0

