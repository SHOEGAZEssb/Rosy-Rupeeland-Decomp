.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_controller_lifecycle.c for documented portable C. */

    .extern func_ov036_021fdc1c
    .extern Heap_Free
    .extern func_02095308
    .extern func_02077688
    .extern func_02071e04
    .extern func_02077ac4
    .extern func_020720d4
    .extern data_ov036_02205f9c
    .extern data_020f4e18
    .extern data_ov036_02205eac

    .global func_ov036_02202e58
func_ov036_02202e58:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02202ef8
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x1a0]
    cmp r4, #0x0
    beq L_02202e84
    mov r0, r4
    bl func_ov036_021fdc1c
    mov r0, r4
    bl Heap_Free
L_02202e84:
    add r0, r5, #0x100
    bl func_02095308
    add r0, r5, #0x110
    bl func_02095308
    ldr r1, [r5, #0xf4]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r0, L_02202efc
    ldr r1, [r5, #0x15c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    add r0, r5, #0x160
    bl func_02077ac4
    ldr r1, L_02202f00
    add r0, r5, #0x110
    str r1, [r5, #0x110]
    bl func_02095308
    ldr r1, L_02202f00
    add r0, r5, #0x100
    str r1, [r5, #0x100]
    bl func_02095308
    add r0, r5, #0xe8
    bl func_020720d4
    add r0, r5, #0xdc
    bl func_020720d4
    add r0, r5, #0xcc
    bl func_020720d4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_02202ef8: .word data_ov036_02205f9c
L_02202efc: .word data_020f4e18
L_02202f00: .word data_ov036_02205eac
    .size func_ov036_02202e58, .-func_ov036_02202e58

