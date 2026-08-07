    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */


.global func_ov022_021fd894
func_ov022_021fd894:
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x4]
    bx lr
.size func_ov022_021fd894, . - func_ov022_021fd894
