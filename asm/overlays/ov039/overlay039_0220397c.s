.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov049_0220c3d8
    .global func_ov039_0220397c
func_ov039_0220397c:
    ldr ip, L_0220398c
    add r0, r0, #0x64
    add r0, r0, #0x400
    bx ip
L_0220398c: .word func_ov049_0220c3d8
    .size func_ov039_0220397c, .-func_ov039_0220397c

