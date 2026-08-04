; Matching retail form; see src/game/game_phase_runtime_actor_sync.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02002e48
.extern func_0200500c
.extern func_02005058
.extern func_02008354
.extern func_02008378
.extern func_020083b0
.extern func_020086f8
.extern func_0200875c
.extern func_02009a2c
.extern func_02009d80
.extern func_0200ecbc
.extern func_02012150
.extern func_020124f0
.extern func_0201250c

    .global func_02008148
.type func_02008148, @function
func_02008148:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x74
    mov r4, r0
    cmp r1, #0x0
    beq L_02008168
    cmp r1, #0x1
    beq L_020081fc
    b L_02008348
L_02008168:
    add r0, r4, #0x3000
    ldrb r0, [r0, #0xcc]
    tst r0, #0x4
    movne r0, #0x0
    bne L_0200834c
    add r0, r4, #0x2000
    ldr r3, [r0, #0xed4]
    mov r1, #0x0
    ldr r2, [r3, #0x20]
    add r0, sp, #0x14
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x14
    mov r2, r2, asr #0x10
    str r2, [sp, #0x0]
    ldr r3, [r3, #0x20]
    mov r2, r1
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x14
    mov r3, r3, asr #0x10
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0x14
    bl func_02008354
    add r0, r4, #0x3bc
    add r1, sp, #0x1c
    add r0, r0, #0x2c00
    bl func_02009d80
    add r0, sp, #0x54
    mov r1, r4
    bl func_020086f8
    add r1, sp, #0x54
    add r0, r4, #0x24
    bl func_0200ecbc
    add r0, sp, #0x54
    bl func_02005058
    b L_02008348
L_020081fc:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    bne L_0200827c
    bl func_02002e48
    mov r2, r0, lsl #0xc
    mov r1, #0x0
    add r0, sp, #0x64
    mov r3, r1
    rsb r2, r2, #0x0
    bl func_0200500c
    add r0, sp, #0x44
    mov r1, r4
    bl func_020086f8
    add r0, sp, #0x34
    add r1, sp, #0x44
    add r2, sp, #0x64
    bl func_02008378
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    add r1, sp, #0x34
    bl func_02012150
    add r0, sp, #0x34
    bl func_02005058
    add r0, sp, #0x44
    bl func_02005058
    add r0, sp, #0x64
    bl func_02005058
    b L_02008348
L_0200827c:
    cmp r0, #0x0
    bne L_020082d4
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    bl func_020124f0
    add r1, r4, #0x2000
    mov r5, r0
    ldr r0, [r1, #0xfb8]
    bl func_0201250c
    mov r0, r0, lsl #0x10
    mov ip, r0, asr #0x10
    mov r3, r5, lsl #0x10
    mov r1, #0x0
    add r0, sp, #0xc
    mov r2, r1
    mov r3, r3, asr #0x10
    str ip, [sp, #0x0]
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0xc
    bl func_02008354
    b L_020082f8
L_020082d4:
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x0]
    bl func_020083b0
    add r0, sp, #0x1c
    add r1, sp, #0x4
    bl func_02008354
L_020082f8:
    add r0, r4, #0x44
    add r1, sp, #0x1c
    add r0, r0, #0x3000
    bl func_02009a2c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xfc]
    cmp r0, #0x0
    addne r0, r4, #0x2000
    ldrne r0, [r0, #0xfb8]
    cmpne r0, #0x0
    beq L_02008348
    add r0, sp, #0x24
    mov r1, r4
    bl func_0200875c
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    add r1, sp, #0x24
    bl func_02012150
    add r0, sp, #0x24
    bl func_02005058
L_02008348:
    mov r0, #0x0
L_0200834c:
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, pc}
    .size func_02008148, .-func_02008148

