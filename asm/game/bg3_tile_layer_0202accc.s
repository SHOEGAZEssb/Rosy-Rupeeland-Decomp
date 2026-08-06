; Matching retail form; see src/game/bg3_tile_layer.c.
.text
.extern Heap_Free
.extern data_020deb1c
.extern func_02029e44

    .global func_0202accc
    .type func_0202accc, @function
func_0202accc: ; 0x0202accc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202acf8
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl func_02029e44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202acf8: .word data_020deb1c
    .size func_0202accc, . - func_0202accc

