; Matching retail form; see src/game/actor_derived_type1_debug_render.c.
.text
.extern DebugText_Printf
.extern data_020df294
.extern data_020df4ac
.extern data_020df4b8
.extern func_02033b38
.extern func_02034464
.extern gDebugFont

    .global func_020389ec
    .type func_020389ec, @function
func_020389ec: ; 0x020389ec
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r5, r0
    mov r4, r1
    bl func_02033b38
    ldr r0, .L_02038a9c
    ldr r1, .L_02038aa0
    str r0, [sp, #0x0]
    ldrsh r2, [r5, #0xd6]
    ldr r0, .L_02038aa4
    mov r3, r4
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0xb
    bl DebugText_Printf
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    mov r0, r5
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_02034464
    ldr r1, .L_02038aa8
    mov r3, r4
    str r1, [sp, #0x0]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r1, [sp, #0x4]
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r1, [sp, #0x8]
    mov r1, r0, lsl #0x1b
    mov r1, r1, asr #0x1b
    str r1, [sp, #0xc]
    ldr r1, .L_02038aa4
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    mov r2, #0xc
    bl DebugText_Printf
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_02038a9c: .word data_020df4ac
.L_02038aa0: .word data_020df294
.L_02038aa4: .word gDebugFont
.L_02038aa8: .word data_020df4b8
    .size func_020389ec, . - func_020389ec
