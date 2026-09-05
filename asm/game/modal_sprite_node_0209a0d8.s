.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern func_0209a00c
.extern func_0209a07c

.global func_0209a0d8
func_0209a0d8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209a07c
    ldr r0, [sp, #0x20]
    ldrb ip, [sp, #0x24]
    str r0, [sp, #0x0]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x4]
    bl func_0209a00c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_0209a0d8, . - func_0209a0d8
