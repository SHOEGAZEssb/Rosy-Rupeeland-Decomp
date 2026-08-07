    .text
/* Exact compiler thunk; see src/overlays/ov010/overlay010_embedded_delete_thunk.c. */
    .global func_ov010_021fe9a8
func_ov010_021fe9a8:
    ldr ip, L_021fe9b4
    add r0, r0, ip
    b . - 0x16fc
L_021fe9b4: .word 0xffffffdc
    .size func_ov010_021fe9a8, . - func_ov010_021fe9a8
