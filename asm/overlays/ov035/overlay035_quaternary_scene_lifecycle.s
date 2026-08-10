.text

/* Exact fallback; see src/overlays/ov035/overlay035_quaternary_scene_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern Graphics3DResourceOwner_RemoveManager
    .extern func_02071e04
    .extern Graphics3DLightSet_Destroy
    .extern func_020720d4
    .extern Heap_Free
    .extern func_02095360
    .extern func_ov035_021fdd70
    .extern func_020773a8
    .extern data_ov035_02203c78
    .extern data_020f4e18
    .extern data_ov035_02203af8

    .global func_ov035_0220043c
func_ov035_0220043c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_022004c8
    add r0, r4, #0x160
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x170
    bl func_02095308
    ldr r1, [r4, #0x104]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_022004cc
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_022004d0
    add r0, r4, #0x170
    str r1, [r4, #0x170]
    bl func_02095308
    ldr r1, L_022004d0
    add r0, r4, #0x160
    str r1, [r4, #0x160]
    bl func_02095308
    add r0, r4, #0x120
    bl Graphics3DLightSet_Destroy
    add r0, r4, #0xf4
    bl func_020720d4
    add r0, r4, #0xe8
    bl func_020720d4
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022004c8: .word data_ov035_02203c78
L_022004cc: .word data_020f4e18
L_022004d0: .word data_ov035_02203af8
    .size func_ov035_0220043c, .-func_ov035_0220043c

    .global func_ov035_022004d4
func_ov035_022004d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_02200568
    add r0, r4, #0x160
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x170
    bl func_02095308
    ldr r1, [r4, #0x104]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r0, L_0220056c
    ldr r1, [r4, #0x100]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_02200570
    add r0, r4, #0x170
    str r1, [r4, #0x170]
    bl func_02095308
    ldr r1, L_02200570
    add r0, r4, #0x160
    str r1, [r4, #0x160]
    bl func_02095308
    add r0, r4, #0x120
    bl Graphics3DLightSet_Destroy
    add r0, r4, #0xf4
    bl func_020720d4
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
L_02200568: .word data_ov035_02203c78
L_0220056c: .word data_020f4e18
L_02200570: .word data_ov035_02203af8
    .size func_ov035_022004d4, .-func_ov035_022004d4

    .global func_ov035_02200574
func_ov035_02200574:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x160
    bl func_02095360
    add r0, r4, #0x170
    bl func_02095360
    ldr r3, [r4, #0x110]
    add r0, r4, #0xc
    ldr r1, [r3, #0x10]
    ldr r2, [r3, #0x20]
    ldr r3, [r3, #0x30]
    bl func_ov035_021fdd70
    ldr r0, [r4, #0x104]
    bl func_020773a8
    ldmia sp!, {r4, pc}
    .size func_ov035_02200574, .-func_ov035_02200574

