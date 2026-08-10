; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern data_020d6180
.extern data_021052fc
.extern DisplayController_GetSubScreenVerticalOffset
.extern func_02005030
.extern func_02005058
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201f724
.extern func_0201fa44

.global func_0201fb84
    .type func_0201fb84, @function
func_0201fb84: ; 0x0201fb84
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, .L_0201fc24
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, sp, #0x0
    bl func_02005030
    bl DisplayController_GetSubScreenVerticalOffset
    ldr r2, [sp, #0x8]
    add r1, sp, #0x0
    sub r0, r2, r0, lsl #0xc
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x8]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x8]
    blx r2
    ldrsh r1, [r4, #0x12]
    mvn r0, #0x0
    cmp r1, r0
    ldrne r0, [r4, #0x8]
    ldrne r0, [r0, #0x4]
    strneb r1, [r0, #0x3a]
    ldrsh r0, [r4, #0x10]
    sub r0, r0, #0x1
    strh r0, [r4, #0x10]
    ldrsh r0, [r4, #0x10]
    cmp r0, #0x0
    add r0, sp, #0x0
    bge .L_0201fc14
    bl func_02005058
    mov r0, #0x1
    b .L_0201fc1c
.L_0201fc14:
    bl func_02005058
    mov r0, #0x0
.L_0201fc1c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_0201fc24: .word data_021052fc
    .size func_0201fb84, .-func_0201fb84

