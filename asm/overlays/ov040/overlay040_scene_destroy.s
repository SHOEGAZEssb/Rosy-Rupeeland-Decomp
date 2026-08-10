.text
/* Exact fallback; see overlay040_scene_lifecycle.c for portable C. */
    .extern data_ov040_022042a8
    .extern GraphicsResourceSet_ReleaseHandles
    .extern GraphicsResourceSet_Destroy
    .extern __destroy_arr
    .extern VecFx32Object_Destroy
    .extern func_ov040_021fd740
    .extern func_02099fb0
    .global func_ov040_021fd744
func_ov040_021fd744:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x37c
    ldr r1, L_021fd84c
    add r0, r0, #0x1800
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_ReleaseHandles
    add r0, r4, #0x37c
    add r0, r0, #0x1800
    bl GraphicsResourceSet_Destroy
    add r0, r4, #0x27c
    ldr r3, L_021fd850
    add r0, r0, #0x1400
    mov r1, #0x50
    mov r2, #0x10
    bl __destroy_arr
    add r0, r4, #0x3dc
    add r0, r0, #0x800
    mov r1, #0x50
    mov r2, #0x10
    ldr r3, L_021fd850
    bl __destroy_arr
    add r0, r4, #0x354
    add r0, r0, #0x800
    mov r1, #0x2
    mov r2, #0x10
    ldr r3, L_021fd850
    bl __destroy_arr
    add r0, r4, #0xc4
    add r0, r0, #0x800
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, L_021fd850
    bl __destroy_arr
    add r0, r4, #0x94
    add r0, r0, #0x800
    mov r1, #0x4
    mov r2, #0xc
    ldr r3, L_021fd854
    bl __destroy_arr
    add r0, r4, #0x64
    add r0, r0, #0x800
    mov r1, #0x4
    mov r2, #0xc
    ldr r3, L_021fd854
    bl __destroy_arr
    add r0, r4, #0x660
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, L_021fd850
    bl __destroy_arr
    add r0, r4, #0x84
    mov r1, #0x1e
    mov r2, #0x10
    ldr r3, L_021fd850
    bl __destroy_arr
    add r0, r4, #0x74
    bl VecFx32Object_Destroy
    add r0, r4, #0x5c
    bl VecFx32Object_Destroy
    add r0, r4, #0x4c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd84c: .word data_ov040_022042a8
L_021fd850: .word VecFx32Object_Destroy
L_021fd854: .word func_ov040_021fd740
    .size func_ov040_021fd744, .-func_ov040_021fd744
