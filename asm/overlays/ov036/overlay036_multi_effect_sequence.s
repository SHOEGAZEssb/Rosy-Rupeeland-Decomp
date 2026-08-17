.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_sequence.c for documented portable C. */

    .extern Sound_PlayDirectSequence
    .extern func_02091b98
    .extern func_02091c7c
    .extern Sound_Play
    .extern func_02091bac
    .extern Presentation_SetScript
    .extern func_02091bd0
    .extern func_ov036_021ff778
    .extern Presentation_InterpolateScalar
    .extern func_ov036_021ff7cc
    .extern func_ov036_021fd28c
    .extern Presentation_IsScriptSuspended
    .extern func_0205940c
    .extern Presentation_IsScriptComplete
    .extern func_0209189c
    .extern Heap_Alloc
    .extern func_ov036_021fd2a4
    .extern Presentation_SetPosition
    .extern func_ov036_021fe968
    .extern TitleRandom_NextBounded
    .extern PresentationScalar_SetImmediate
    .extern PresentationList_Append
    .extern Sound_StopDirectSequence
    .extern func_020594a4
    .extern func_ov036_021ff74c
    .extern gSoundContext
    .extern data_ov036_02204e9c
    .extern data_ov036_02205290
    .extern data_ov036_022057d0
    .extern data_ov036_02206148
    .extern gHeapContext

    .global func_ov036_021ff9d0
func_ov036_021ff9d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b L_021ffecc
L_021ff9ec: ; jump table
    b L_021ffa14 ; case 0
    b L_021ffa40 ; case 1
    b L_021ffad8 ; case 2
    b L_021ffb4c ; case 3
    b L_021ffbd0 ; case 4
    b L_021ffc64 ; case 5
    b L_021ffc94 ; case 6
    b L_021ffdf0 ; case 7
    b L_021ffe4c ; case 8
    b L_021ffec0 ; case 9
L_021ffa14:
    ldr r0, L_021ffee0
    mov r1, #0xae
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    add r0, r4, #0xa4
    mov r1, #0x3c
    bl func_02091b98
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_021ffa40:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021ffaa4
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    mov r0, #0x78
    str r0, [sp, #0x0]
    add r0, r4, #0xa4
    mov r1, #0x1
    mov r2, #0x30
    mov r3, #0x40
    bl func_02091bac
    ldr r0, [r4, #0xd8]
    ldr r1, L_021ffee8
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffaa4:
    add r0, r4, #0xa4
    mov r1, #0x2
    mov r2, #0x3c00
    mov r3, #0x1400
    bl func_02091bd0
    str r0, [r4, #0x14]
    add r0, r4, #0xa4
    mov r1, #0x2
    mov r2, #0x1400
    mov r3, #0x2800
    bl func_02091bd0
    str r0, [r4, #0x18]
    b L_021ffecc
L_021ffad8:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021ffb1c
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    ldr r1, [r4, #0xf8]
    mov r0, r4
    mov r3, r2
    bl func_ov036_021ff778
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffb1c:
    mov r1, #0x1
    ldr r0, [r4, #0xd8]
    mov r2, r1
    mov r3, #0x1f
    bl Presentation_InterpolateScalar
    ldr r1, [r4, #0xd8]
    ldr r1, [r1, #0x9c]
    strb r0, [r1, #0x5b]
    ldr r1, [r4, #0xb4]
    mov r0, r4
    bl func_ov036_021ff7cc
    b L_021ffecc
L_021ffb4c:
    ldr r0, [r4, #0xf8]
    bl func_ov036_021fd28c
    cmp r0, #0x0
    beq L_021ffecc
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r0, [r4, #0xd8]
    mov r2, #0x0
    str r2, [r0, #0x90]
    ldr r0, [r4, #0xf8]
    ldr r1, L_021ffeec
    str r2, [r0, #0xa0]
    ldr r0, [r4, #0x100]
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xfc]
    ldr r1, L_021ffeec
    mov r2, #0x1
    bl Presentation_SetScript
    mov r0, #0x3c
    str r0, [sp, #0x0]
    add r0, r4, #0xa4
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x40
    bl func_02091bac
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffbd0:
    add r0, r4, #0xa4
    mov r1, #0x1
    bl func_02091c7c
    mov r1, r0
    mov r0, r4
    bl func_ov036_021ff7cc
    ldr r0, [r4, #0x100]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ffc30
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205940c
    ldr r0, [r4, #0x100]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xfc]
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffc30:
    ldr r0, [r4, #0xd8]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    bne L_021ffecc
    mov r1, #0x1
    ldr r0, [r4, #0xd8]
    mov r3, r1
    mov r2, #0x1f
    bl Presentation_InterpolateScalar
    ldr r1, [r4, #0xd8]
    ldr r1, [r1, #0x9c]
    strb r0, [r1, #0x5b]
    b L_021ffecc
L_021ffc64:
    ldr r0, [r4, #0x100]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ffecc
    ldr r0, [r4, #0xec]
    ldr r1, L_021ffef0
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffc94:
    ldr r0, [r4, #0xec]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ffecc
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_Play
    mov r7, #0x0
    mvn r5, #0xff
    mov r6, #0x10
    mov r11, #0x1f
L_021ffcc8:
    add r0, r4, #0xc0
    mov r1, r6
    mov r2, r11
    bl func_0209189c
    mov r8, r0
    add r0, r4, #0xc0
    mov r1, #0x0
    mov r2, r8
    bl func_0209189c
    add r1, r8, r8, lsr #0x1f
    mov r1, r1, asr #0x1
    orr r1, r8, r1, lsl #0x5
    orr r0, r1, r0, lsl #0xa
    mov r0, r0, lsl #0x10
    mov r9, r0, lsr #0x10
    ldr r1, L_021ffef4
    ldr r3, L_021ffef8
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq L_021ffd40
    str r9, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r3, r9
    mov r2, #0x1e
    str r1, [sp, #0x8]
    bl func_ov036_021fd2a4
    mov r8, r0
L_021ffd40:
    ldr r10, [r4, #0x100]
    add r0, r4, #0xc0
    ldr r9, [r10, #0x10]
    mov r1, r5
    mov r2, #0x100
    bl func_0209189c
    add r1, r9, r0
    ldr r2, [r10, #0x20]
    ldr r3, [r10, #0x30]
    mov r0, r8
    bl Presentation_SetPosition
    ldr r9, [r8, #0x10]
    add r0, r4, #0xc0
    mov r1, #0x4000
    mov r2, #0x8000
    bl func_0209189c
    mov r2, r0
    mov r1, r9, lsl #0x7
    mov r0, r8
    mov r3, #0x0
    bl func_ov036_021fe968
    add r0, r4, #0xc0
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    mov r1, r0, lsl #0x4
    add r0, r8, #0x5c
    bl PresentationScalar_SetImmediate
    mov r1, r8
    add r0, r4, #0x128
    bl PresentationList_Append
    add r7, r7, #0x1
    cmp r7, #0x10
    blt L_021ffcc8
    ldr r0, [r4, #0xec]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0x100]
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xfc]
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffdf0:
    ldr r0, [r4, #0xec]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ffecc
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0xf8]
    mov r1, #0x2
    str r1, [r0, #0xa0]
    ldr r2, [r4, #0x100]
    mov r1, #0x0
    ldrh r0, [r2, #0x98]
    orr r0, r0, #0x1
    strh r0, [r2, #0x98]
    ldr r0, [r4, #0xec]
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffe4c:
    ldr r0, [r4, #0xec]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_021ffe80
    ldr r0, L_021ffee0
    mov r1, #0xae
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl Sound_StopDirectSequence
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ffecc
L_021ffe80:
    mov r0, r4
    mov r1, #0x100
    bl func_ov036_021ff7cc
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_020594a4
    cmp r0, #0x0
    bne L_021ffecc
    ldr r0, L_021ffee0
    ldr r1, L_021ffee4
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    b L_021ffecc
L_021ffec0:
    bl func_ov036_021ff74c
    mov r0, #0x1
    b L_021ffed8
L_021ffecc:
    mov r0, r4
    bl func_ov036_021ff74c
    mov r0, #0x0
L_021ffed8:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ffee0: .word gSoundContext
L_021ffee4: .word 0x1ae
L_021ffee8: .word data_ov036_02204e9c
L_021ffeec: .word data_ov036_02205290
L_021ffef0: .word data_ov036_022057d0
L_021ffef4: .word data_ov036_02206148
L_021ffef8: .word gHeapContext
    .size func_ov036_021ff9d0, .-func_ov036_021ff9d0

