.text
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.

.global func_0209f1ec
func_0209f1ec:
    mov r1, #0x8
    sub ip, r1, #0x1
.L_0209f1f4:
    add r1, r0, ip, lsl #0x2
    ldr r3, [r1, #0x48]
    ldrh r2, [r3, #0x42]
    tst r2, #0x4
    bne .L_0209f224
    ldr r1, [r3, #0xc]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    orrne r1, r2, #0x4
    strneh r1, [r3, #0x42]
.L_0209f224:
    subs ip, ip, #0x1
    bpl .L_0209f1f4
    mov r1, #0x9
    sub ip, r1, #0x1
.L_0209f234:
    add r1, r0, ip, lsl #0x2
    ldr r3, [r1, #0x68]
    ldrh r2, [r3, #0x42]
    tst r2, #0x4
    bne .L_0209f264
    ldr r1, [r3, #0xc]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    orrne r1, r2, #0x4
    strneh r1, [r3, #0x42]
.L_0209f264:
    subs ip, ip, #0x1
    bpl .L_0209f234
    bx lr
.size func_0209f1ec, . - func_0209f1ec
