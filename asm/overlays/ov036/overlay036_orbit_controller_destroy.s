.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_controller_destroy.c for documented portable C. */

    .extern func_02095308
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsResourceSetVariant_Destroy
    .extern data_ov036_02206060
    .extern data_ov036_02205eac

    .global func_ov036_022008e8
func_ov036_022008e8:
    stmdb sp!, {r4, lr}
    ldr r1, L_02200944
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x11c
    bl func_02095308
    ldr r1, [r4, #0x100]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_02200948
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl func_02095308
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
L_02200944: .word data_ov036_02206060
L_02200948: .word data_ov036_02205eac
    .size func_ov036_022008e8, .-func_ov036_022008e8

