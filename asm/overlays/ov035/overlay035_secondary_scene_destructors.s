.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_scene_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_02077688
    .extern func_02071e04
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov035_02203d04
    .extern data_ov035_02203af8
    .extern data_020f4e18


    .global func_ov035_021ff01c
func_ov035_021ff01c: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021ff0b0
    add r0, r4, #0x10c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x11c
    bl func_02095308
    add r0, r4, #0x12c
    bl func_02095308
    ldr r1, [r4, #0xf8]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r0, L_021ff0b4
    ldr r1, [r4, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_021ff0b8
    add r0, r4, #0x12c
    str r1, [r4, #0x12c]
    bl func_02095308
    ldr r1, L_021ff0b8
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl func_02095308
    ldr r1, L_021ff0b8
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
L_021ff0b0: .word data_ov035_02203d04
L_021ff0b4: .word data_020f4e18
L_021ff0b8: .word data_ov035_02203af8
.size func_ov035_021ff01c, .-func_ov035_021ff01c

    .global func_ov035_021ff0bc

func_ov035_021ff0bc: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_021ff158
    add r0, r4, #0x10c
    str r1, [r4, #0x0]
    bl func_02095308
    add r0, r4, #0x11c
    bl func_02095308
    add r0, r4, #0x12c
    bl func_02095308
    ldr r1, [r4, #0xf8]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r0, L_021ff15c
    ldr r1, [r4, #0xf4]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_021ff160
    add r0, r4, #0x12c
    str r1, [r4, #0x12c]
    bl func_02095308
    ldr r1, L_021ff160
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl func_02095308
    ldr r1, L_021ff160
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
L_021ff158: .word data_ov035_02203d04
L_021ff15c: .word data_020f4e18
L_021ff160: .word data_ov035_02203af8
.size func_ov035_021ff0bc, .-func_ov035_021ff0bc

