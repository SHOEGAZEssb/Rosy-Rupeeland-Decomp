.text

/* Exact fallback; see src/overlays/ov027/overlay027_geometry_commands.c. */



    .global func_ov027_021fd150
func_ov027_021fd150:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, L_021fd17c
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
L_021fd17c: .word 0x400048c
.size func_ov027_021fd150, .-func_ov027_021fd150

