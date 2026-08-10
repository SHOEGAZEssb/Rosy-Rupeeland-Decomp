.text

/* Exact fallback for func_ov042_021fd66c; see the documented portable C in
 * src/overlays/ov042/overlay042_scene_base.c. */
.extern VecFx32Object_Init
.extern data_020f3058

    .global func_ov042_021fd66c
func_ov042_021fd66c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_021fd6a8
    add r0, r4, #0x1c
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    add r0, r4, #0x2c
    bl VecFx32Object_Init
    mov r1, #0x0
    str r1, [r4, #0x4]
    str r1, [r4, #0x8]
    str r1, [r4, #0xc]
    mov r0, r4
    str r1, [r4, #0x44]
    ldmia sp!, {r4, pc}
.L_021fd6a8: .word data_020f3058
    .size func_ov042_021fd66c, . - func_ov042_021fd66c
