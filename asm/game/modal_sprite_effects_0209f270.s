.text
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.
.extern func_0209a2ac

.global func_0209f270
func_0209f270:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r5, r0
    bl func_0209a2ac
    mov r0, #0x8
    sub r7, r0, #0x1
    mov r6, #0x1
.L_0209f294:
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0x48]
    mov r1, r4
    mov r2, r6
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_0209f294
    mov r0, #0x9
    sub r7, r0, #0x1
    mov r6, #0x1
.L_0209f2bc:
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0x68]
    mov r1, r4
    mov r2, r6
    bl func_0209a2ac
    subs r7, r7, #0x1
    bpl .L_0209f2bc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_0209f270, . - func_0209f270
