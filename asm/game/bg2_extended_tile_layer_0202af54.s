; Matching retail form; see src/game/bg2_extended_tile_layer.c.
.text
.extern Heap_Free
.extern data_020deb1c
.extern func_02029e44

    .global func_0202af54
    .type func_0202af54, @function
func_0202af54: ; 0x0202af54
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_0202af80
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl func_02029e44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202af80: .word data_020deb1c
    .size func_0202af54, . - func_0202af54

