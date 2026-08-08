.text

/* Exact fallback; see src/overlays/ov036/overlay036_final_controller_lifecycle.c for documented portable C. */

    .extern func_02095308
    .extern func_02077688
    .extern func_02071e04
    .extern func_020720d4
    .extern Heap_Free
    .extern data_ov036_02205f48
    .extern data_020f4e18
    .extern data_ov036_02205eac

    .global func_ov036_022041e4
func_ov036_022041e4:
    stmdb sp!, {r4, lr}
    ldr r1, L_02204290
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xf0]
    cmp r0, #0x0
    beq L_0220420c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0220420c:
    ldr r0, [r4, #0xf4]
    cmp r0, #0x0
    beq L_02204224
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02204224:
    add r0, r4, #0xfc
    bl func_02095308
    add r0, r4, #0x10c
    bl func_02095308
    ldr r1, [r4, #0xe8]
    ldr r0, [r1, #0x0]
    bl func_02077688
    ldr r0, L_02204294
    ldr r1, [r4, #0xec]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r1, L_02204298
    add r0, r4, #0x10c
    str r1, [r4, #0x10c]
    bl func_02095308
    ldr r1, L_02204298
    add r0, r4, #0xfc
    str r1, [r4, #0xfc]
    bl func_02095308
    add r0, r4, #0xdc
    bl func_020720d4
    add r0, r4, #0xcc
    bl func_020720d4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02204290: .word data_ov036_02205f48
L_02204294: .word data_020f4e18
L_02204298: .word data_ov036_02205eac
    .size func_ov036_022041e4, .-func_ov036_022041e4

