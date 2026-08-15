.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_controller_lifecycle.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsResourceSetVariant_Destroy
    .extern data_ov036_02206028
    .extern data_ov036_02205eac

    .global func_ov036_02201350
func_ov036_02201350:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_022013d4
    add r0, r4, #0x148
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    add r0, r4, #0x158
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x118]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_022013d8
    add r0, r4, #0x158
    str r1, [r4, #0x158]
    bl PresentationList_DeleteAll
    ldr r1, L_022013d8
    add r0, r4, #0x148
    str r1, [r4, #0x148]
    bl PresentationList_DeleteAll
    add r0, r4, #0x10c
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0x100
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xf4
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022013d4: .word data_ov036_02206028
L_022013d8: .word data_ov036_02205eac
    .size func_ov036_02201350, .-func_ov036_02201350

