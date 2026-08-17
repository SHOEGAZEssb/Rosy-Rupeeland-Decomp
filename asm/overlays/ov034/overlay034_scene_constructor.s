.text

/* Exact fallback; see src/overlays/ov034/overlay034_scene_constructor.c for documented portable C. */

    .extern Graphics3DSceneState_Init
    .extern Graphics3DLightSet_Init
    .extern Heap_Alloc
    .extern func_ov034_021fd544
    .extern GraphicsArchive_AcquireOwlvResource
    .extern func_ov034_021fce04
    .extern Presentation_SetPosition
    .extern func_02094bf0
    .extern PresentationScalar_TransitionTo
    .extern func_ov034_021fda34
    .extern func_ov034_021fda3c
    .extern func_ov034_021fda4c
    .extern Sound_PlayDirectSequence
    .extern Sound_LoadGroup
    .extern func_ov034_021fdac0
    .extern data_ov034_021ff1b0
    .extern gHeapContext
    .extern data_020f4e18
    .extern gSystemState
    .extern data_ov034_021fe848
    .extern data_ov034_021fe770
    .extern data_ov034_021ff1b8
    .extern gSoundContext
    .extern data_ov034_021fe748

    .global func_ov034_021fdae8
func_ov034_021fdae8: 
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    add r0, r10, #0x48
    bl Graphics3DSceneState_Init
    add r0, r10, #0xdc
    bl Graphics3DSceneState_Init
    add r0, r10, #0x170
    bl Graphics3DLightSet_Init
    mov r0, #0xc8
    ldr r1, L_021fdd70
    mov r2, #0x4
    ldr r3, L_021fdd74
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdb2c
    bl func_ov034_021fd544
L_021fdb2c:
    ldr r1, L_021fdd78
    str r0, [r10, #0x0]
    ldr r0, [r1, #0x0]
    ldr r1, L_021fdd7c
    bl GraphicsArchive_AcquireOwlvResource
    mov r2, #0x0
    str r0, [r10, #0x4]
    mov r1, r2
L_021fdb4c:
    add r0, r10, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x8]
    cmp r2, #0x10
    blt L_021fdb4c
    ldr r0, L_021fdd80
    mov r7, #0x0
    ldrb r3, [r0, #0x5f]
    mov r4, #0x18
    ldr r1, L_021fdd84
    cmp r3, #0x6
    movge r3, #0x5
    ldr r2, L_021fdd88
    mov r0, #0x180
    ldr r2, [r2, r3, lsl #0x2]
    mla r8, r3, r0, r1
    str r2, [r10, #0x1b0]
    mov r6, #0x1e
    mov r5, r7
    mov r11, r4
    b L_021fdc94
L_021fdba0:
    ldr r1, L_021fdd8c
    ldr r3, L_021fdd74
    mov r0, #0xa8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdbec
    mul r1, r7, r4
    add ip, r8, r1
    ldrsh r2, [r8, r1]
    ldr r1, [r10, #0x4]
    ldrsh r9, [ip, #0x6]
    ldrsh r3, [ip, #0x2]
    ldrsh ip, [ip, #0x4]
    orr r3, r3, ip, lsl #0x5
    orr r3, r3, r9, lsl #0xa
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_ov034_021fce04
L_021fdbec:
    mla r9, r7, r11, r8
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x8]
    ldr r1, [r9, #0x8]
    ldr r2, [r9, #0xc]
    mov r3, #0x0
    bl Presentation_SetPosition
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, #0x0
    mov r2, #0x10000
    mov r3, #0x1000
    bl func_02094bf0
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r2, [r9, #0x10]
    mov r1, #0x1
    add r0, r0, #0xc
    bl PresentationScalar_TransitionTo
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    ldr r2, [r9, #0x14]
    mov r1, #0x4
    add r0, r0, #0x1c
    bl PresentationScalar_TransitionTo
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, #0x1
    add r0, r0, #0x4c
    mov r2, #0x0
    bl PresentationScalar_TransitionTo
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    mov r1, #0x1
    add r0, r0, #0x5c
    mov r2, #0x0
    bl PresentationScalar_TransitionTo
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0x8]
    add r7, r7, #0x1
    str r6, [r0, #0x7c]
    str r5, [r0, #0x80]
L_021fdc94:
    ldr r0, [r10, #0x1b0]
    cmp r7, r0
    blt L_021fdba0
    mov r1, #0x0
    ldr r3, L_021fdd90
    mov r2, r1
    add r0, r10, #0x48
    str r1, [r10, #0x48]
    bl func_ov034_021fda34
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x48
    bl func_ov034_021fda3c
    mov r1, #0x0
    ldr r3, L_021fdd94
    mov r2, r1
    add r0, r10, #0xdc
    str r1, [r10, #0xdc]
    bl func_ov034_021fda34
    mov r1, #0x0
    add r0, r10, #0xdc
    mov r2, r1
    mov r3, r1
    bl func_ov034_021fda3c
    mov r3, #0x1000
    rsb r3, r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r10, #0x170
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov034_021fda4c
    ldr r0, L_021fdd98
    mov r1, #0xba
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
    ldr r0, L_021fdd98
    ldr r1, L_021fdd9c
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    mvn r0, #0x0
    str r0, [r10, #0x1b4]
    mov r0, r10
    ldr r1, L_021fdda0
    mov r3, #0x1
    ldmia r1, {r1, r2}
    bl func_ov034_021fdac0
    mov r0, r10
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdd70: .word data_ov034_021ff1b0
L_021fdd74: .word gHeapContext
L_021fdd78: .word data_020f4e18
L_021fdd7c: .word 0x5002
L_021fdd80: .word gSystemState
L_021fdd84: .word data_ov034_021fe848
L_021fdd88: .word data_ov034_021fe770
L_021fdd8c: .word data_ov034_021ff1b8
L_021fdd90: .word 0x299a
L_021fdd94: .word 0x2ccd
L_021fdd98: .word gSoundContext
L_021fdd9c: .word 0x1cd
L_021fdda0: .word data_ov034_021fe748
.size func_ov034_021fdae8, .-func_ov034_021fdae8

