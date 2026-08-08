.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_02005058
    .extern __destroy_arr
    .extern func_ov039_021fce5c
    .extern func_ov039_021fd06c
    .global func_ov039_02200f4c
func_ov039_02200f4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x388
    bl func_02005058
    add r0, r4, #0x378
    bl func_02005058
    ldr r3, L_02200f94
    add r0, r4, #0x13c
    mov r1, #0x27
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0x4
    mov r1, #0x27
    mov r2, #0x8
    ldr r3, L_02200f98
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02200f94: .word func_ov039_021fce5c
L_02200f98: .word func_ov039_021fd06c
    .size func_ov039_02200f4c, .-func_ov039_02200f4c

