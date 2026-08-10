.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_base.c. */
.extern data_020f3058
.extern VecFx32Object_Init

    .global func_ov041_021ff1cc
func_ov041_021ff1cc: ; 0x021ff1cc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_021ff208
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
.L_021ff208: .word data_020f3058
    .size func_ov041_021ff1cc, . - func_ov041_021ff1cc

