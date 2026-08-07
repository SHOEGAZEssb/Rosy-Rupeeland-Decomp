    .text
/* Exact compiler thunk; see src/overlays/ov010/overlay010_embedded_destroy_thunk.c. */
    .global func_ov010_021fe9b8
func_ov010_021fe9b8:
    ldr ip, L_021fe9c4
    add r0, r0, ip
    b . - 0x17d8
L_021fe9c4: .word 0xffffffdc
    .size func_ov010_021fe9b8, . - func_ov010_021fe9b8
