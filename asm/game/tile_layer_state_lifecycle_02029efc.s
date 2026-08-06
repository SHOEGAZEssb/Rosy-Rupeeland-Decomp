; Matching retail form; see src/game/tile_layer_state_lifecycle.c.
.text
.extern Heap_Free
.extern data_020deb1c
.extern func_02029e44

    .global func_02029efc
    .type func_02029efc, @function
func_02029efc: ; 0x02029efc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    ldr r1, .L_02029f28
    add r0, r0, #0x1000
    str r1, [r4, #0x0]
    bl func_02029e44
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02029f28: .word data_020deb1c
    .size func_02029efc, . - func_02029efc

