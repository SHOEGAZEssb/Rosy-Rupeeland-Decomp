; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.extern OS_Halt
.extern data_020e19d4
.extern data_020e1a84
.global Type7Actor_DispatchCurrentCallback
.type Type7Actor_DispatchCurrentCallback, @function

Type7Actor_DispatchCurrentCallback: ; 0x02048148
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r1, r5
    mov r4, #0x1
    ldr lr, .L_020481d4
    b .L_020481c4
.L_02048160:
    ldr ip, [lr, r5, lsl #0x3]
    ldr r2, [r0, #0x208]
    mov r6, r4
    cmp ip, r2
    add r2, lr, r5, lsl #0x3
    bne .L_0204818c
    ldr r3, [r2, #0x4]
    ldr r2, [r0, #0x20c]
    cmp r3, r2
    cmpne ip, #0x0
    moveq r6, r1
.L_0204818c:
    cmp r6, #0x0
    bne .L_020481c0
    ldr r1, .L_020481d8
    add r3, r1, r5, lsl #0x3
    ldr r1, [r3, #0x4]
    add r0, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r3, #0x0]
    ldrne r1, [r2, r1]
    ldreq r1, [r3, #0x0]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
.L_020481c0:
    add r5, r5, #0x1
.L_020481c4:
    cmp r5, #0x16
    blt .L_02048160
    bl OS_Halt
    ldmia sp!, {r4, r5, r6, pc}
.L_020481d4: .word data_020e19d4
.L_020481d8: .word data_020e1a84

.size Type7Actor_DispatchCurrentCallback, . - Type7Actor_DispatchCurrentCallback

