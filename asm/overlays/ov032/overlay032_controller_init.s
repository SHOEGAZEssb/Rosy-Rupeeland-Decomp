.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */

    .global func_ov032_0220142c
func_ov032_0220142c:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    mov r1, #0x1
    str r1, [r0, #0xc]
    mov r1, #0x100000
    str r1, [r0, #0x18]
    bx lr
.size func_ov032_0220142c, .-func_ov032_0220142c

