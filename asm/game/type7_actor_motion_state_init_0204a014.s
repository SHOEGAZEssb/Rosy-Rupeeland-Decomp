; Matching retail form; see src/game/type7_actor_motion_state_init.c.
.extern data_020e1780
.extern data_020e18c0
.extern data_021056e0
.extern gGameWork
.extern GameWork_TestFlag
.extern func_0200b2c0
.extern Type7Actor_SetCallbackPair
.extern func_02072b68
.text
    .global func_0204a014
.type func_0204a014, @function
func_0204a014: ; 0x0204a014
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204a0d4
    mov r2, #0x0
    mov r4, r0
    str r2, [r4, #0x210]
    sub r3, r2, #0x1
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r0, #0xc
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x14]
    mov r1, #0x0
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r2, [r4, #0x10]
    mov r0, r4
    bic r2, r2, #0x10000
    orr r2, r2, #0x160000
    str r2, [r4, #0x10]
    str r1, [r4, #0x280]
    ldr r2, [r4, #0x268]
    mov r1, #0x1
    bic r2, r2, #0x14
    str r2, [r4, #0x268]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x88
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    mov r0, #0x0
    str r0, [r4, #0x108]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x100
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.L_0204a0d4: .word data_020e1780
.size func_0204a014, . - func_0204a014

    .global func_0204a0d8
.type func_0204a0d8, @function
func_0204a0d8: ; 0x0204a0d8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r3, #0x0
    str r3, [r5, #0x210]
    ldr r2, .L_0204a1f0
    mov r4, r1
    mov r3, #0x3c
    ldmia r2, {r1, r2}
    bl Type7Actor_SetCallbackPair
    ldr r1, [r5, #0x14]
    mov r0, r5
    bic r1, r1, #0x2
    bic r1, r1, #0x4
    str r1, [r5, #0x14]
    ldr r2, [r5, #0x10]
    mov r1, #0x1
    orr r2, r2, #0x30000
    str r2, [r5, #0x10]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    mov r1, #0x0
    mov r2, r1
    add r0, r5, #0x38
    mov r3, r1
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r5, #0x88
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r5, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    cmp r4, #0x0
    beq .L_0204a1e4
    ldr r0, .L_0204a1f4
    ldr r1, .L_0204a1f8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    mov r1, #0x2800
    rsbeq r1, r1, #0x0
    str r1, [r5, #0x90]
    ldr r0, .L_0204a1fc
    mov r1, #0x1800
    ldrb r0, [r0, #0x0]
    mov r2, #0xe
    tst r0, #0x1
    rsbne r1, r1, #0x0
    str r1, [r5, #0x8c]
    ldr r0, .L_0204a1fc
    mov r1, #0x0
    ldrb r3, [r0, #0x0]
    add r3, r3, #0x1
    strb r3, [r0, #0x0]
    ldr r0, [r5, #0x268]
    orr r0, r0, #0x200
    str r0, [r5, #0x268]
    strh r2, [r5, #0xd6]
    ldr r0, [r5, #0x54]
    bl func_02072b68
    mov r0, #0x0
    strb r0, [r5, #0xd4]
    ldmia sp!, {r3, r4, r5, pc}
.L_0204a1e4:
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    ldmia sp!, {r3, r4, r5, pc}
.L_0204a1f0: .word data_020e18c0
.L_0204a1f4: .word gGameWork
.L_0204a1f8: .word 0x44b
.L_0204a1fc: .word data_021056e0
.size func_0204a0d8, . - func_0204a0d8

