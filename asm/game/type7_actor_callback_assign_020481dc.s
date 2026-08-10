; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.global Type7Actor_SetCallbackPair
.type Type7Actor_SetCallbackPair, @function

Type7Actor_SetCallbackPair: ; 0x020481dc
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

.size Type7Actor_SetCallbackPair, . - Type7Actor_SetCallbackPair

