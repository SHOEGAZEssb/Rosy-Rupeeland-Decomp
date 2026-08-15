.text

/* Exact fallback; see src/overlays/ov035/overlay035_main_state.c for documented portable C. */

    .extern func_02059278
    .extern func_02091b98
    .extern func_02091c7c
    .extern func_ov035_021fe20c
    .extern func_02091dac
    .extern func_020956fc
    .extern func_02091bd0
    .extern Sound_Play
    .extern PresentationScalar_TransitionBy
    .extern PresentationScalar_TransitionTo
    .extern func_ov035_021fd25c
    .extern func_0205929c
    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update
    .extern gSoundContext


    .global func_ov035_021fe2f8
func_ov035_021fe2f8: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xa0]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b L_021fe5b0
L_021fe310: ; jump table
    b L_021fe32c ; case 0
    b L_021fe368 ; case 1
    b L_021fe3e0 ; case 2
    b L_021fe460 ; case 3
    b L_021fe4d8 ; case 4
    b L_021fe564 ; case 5
    b L_021fe598 ; case 6
L_021fe32c:
    ldr r0, L_021fe5c8
    mov r1, #0xb4
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    add r0, r4, #0xa4
    mov r1, #0x6e
    bl func_02091b98
    ldr r0, [r4, #0x108]
    mov r1, #0x40
    ldr r0, [r0, #0x9c]
    strh r1, [r0, #0x52]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_021fe368:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe3a8
    add r0, r4, #0xa4
    mov r1, #0x6e
    bl func_02091b98
    ldr r0, [r4, #0x108]
    mov r1, #0x80
    ldr r0, [r0, #0x9c]
    strh r1, [r0, #0x52]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021fe5b0
L_021fe3a8:
    add r0, r4, #0x11c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe5b0
    ldr r1, [r4, #0x138]
    mov r0, r4
    bl func_ov035_021fe20c
    add r0, r4, #0x138
    bl func_02091dac
    add r0, r4, #0x11c
    mov r1, #0x4
    bl func_02091b98
    b L_021fe5b0
L_021fe3e0:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe428
    add r0, r4, #0xa4
    mov r1, #0xb4
    bl func_02091b98
    ldr r0, [r4, #0x108]
    mov r1, #0x100
    ldr r0, [r0, #0x9c]
    strh r1, [r0, #0x52]
    ldr r0, [r4, #0xd8]
    bl func_020956fc
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021fe5b0
L_021fe428:
    add r0, r4, #0x11c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe5b0
    ldr r1, [r4, #0x138]
    mov r0, r4
    bl func_ov035_021fe20c
    add r0, r4, #0x138
    bl func_02091dac
    add r0, r4, #0x11c
    mov r1, #0x2
    bl func_02091b98
    b L_021fe5b0
L_021fe460:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe4a0
    add r0, r4, #0xa4
    mov r1, #0x96
    bl func_02091b98
    ldr r0, [r4, #0x108]
    mov r1, #0x200
    ldr r0, [r0, #0x9c]
    strh r1, [r0, #0x52]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021fe5b0
L_021fe4a0:
    mov r1, #0x1
    mov r2, r1
    add r0, r4, #0xa4
    mov r3, #0x1f
    bl func_02091bd0
    ldr r1, [r4, #0xd8]
    ldr r1, [r1, #0x9c]
    strb r0, [r1, #0x5b]
    ldr r1, [r4, #0x138]
    mov r0, r4
    bl func_ov035_021fe20c
    add r0, r4, #0x138
    bl func_02091dac
    b L_021fe5b0
L_021fe4d8:
    add r0, r4, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe5b0
    ldr r0, L_021fe5c8
    mov r1, #0x1b4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0x108]
    mov r2, #0xc00
    add r0, r0, #0x1c
    rsb r2, r2, #0x0
    mov r1, #0x5
    bl PresentationScalar_TransitionBy
    mov r1, #0x0
    ldr r2, [r4, #0x108]
    mov r0, #0x28
    str r0, [r2, #0x7c]
    str r1, [r2, #0x80]
    ldr r0, [r4, #0x104]
    sub r2, r1, #0xe00
    add r0, r0, #0x1c
    mov r1, #0x5
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x104]
    mov r0, #0x28
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021fe5b0
L_021fe564:
    ldr r0, [r4, #0x108]
    bl func_ov035_021fd25c
    cmp r0, #0x0
    beq L_021fe5b0
    ldr r0, L_021fe5c8
    mov r1, #0xb4
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021fe5b0
L_021fe598:
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r4, #0x100]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fe5b0:
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r4, #0x100]
    bl GraphicsAnimationInstanceManager_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe5c8: .word gSoundContext
.size func_ov035_021fe2f8, .-func_ov035_021fe2f8

