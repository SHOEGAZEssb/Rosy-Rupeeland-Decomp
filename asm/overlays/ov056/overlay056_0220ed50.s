.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220ed50
func_ov056_0220ed50:
    ldr r3, [r0, #0x848]
    cmp r3, #0x0
    moveq r3, #0x1
    movne r3, #0x0
    cmp r3, #0x0
    bne .L_0220ed94
    ldr r0, [r0, #0x840]
    b .L_0220ed8c
.L_0220ed70:
    ldr ip, [r0, #0x8]
    ldr r3, [ip, #0x8]
    cmp r1, r3
    ldreq r3, [ip, #0xc]
    cmpeq r2, r3
    bxeq lr
    ldr r0, [r0, #0x0]
.L_0220ed8c:
    cmp r0, #0x0
    bne .L_0220ed70
.L_0220ed94:
    mov r0, #0x0
    bx lr
.size func_ov056_0220ed50, . - func_ov056_0220ed50
