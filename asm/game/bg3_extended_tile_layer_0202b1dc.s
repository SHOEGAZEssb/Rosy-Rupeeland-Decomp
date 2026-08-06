; Matching retail form; see src/game/bg3_extended_tile_layer.c.
.text
.extern Heap_Free
.extern data_020deb1c
.extern func_02029e44

    .global func_0202b1dc
    .type func_0202b1dc, @function
func_0202b1dc: ; 0x0202b1dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202b208
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl func_02029e44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202b208: .word data_020deb1c
    .size func_0202b1dc, . - func_0202b1dc

