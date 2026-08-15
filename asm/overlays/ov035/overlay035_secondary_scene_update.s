.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_scene_lifecycle.c for documented portable C. */

    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update


    .global func_ov035_021ff164
func_ov035_021ff164: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10c
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x11c
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r4, #0x12c
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r4, #0xf8]
    bl GraphicsAnimationInstanceManager_Update
    ldmia sp!, {r4, pc}
.size func_ov035_021ff164, .-func_ov035_021ff164

