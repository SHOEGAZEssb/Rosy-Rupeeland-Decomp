; Matching retail form; see src/game/type7_actor_callback_control.c.
.text
.extern data_020e19d4
.extern Type7Actor_SetCallbackPair
.extern func_020ada8c
.extern genrand_int32
.global Type7Actor_SelectRandomCallback
.type Type7Actor_SelectRandomCallback, @function

Type7Actor_SelectRandomCallback: ; 0x02048000
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl genrand_int32
    bic r6, r0, #0x80000000
    tst r6, #0xf
    mov r0, r6
    bne .L_02048030
    mov r1, #0x3c
    mov r4, #0x4
    bl func_020ada8c
    add r1, r0, #0x3c
    b .L_0204806c
.L_02048030:
    mov r1, #0x9
    bl func_020ada8c
    ldr r1, [r5, #0xd0]
    mov r4, r0
    tst r1, #0x10
    ldrb r0, [r5, #0x4a]
    addne r4, r4, #0x1
    mov r1, #0x78
    cmp r0, #0x0
    addne r4, r4, #0x2
    cmp r4, #0x4
    mov r0, r6
    movgt r4, #0x4
    bl func_020ada8c
    add r1, r0, #0x50
.L_0204806c:
    add r0, r5, #0x200
    strh r1, [r0, #0x4a]
    add r0, r5, #0x200
    ldr r1, .L_020480c4
    ldrsh r3, [r0, #0x4a]
    add r1, r1, r4, lsl #0x3
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Type7Actor_SetCallbackPair
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r5, #0x14]
    ldr r0, [r5, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r5, #0x10]
    ldmia sp!, {r4, r5, r6, pc}
.L_020480c4: .word data_020e19d4

.size Type7Actor_SelectRandomCallback, . - Type7Actor_SelectRandomCallback

