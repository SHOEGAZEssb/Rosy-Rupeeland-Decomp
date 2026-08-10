.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_controller_lifecycle.c for documented portable C. */

    .extern func_02095360
    .extern GraphicsAnimationInstanceManager_Update

    .global func_ov036_021ff74c
func_ov036_021ff74c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x108
    bl func_02095360
    add r0, r4, #0x118
    bl func_02095360
    add r0, r4, #0x128
    bl func_02095360
    ldr r0, [r4, #0xe8]
    bl GraphicsAnimationInstanceManager_Update
    ldmia sp!, {r4, pc}
    .size func_ov036_021ff74c, .-func_ov036_021ff74c

