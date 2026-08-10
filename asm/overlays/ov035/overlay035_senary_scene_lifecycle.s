.text

/* Exact fallback; see src/overlays/ov035/overlay035_senary_scene_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_02071e04
    .extern Graphics3DResourceOwner_RemoveManager
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov035_02203bd0
    .extern data_020f4e18
    .extern data_ov035_02203af8

    .global func_ov035_02201bd8
func_ov035_02201bd8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02201c64
    add r0, r4, #0x10c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x11c
    bl func_02095308
    ldr r0, L_02201c68
    ldr r1, [r4, #0xfc]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r0, L_02201c68
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, [r4, #0xf4]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_02201c6c
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl func_02095308
    ldr r1, L_02201c6c
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
    add r0, r4, #0xe8
    bl func_020720d4
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201c64: .word data_ov035_02203bd0
L_02201c68: .word data_020f4e18
L_02201c6c: .word data_ov035_02203af8
    .size func_ov035_02201bd8, .-func_ov035_02201bd8

    .global func_ov035_02201c70
func_ov035_02201c70:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02201d04
    add r0, r4, #0x10c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x11c
    bl func_02095308
    ldr r0, L_02201d08
    ldr r1, [r4, #0xfc]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r0, L_02201d08
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, [r4, #0xf4]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_02201d0c
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl func_02095308
    ldr r1, L_02201d0c
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
    add r0, r4, #0xe8
    bl func_020720d4
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201d04: .word data_ov035_02203bd0
L_02201d08: .word data_020f4e18
L_02201d0c: .word data_ov035_02203af8
    .size func_ov035_02201c70, .-func_ov035_02201c70

