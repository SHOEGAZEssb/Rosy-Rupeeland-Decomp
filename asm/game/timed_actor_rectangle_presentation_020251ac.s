; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern data_020f4e14
.extern gGamePhaseRuntime
.extern ActorMotionAreaFollower_GetPosition
.extern GraphicsSpriteCanvas_FillRect
.extern func_020befec

    .global func_020251ac
    .type func_020251ac, @function
func_020251ac: ; 0x020251ac
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r7, r0
    ldr r0, [r7, #0x10]
    sub r0, r0, #0x1
    str r0, [r7, #0x10]
    cmp r0, #0x0
    movle r0, #0x1
    ble .L_020252f0
    ldr r0, .L_020252f8
    ldr r5, [r7, #0x8]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r2, [r7, #0x8]
    mov r4, r0
    ldr r3, [r4, #0x4]
    ldrsh r1, [r2, #0x6e]
    ldrsh r0, [r2, #0x6a]
    ldr r6, [r5, #0x1c]
    mov r2, r3, asr #0xc
    sub r0, r1, r0
    rsb r0, r0, r0, lsl #0x3
    mov r1, #0xa
    rsb r6, r2, r6, asr #0xc
    bl func_020befec
    ldr r2, [r5, #0x24]
    mvn r1, #0x3f
    ldr r5, [r5, #0x20]
    mov r3, r2, asr #0xc
    ldr r2, [r4, #0x8]
    rsb r3, r3, r5, asr #0xc
    sub r2, r3, r2, asr #0xc
    cmp r6, r1
    sub r5, r2, r0
    ble .L_020252ec
    cmp r6, #0x140
    bge .L_020252ec
    sub r0, r1, #0x40
    cmp r5, r0
    ble .L_020252ec
    cmp r5, #0x140
    bge .L_020252ec
    ldrsh r0, [r7, #0xc]
    mov r1, #0xc8
    bl func_020befec
    mov r4, r0
    ldrsh r0, [r7, #0xe]
    mov r1, #0xc8
    bl func_020befec
    add r1, r0, r0, lsr #0x1f
    sub r6, r6, r1, asr #0x1
    add r3, r5, #0x3
    add r2, r6, r0
    str r3, [sp, #0x0]
    mov r1, #0xe
    str r1, [sp, #0x4]
    ldr r0, .L_020252fc
    add r3, r2, #0x1
    ldr r0, [r0, #0x0]
    sub r1, r6, #0x1
    sub r2, r5, #0x1
    bl GraphicsSpriteCanvas_FillRect
    add r0, r5, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r0, .L_020252fc
    add r3, r6, r4
    ldr r0, [r0, #0x0]
    mov r1, r6
    mov r2, r5
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, .L_020252f8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r1, [r0, #0xb8]
    orr r1, r1, #0x30
    str r1, [r0, #0xb8]
.L_020252ec:
    mov r0, #0x0
.L_020252f0:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020252f8: .word gGamePhaseRuntime
.L_020252fc: .word data_020f4e14
    .size func_020251ac, . - func_020251ac
