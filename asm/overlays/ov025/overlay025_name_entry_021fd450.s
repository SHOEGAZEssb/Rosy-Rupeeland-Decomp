.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */



    .global func_ov025_021fd450
func_ov025_021fd450:
    mov r2, #0x0
    mov r3, r2
    ldr ip, [r0, #0x17c]
    b L_021fd478
L_021fd460:
    add r1, r0, r3, lsl #0x1
    add r1, r1, #0x100
    ldrh r1, [r1, #0x80]
    add r3, r3, #0x1
    cmp r1, #0x20
    addne r2, r2, #0x1
L_021fd478:
    cmp r3, ip
    blt L_021fd460
    mov r0, r2
    bx lr
.size func_ov025_021fd450, .-func_ov025_021fd450

