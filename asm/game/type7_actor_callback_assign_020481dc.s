; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.global func_020481dc
.type func_020481dc, @function

func_020481dc: ; 0x020481dc
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x208]
    str r1, [r0, #0x20c]
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x44]
    strh r1, [r0, #0x48]
    strh r3, [r0, #0x4a]
    add sp, sp, #0x10
    bx lr

.size func_020481dc, . - func_020481dc

