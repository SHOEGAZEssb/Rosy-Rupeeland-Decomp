; Matching retail form; see src/game/actor_motion_follow_actor.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_021052fc
.extern func_02004fe0
.extern func_02005058
.extern func_020050c8
.global ActorMotion_UpdateFromBoundActor
ActorMotion_UpdateFromBoundActor: ; 0x02009c20
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_02004fe0
    ldr r0, L_02009d08
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne L_02009c90
    ldr r1, [r4, #0x4]
    add r0, r4, #0x8
    ldr r2, [r1, #0x1c]
    add r1, r4, #0x34
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    str r2, [r4, #0xc]
    ldr r2, [r4, #0x4]
    ldr r2, [r2, #0x20]
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    str r2, [r4, #0x10]
    bl func_020050c8
    b L_02009cf4
L_02009c90:
    cmp r0, #0x1
    ldr r1, [r4, #0x4]
    add r0, r4, #0x8
    bne L_02009cd8
    ldr r2, [r1, #0x1c]
    add r1, r4, #0x34
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    str r2, [r4, #0xc]
    ldr r2, [r4, #0x4]
    ldr r3, [r2, #0x20]
    ldr r2, [r2, #0x24]
    sub r2, r3, r2
    add r2, r2, r2, lsr #0x1f
    mov r2, r2, asr #0x1
    str r2, [r4, #0x10]
    bl func_020050c8
    b L_02009cf4
L_02009cd8:
    ldr r2, [r1, #0x1c]
    add r1, r4, #0x34
    str r2, [r4, #0xc]
    ldr r2, [r4, #0x4]
    ldr r2, [r2, #0x20]
    str r2, [r4, #0x10]
    bl func_020050c8
L_02009cf4:
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_02009d08: .word data_021052fc

    .size ActorMotion_UpdateFromBoundActor, .-ActorMotion_UpdateFromBoundActor

    .global ActorMotion_GetPosition
ActorMotion_GetPosition: ; 0x02009d0c
    add r0, r0, #0x8
    bx lr
    .size ActorMotion_GetPosition, .-ActorMotion_GetPosition

