.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */



    .global func_ov025_021fd3f4
func_ov025_021fd3f4:
    ldr r3, [r0, #0x17c]
    mov r2, #0x0
    b L_021fd410
L_021fd400:
    add r1, r0, r3, lsl #0x1
    add r1, r1, #0x100
    strh r2, [r1, #0x80]
    add r3, r3, #0x1
L_021fd410:
    cmp r3, #0x10
    blt L_021fd400
    ldr r1, [r0, #0x17c]
    mov r2, #0x0
    sub ip, r1, #0x1
    b L_021fd444
L_021fd428:
    add r1, r0, ip, lsl #0x1
    add r1, r1, #0x100
    ldrh r3, [r1, #0x80]
    cmp r3, #0x20
    bxne lr
    strh r2, [r1, #0x80]
    sub ip, ip, #0x1
L_021fd444:
    cmp ip, #0x0
    bge L_021fd428
    bx lr
.size func_ov025_021fd3f4, .-func_ov025_021fd3f4

