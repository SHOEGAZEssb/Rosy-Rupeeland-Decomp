; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern data_020de930
.extern func_02005058
.extern func_02029328
.extern func_0202b834
.extern func_0202baa4

    .global func_02029278
    .type func_02029278, @function
func_02029278: ; 0x02029278
    stmdb sp!, {r4, lr}
    ldr r1, .L_020292ac
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02029328
    add r0, r4, #0x60
    bl func_0202b834
    add r0, r4, #0x50
    bl func_02005058
    mov r0, r4
    bl func_0202baa4
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020292ac: .word data_020de930
    .size func_02029278, . - func_02029278

