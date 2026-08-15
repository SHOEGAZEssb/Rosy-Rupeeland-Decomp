.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_activation.c for documented portable C. */

    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update
    .extern func_02091c7c
    .extern func_ov036_02201580
    .extern func_ov036_02201470

    .global func_ov036_02201a78
func_ov036_02201a78:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x148
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r5, #0x158
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r5, #0x118]
    bl GraphicsAnimationInstanceManager_Update
    add r0, r5, #0x168
    mov r1, #0x0
    bl func_02091c7c
    mov r4, #0x0
L_02201aa8:
    mov r0, r5
    add r1, r4, #0x18
    bl func_ov036_02201580
    add r4, r4, #0x1
    cmp r4, #0x4
    blt L_02201aa8
    mov r0, r5
    bl func_ov036_02201470
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_02201a78, .-func_ov036_02201a78

    .global func_ov036_02201acc

