.text

/* Exact fallback; see src/overlays/ov035/overlay035_scene_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern Graphics3DResourceOwner_RemoveManager
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov035_02203b98
    .extern data_ov035_02203af8


    .global func_ov035_021fe13c
func_ov035_021fe13c: 
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe198
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x10c
    bl func_02095308
    ldr r1, [r4, #0x100]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_021fe19c
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
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
L_021fe198: .word data_ov035_02203b98
L_021fe19c: .word data_ov035_02203af8
.size func_ov035_021fe13c, .-func_ov035_021fe13c

    .global func_ov035_021fe1a0

func_ov035_021fe1a0: 
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe204
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x10c
    bl func_02095308
    ldr r1, [r4, #0x100]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_021fe208
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
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
L_021fe204: .word data_ov035_02203b98
L_021fe208: .word data_ov035_02203af8
.size func_ov035_021fe1a0, .-func_ov035_021fe1a0

