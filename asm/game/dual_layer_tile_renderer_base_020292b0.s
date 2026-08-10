; Matching retail form; see src/game/dual_layer_tile_renderer_base.c.
.text
.extern Heap_Free
.extern data_020de930
.extern VecFx32Object_Destroy
.extern func_02029328
.extern func_0202b834
.extern func_0202baa4

    .global func_020292b0
    .type func_020292b0, @function
func_020292b0: ; 0x020292b0
    stmdb sp!, {r4, lr}
    ldr r1, .L_020292ec
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02029328
    add r0, r4, #0x60
    bl func_0202b834
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0202baa4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020292ec: .word data_020de930
    .size func_020292b0, . - func_020292b0

