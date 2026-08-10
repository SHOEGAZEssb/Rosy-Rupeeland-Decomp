.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern Graphics3DResourceOwner_RemoveManager
    .extern func_02071e04
    .extern Graphics3DLightSet_Destroy
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov037_021fedd0
    .extern data_ov037_021fedac
    .extern data_020f4e18

    .global func_ov037_021fdbb0
func_ov037_021fdbb0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021fdc4c
    add r0, r4, #0x12c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x13c
    bl func_02095308
    ldr r1, [r4, #0x114]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_021fdc50
    ldr r1, [r4, #0x110]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    add r0, r4, #0x14c
    bl Graphics3DLightSet_Destroy
    ldr r1, L_021fdc54
    add r0, r4, #0x13c
    str r1, [r4, #0x13c]
    bl func_02095308
    ldr r1, L_021fdc54
    add r0, r4, #0x12c
    str r1, [r4, #0x12c]
    bl func_02095308
    add r0, r4, #0x104
    bl func_020720d4
    add r0, r4, #0xf8
    bl func_020720d4
    add r0, r4, #0xec
    bl func_020720d4
    add r0, r4, #0xe0
    bl func_020720d4
    add r0, r4, #0xd4
    bl func_020720d4
    add r0, r4, #0xc8
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdc4c: .word data_ov037_021fedd0
L_021fdc50: .word data_020f4e18
L_021fdc54: .word data_ov037_021fedac
    .size func_ov037_021fdbb0, .-func_ov037_021fdbb0

    .global func_ov037_021fdc58
func_ov037_021fdc58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021fdcfc
    add r0, r4, #0x12c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x13c
    bl func_02095308
    ldr r1, [r4, #0x114]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_021fdd00
    ldr r1, [r4, #0x110]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    add r0, r4, #0x14c
    bl Graphics3DLightSet_Destroy
    ldr r1, L_021fdd04
    add r0, r4, #0x13c
    str r1, [r4, #0x13c]
    bl func_02095308
    ldr r1, L_021fdd04
    add r0, r4, #0x12c
    str r1, [r4, #0x12c]
    bl func_02095308
    add r0, r4, #0x104
    bl func_020720d4
    add r0, r4, #0xf8
    bl func_020720d4
    add r0, r4, #0xec
    bl func_020720d4
    add r0, r4, #0xe0
    bl func_020720d4
    add r0, r4, #0xd4
    bl func_020720d4
    add r0, r4, #0xc8
    bl func_020720d4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdcfc: .word data_ov037_021fedd0
L_021fdd00: .word data_020f4e18
L_021fdd04: .word data_ov037_021fedac
    .size func_ov037_021fdc58, .-func_ov037_021fdc58
