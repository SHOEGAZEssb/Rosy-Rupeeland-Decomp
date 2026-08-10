.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect.c for documented portable C. */

    .extern GraphicsAnimationInstance_Destroy
    .extern func_02095308
    .extern func_ov036_021fcf30
    .extern Heap_Free
    .extern data_ov036_02205f80
    .extern data_ov036_02205eac

    .global func_ov036_021fe370
func_ov036_021fe370:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe3b8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq L_021fe390
    bl GraphicsAnimationInstance_Destroy
L_021fe390:
    ldr r1, L_021fe3bc
    add r0, r4, #0x9c
    str r1, [r4, #0x9c]
    bl func_02095308
    mov r0, r4
    bl func_ov036_021fcf30
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe3b8: .word data_ov036_02205f80
L_021fe3bc: .word data_ov036_02205eac
    .size func_ov036_021fe370, .-func_ov036_021fe370
