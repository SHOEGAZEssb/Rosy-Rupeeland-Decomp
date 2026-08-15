.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_controller_lifecycle.c for documented portable C. */

    .extern func_0205940c
    .extern PresentationList_DeleteAll
    .extern func_02071e04
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsResourceSetVariant_Destroy
    .extern data_ov036_022060ec
    .extern gSoundContext
    .extern data_020f4e18
    .extern data_ov036_02205eac

    .global func_ov036_021ff5bc
func_ov036_021ff5bc:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff66c
    mov r4, r0
    ldr r0, L_021ff670
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    ldr r1, L_021ff674
    mov r2, #0x0
    bl func_0205940c
    add r0, r4, #0x108
    bl PresentationList_DeleteAll
    add r0, r4, #0x118
    bl PresentationList_DeleteAll
    add r0, r4, #0x128
    bl PresentationList_DeleteAll
    ldr r0, L_021ff678
    ldr r1, [r4, #0xf0]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r0, L_021ff678
    ldr r1, [r4, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, [r4, #0xe8]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_021ff67c
    add r0, r4, #0x128
    str r1, [r4, #0x128]
    bl PresentationList_DeleteAll
    ldr r1, L_021ff67c
    add r0, r4, #0x118
    str r1, [r4, #0x118]
    bl PresentationList_DeleteAll
    ldr r1, L_021ff67c
    add r0, r4, #0x108
    str r1, [r4, #0x108]
    bl PresentationList_DeleteAll
    add r0, r4, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff66c: .word data_ov036_022060ec
L_021ff670: .word gSoundContext
L_021ff674: .word 0x1ae
L_021ff678: .word data_020f4e18
L_021ff67c: .word data_ov036_02205eac
    .size func_ov036_021ff5bc, .-func_ov036_021ff5bc

