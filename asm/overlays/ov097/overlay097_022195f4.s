.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_021052fc
.extern data_ov097_0221a80c
.extern GamePhaseRuntime_GetActorCollection
.extern func_ov075_02212ae0
.extern func_ov097_022177e0
.extern func_ov097_02217934
.extern gGameWork

.global func_ov097_022195f4
func_ov097_022195f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    bl func_ov075_02212ae0
    ldr r1, .L_0221970c
    mov r4, #0x6
    str r1, [r10, #0x0]
    mov r0, #0x0
    str r0, [r10, #0x2b0]
    str r0, [r10, #0x2b4]
    str r0, [r10, #0x2bc]
    add r0, r10, #0x8
    sub r1, r4, #0x14
    sub r2, r4, #0xc
    mov r3, #0xe
    str r4, [sp, #0x0]
    bl func_ov097_02217934
    mov r7, #0x0
    mov r5, #0x1
    mov r8, r7
    mov r11, r7
    mov r6, r5
    ldr r4, .L_02219710
    b .L_022196a4
.L_02219654:
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, [r0, r8, lsl #0x2]
    cmp r1, #0x0
    beq .L_022196a0
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x2
    moveq r0, r5
    movne r0, r11
    cmp r0, #0x0
    beq .L_022196a0
    add r0, r1, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    addne r7, r7, #0x1
.L_022196a0:
    add r8, r8, #0x1
.L_022196a4:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r8, r0
    blt .L_02219654
    add r0, r7, #0x6
    str r0, [r10, #0x2b8]
    ldr r0, .L_02219714
    ldrsh r3, [r9, #0x52]
    ldr r0, [r0, #0x0]
    add r2, r7, #0x9
    mov r1, #0x0
    bl func_ov097_022177e0
    ldr r0, .L_02219714
    ldr r2, [r10, #0x2b8]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r3, #0x1
    bl func_ov097_022177e0
    ldr r1, [r10, #0x260]
    mov r0, r10
    orr r1, r1, #0x200000
    str r1, [r10, #0x260]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221970c: .word data_ov097_0221a80c
.L_02219710: .word data_021052fc
.L_02219714: .word gGameWork
.size func_ov097_022195f4, . - func_ov097_022195f4
