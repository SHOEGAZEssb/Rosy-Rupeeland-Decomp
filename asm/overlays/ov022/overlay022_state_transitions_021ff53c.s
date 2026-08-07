.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_transitions.c. */
.extern data_020d780c
.extern func_ov022_021ff0d0
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern gGameWork


    .global func_ov022_021ff53c
func_ov022_021ff53c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021ff558
    cmp r0, #0x1
    b L_021ff5d0
L_021ff558:
    mov r8, #0x0
    ldr r7, L_021ff5e0
    ldr r6, L_021ff5e4
    mov r9, r8
    mov r5, #0x34
L_021ff56c:
    mla r10, r9, r5, r7
    ldrh r1, [r10, #0x1c]
    ldr r0, [r6, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021ff598
    ldrh r1, [r10, #0x20]
    ldr r0, [r6, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    addeq r8, r8, #0x1
L_021ff598:
    add r9, r9, #0x1
    cmp r9, #0xb
    blt L_021ff56c
    cmp r8, #0xb
    bne L_021ff5bc
    ldr r0, L_021ff5e4
    ldr r1, L_021ff5e8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
L_021ff5bc:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff5d0:
    mov r0, r4
    bl func_ov022_021ff0d0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021ff5e0: .word data_020d780c
L_021ff5e4: .word gGameWork
L_021ff5e8: .word 0x39e
.size func_ov022_021ff53c, .-func_ov022_021ff53c

