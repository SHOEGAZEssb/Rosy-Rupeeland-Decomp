.text

/* Exact fallback; see src/overlays/ov035/overlay035_burst_model_spawn.c for documented portable C. */

    .extern Heap_Alloc
    .extern func_ov035_02201584
    .extern Presentation_SetPosition
    .extern PresentationScalar_TransitionTo
    .extern PresentationList_Append
    .extern Sound_Play
    .extern data_ov035_02203d70
    .extern gSoundContext
    .extern gHeapContext

    .global func_ov035_02201d10
func_ov035_02201d10:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r5, r3
    mov r8, r0
    mov r6, r2
    ldr r1, L_02201de8
    ldr r3, L_02201dec
    mov r0, #0xc8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_02201d50
    ldr r1, [r8, #0xfc]
    ldr r2, [sp, #0x28]
    bl func_ov035_02201584
    mov r4, r0
L_02201d50:
    mov r0, r4
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl Presentation_SetPosition
    ldr r2, [sp, #0x18]
    add r0, r4, #0xc
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    ldr r2, [sp, #0x1c]
    add r0, r4, #0x1c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    ldr r2, [sp, #0x20]
    add r0, r4, #0x2c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    ldr r2, [sp, #0x24]
    add r0, r4, #0x5c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    mov r0, #0x10
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    add r0, r8, #0x11c
    mov r1, r4
    bl PresentationList_Append
    ldr r0, [r8, #0x164]
    ldr r1, L_02201df0
    cmp r0, #0x2b
    movlt r0, #0x1
    strlt r0, [r4, #0x88]
    ldr r0, L_02201df4
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_Play
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_02201de8: .word data_ov035_02203d70
L_02201dec: .word gHeapContext
L_02201df0: .word 0x1cb
L_02201df4: .word gSoundContext
    .size func_ov035_02201d10, .-func_ov035_02201d10

