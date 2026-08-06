; Matching retail form; see src/game/actor_height_attachment_update.c.
.text
.extern data_0210568c
.extern data_02105690
    .global func_02039c3c
    .type func_02039c3c, @function
func_02039c3c: ; 0x02039c3c
    ldr r0, .L_02039c74
    mov r3, #0x0
    ldrsh ip, [r0, #0x2]
    ldr r2, .L_02039c78
    b .L_02039c64
.L_02039c50:
    ldr r0, [r2, r3, lsl #0x2]
    cmp r1, r0
    moveq r0, #0x1
    bxeq lr
    add r3, r3, #0x1
.L_02039c64:
    cmp r3, ip
    blt .L_02039c50
    mov r0, #0x0
    bx lr
.L_02039c74: .word data_0210568c
.L_02039c78: .word data_02105690
    .size func_02039c3c, . - func_02039c3c
