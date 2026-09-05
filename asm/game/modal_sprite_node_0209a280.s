.text
.extern func_0209a280
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.

.global func_0209a280
func_0209a280:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    streq r1, [r0, #0x4]
    moveq r0, r2
    ldmeqia sp!, {r3, pc}
    mov r0, r2
    bl func_0209a280
    ldmia sp!, {r3, pc}
.size func_0209a280, . - func_0209a280
