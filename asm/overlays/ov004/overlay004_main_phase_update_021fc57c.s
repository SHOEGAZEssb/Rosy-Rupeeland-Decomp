    .text
    .extern func_02091c7c
    .extern func_020befec
    .extern func_020afce8
    .extern func_02092260
    .extern func_02091bd0
    .extern func_020afca0
    .extern func_02091cf0
    .extern func_02091bac
    .extern SpritePresentation_Show
    .extern PresentationScalar_TransitionTo
    .extern Presentation_InterpolateQuadraticPulse
    .extern func_02070958
    .extern func_02074dc8
    .extern func_020594a4
    .extern func_ov004_021fb6e4
    .extern func_ov004_021fc24c
    .extern func_ov004_021fbf10
    .extern data_020f4e14
    .extern gDebugFont
    .extern gSoundContext
    .extern data_ov004_021fcd50
    .global func_ov004_021fc57c
func_ov004_021fc57c: ; 0x021fc57c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021fc8a8
L_021fc598: ; jump table
    b L_021fc5ac ; case 0
    b L_021fc630 ; case 1
    b L_021fc75c ; case 2
    b L_021fc7d8 ; case 3
    b L_021fc85c ; case 4
L_021fc5ac:
    add r0, r4, #0x114
    mov r1, #0x0
    bl func_02091c7c
    ldr r0, [r4, #0x128]
    mov r1, #0x3
    mov r0, r0, lsl #0x1
    bl func_020befec
    ldr r1, [r4, #0x12c]
    cmp r1, r0
    ble L_021fc8a8
    mov r1, #0x4
    ldr r0, L_021fc8c4
    sub r2, r1, #0x14
    bl func_020afce8
    mov r1, #0x4
    ldr r0, L_021fc8c8
    sub r2, r1, #0x14
    bl func_020afce8
    ldr r0, [r4, #0x48]
    ldr r1, L_021fc8cc
    orr r0, r0, #0x4
    str r0, [r4, #0x48]
    ldr r2, [r4, #0x4c]
    mov r0, r4
    orr r2, r2, #0x4
    str r2, [r4, #0x4c]
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fc8a8
L_021fc630:
    add r0, r4, #0x114
    mov r1, #0x0
    bl func_02091c7c
    add r0, r4, #0x130
    mov r1, #0x0
    bl func_02091c7c
    mov r1, #0x4
    add r0, r4, #0x130
    sub r2, r1, #0x14
    mov r3, #0x0
    bl func_02091bd0
    mov r1, r0
    ldr r0, L_021fc8c4
    bl func_020afca0
    add r0, r4, #0x130
    mov r1, #0x4
    sub r2, r1, #0x14
    mov r3, #0x0
    bl func_02091bd0
    mov r1, r0
    ldr r0, L_021fc8c8
    bl func_020afca0
    add r0, r4, #0x114
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fc8a8
    add r0, r4, #0x130
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fc8a8
    ldr r0, L_021fc8c4
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    mov ip, #0x78
    ldr r2, L_021fc8d0
    add r0, r4, #0x114
    mov r1, #0x1
    mov r3, #0x1000
    str ip, [sp, #0x0]
    bl func_02091bac
    mov r0, #0x78
    str r0, [sp, #0x0]
    ldr r2, L_021fc8d4
    add r0, r4, #0x130
    mov r1, #0x1
    mov r3, #0x400
    bl func_02091bac
    ldr r0, [r4, #0x68]
    bl SpritePresentation_Show
    ldr r0, [r4, #0x68]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r2, #0x68000
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x68]
    mov r0, #0x3c
    str r0, [r1, #0x7c]
    mov r2, #0x0
    str r2, [r1, #0x80]
    ldr r1, [r4, #0x60]
    mov r3, #0x1
    str r3, [r1, #0x20]
    add r0, r4, #0x88
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r0, #0x3c
    str r0, [r4, #0xe8]
    mov r1, #0x0
    str r1, [r4, #0xec]
    ldr r0, [r4, #0x4]
    add r0, r0, #0x1
    stmib r4, {r0, r1}
    b L_021fc8a8
L_021fc75c:
    add r0, r4, #0x114
    mov r1, #0x0
    bl func_02091c7c
    add r0, r4, #0x130
    mov r1, #0x0
    bl func_02091c7c
    ldr r0, [r4, #0x68]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, #0x6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, #0x114
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fc8a8
    add r0, r4, #0x130
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fc8a8
    ldr r1, L_021fc8d8
    mov r0, r4
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fc8a8
L_021fc7d8:
    ldr r1, [r4, #0x8]
    add r3, r1, #0x1
    str r3, [r4, #0x8]
    cmp r3, #0x3c
    ble L_021fc80c
    ldr r1, [r4, #0x158]
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fc8a8
L_021fc80c:
    mov r0, #0x100
    mov r1, #0x200
    mov r2, #0x3c
    bl Presentation_InterpolateQuadraticPulse
    mov r1, r0
    ldr r0, [r4, #0x58]
    mov r2, r1
    mov r3, r1
    bl func_02070958
    ldr r1, [r4, #0x60]
    ldr r0, L_021fc8dc
    ldr r1, [r1, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    ldr r1, [r4, #0x64]
    ldr r0, L_021fc8e0
    ldr r1, [r1, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    b L_021fc8a8
L_021fc85c:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x5a
    ble L_021fc8a8
    ldr r0, [r4, #0x158]
    ldr r1, L_021fc8e4
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020594a4
    cmp r0, #0x0
    bne L_021fc8a8
    ldr r1, L_021fc8e8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
L_021fc8a8:
    mov r0, r4
    bl func_ov004_021fc24c
    mov r0, r4
    bl func_ov004_021fbf10
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fc8c4: .word 0x4000050
L_021fc8c8: .word 0x4001050
L_021fc8cc: .word 0x7b81
L_021fc8d0: .word 0x119a
L_021fc8d4: .word 0x466
L_021fc8d8: .word 0x7b82
L_021fc8dc: .word data_020f4e14
L_021fc8e0: .word gDebugFont
L_021fc8e4: .word gSoundContext
L_021fc8e8: .word data_ov004_021fcd50
    .size func_ov004_021fc57c, .-func_ov004_021fc57c
