; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern data_020de98c
.extern func_02003e20
.extern func_02029e64
.extern gHeapContext

    .global func_0202a74c
    .type func_0202a74c, @function
func_0202a74c: ; 0x0202a74c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_0202a768
    bl func_02029e64
.L_0202a768:
    ldr r1, .L_0202a784
    ldr r3, .L_0202a788
    mov r0, r4, lsl #0x1
    mov r2, #0x4
    bl func_02003e20
    stmia r5, {r0, r4}
    ldmia sp!, {r3, r4, r5, pc}
.L_0202a784: .word data_020de98c
.L_0202a788: .word gHeapContext
    .size func_0202a74c, . - func_0202a74c

