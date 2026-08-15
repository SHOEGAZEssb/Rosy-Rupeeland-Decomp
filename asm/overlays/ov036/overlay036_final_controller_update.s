.text

/* Exact fallback; see src/overlays/ov036/overlay036_final_controller_update.c for documented portable C. */

    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update

    .global func_ov036_0220429c
func_ov036_0220429c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xf0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0xf4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add r0, r4, #0xfc
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r4, #0xe8]
    bl GraphicsAnimationInstanceManager_Update
    ldmia sp!, {r4, pc}
    .size func_ov036_0220429c, .-func_ov036_0220429c

