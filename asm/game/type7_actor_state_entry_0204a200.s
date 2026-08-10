; Matching retail form; see src/game/type7_actor_state_entry.c.
.extern data_020e18a8
.extern data_020e18b0
.extern data_020e18b8
.extern func_0200b2c0
.extern AttachmentController_SetEnabled
.extern Type7Actor_ResetMotionAndCooldown
.extern Type7Actor_SetCallbackPair
.text
    .global Type7Actor_SetFlag40StateEnabled
.type Type7Actor_SetFlag40StateEnabled, @function
Type7Actor_SetFlag40StateEnabled: ; 0x0204a200
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_0204a280
    ldr r1, .L_0204a2e0
    mov r2, #0x0
    str r2, [r4, #0x210]
    sub r3, r2, #0x1
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r1, #0x0
    mov r0, #0x4
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x268]
    mov r2, r1
    bic r0, r0, #0x20
    orr ip, r0, #0x40
    mov r3, r1
    add r0, r4, #0x38
    str ip, [r4, #0x268]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
.L_0204a280:
    ldr r1, [r4, #0x268]
    ldr r0, .L_0204a2e4
    add r2, r4, #0x200
    and r0, r1, r0
    str r0, [r4, #0x268]
    mov r1, #0x0
    strh r1, [r2, #0x50]
    mov r0, #0x1e
    strh r0, [r2, #0x56]
    strh r0, [r2, #0x5a]
    strh r1, [r2, #0x64]
    strh r1, [r2, #0x4e]
    ldr r2, [r4, #0x268]
    add r0, r4, #0x2a8
    bic r2, r2, #0x3000
    str r2, [r4, #0x268]
    bl AttachmentController_SetEnabled
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x46]
    mov r0, r4
    strh r2, [r1, #0x66]
    bl Type7Actor_ResetMotionAndCooldown
    ldmia sp!, {r4, pc}
.L_0204a2e0: .word data_020e18b8
.L_0204a2e4: .word 0xfffff7b3
.size Type7Actor_SetFlag40StateEnabled, . - Type7Actor_SetFlag40StateEnabled

    .global Type7Actor_EnterFlag20State
.type Type7Actor_EnterFlag20State, @function
Type7Actor_EnterFlag20State: ; 0x0204a2e8
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    ldr r1, .L_0204a35c
    str r2, [r4, #0x210]
    sub r3, r2, #0x1
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r1, #0x0
    ldr r0, [r4, #0x268]
    mov r2, r1
    orr r0, r0, #0x20
    mov r3, r1
    str r0, [r4, #0x268]
    mov ip, #0x5
    add r0, r4, #0x38
    strh ip, [r4, #0xd6]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
.L_0204a35c: .word data_020e18b0
.size Type7Actor_EnterFlag20State, . - Type7Actor_EnterFlag20State

    .global Type7Actor_EnterFlag80State
.type Type7Actor_EnterFlag80State, @function
Type7Actor_EnterFlag80State: ; 0x0204a360
    stmdb sp!, {r4, lr}
    mov r2, #0x0
    mov r4, r0
    ldr r1, .L_0204a3d4
    str r2, [r4, #0x210]
    sub r3, r2, #0x1
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r1, #0x0
    ldr r0, [r4, #0x268]
    mov r2, r1
    orr r0, r0, #0x80
    mov r3, r1
    str r0, [r4, #0x268]
    mov ip, #0x4
    add r0, r4, #0x38
    strh ip, [r4, #0xd6]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
.L_0204a3d4: .word data_020e18a8
.size Type7Actor_EnterFlag80State, . - Type7Actor_EnterFlag80State

