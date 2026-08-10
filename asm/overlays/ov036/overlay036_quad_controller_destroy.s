.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_02071e04
    .extern Graphics3DResourceOwner_RemoveManager
    .extern Graphics3DLightSet_Destroy
    .extern func_020720d4
    .extern data_ov036_02205fb8
    .extern data_020f4e18
    .extern data_ov036_02205eac

    .global func_ov036_02202500
func_ov036_02202500:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02202584
    add r0, r4, #0xfc
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x10c
    bl func_02095308
    ldr r0, L_02202588
    ldr r1, [r4, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, [r4, #0xf8]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    add r0, r4, #0x11c
    bl Graphics3DLightSet_Destroy
    ldr r1, L_0220258c
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
    ldr r1, L_0220258c
    add r0, r4, #0xfc
    str r1, [r4, #0xfc]
    bl func_02095308
    add r0, r4, #0xe8
    bl func_020720d4
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02202584: .word data_ov036_02205fb8
L_02202588: .word data_020f4e18
L_0220258c: .word data_ov036_02205eac
    .size func_ov036_02202500, .-func_ov036_02202500

