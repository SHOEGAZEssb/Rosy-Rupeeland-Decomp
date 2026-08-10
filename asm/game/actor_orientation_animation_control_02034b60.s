; Matching retail form; see src/game/actor_orientation_animation_control.c.
.text
.extern func_0200b2c0
.extern func_020ae024

    .global func_02034b60
    .type func_02034b60, @function
func_02034b60: ; 0x02034b60
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    cmpeq r2, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r2
    bl func_020ae024
    sub r1, r0, #0x4000
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, #0xc8]
    str r0, [r4, #0xcc]
    mov r0, #0xff
    strb r0, [r4, #0xd5]
    mov r1, #0x0
    ldr r0, [r4, #0xc8]
    mov r2, r1
    add r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0xd
    strb r0, [r4, #0xd4]
    add ip, r4, #0x100
    mov r3, r1
    add r0, r4, #0x38
    strh r1, [ip, #0xea]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
    .size func_02034b60, . - func_02034b60

    .global Actor_SetAttachmentAnimation
