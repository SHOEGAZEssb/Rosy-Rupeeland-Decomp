.text
.global UpdateKeyState
.type UpdateKeyState, @function
    .extern gPadStates
    .extern gSystemState
    .extern gPadState0Pressed
    .extern gPadState0Released
    .extern gPadState0Repeated

UpdateKeyState:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r2, #0x16
    mul r4, r1, r2
    ldr r1, [pc, #0xb0]
    ldr r3, [pc, #0xb0]
    ldrh r6, [r1, r4]
    ldr r5, [pc, #0xac]
    mov r2, #0
    mvn r6, r6
    and r6, r0, r6
    strh r6, [r5, r4]
    ldrh r6, [r1, r4]
    mvn r7, r0
    add lr, r3, r4
    ldr r5, [pc, #0x90]
    and r6, r7, r6
    strh r6, [r5, r4]
    mov r12, r2
    mov r3, #1
    mov r6, r2
update_key_loop:
    tst r0, r3
    beq update_key_clear
    ldrh r5, [lr, #4]
    tst r3, r5
    ldreqb r7, [lr, #0xc]
    addeq r5, lr, r12
    orreq r2, r2, r3
    streqb r7, [r5, #0xe]
    beq update_key_next
    add r7, lr, r12
    ldrb r5, [r7, #0xe]
    sub r5, r5, #1
    tst r5, #0xff
    strb r5, [r7, #0xe]
    ldreqb r5, [lr, #0xd]
    orreq r2, r2, r3
    streqb r5, [r7, #0xe]
    b update_key_next
update_key_clear:
    add r5, lr, r12
    strb r6, [r5, #0xe]
update_key_next:
    add r12, r12, #1
    mov r3, r3, lsl #0x11
    cmp r12, #0xc
    mov r3, r3, lsr #0x10
    blt update_key_loop
    ldr r3, [pc, #0x18]
    strh r2, [r3, r4]
    strh r0, [r1, r4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .word gPadStates
    .word gSystemState
    .word gPadState0Pressed
    .word gPadState0Released
    .word gPadState0Repeated
    .size UpdateKeyState, .-UpdateKeyState
