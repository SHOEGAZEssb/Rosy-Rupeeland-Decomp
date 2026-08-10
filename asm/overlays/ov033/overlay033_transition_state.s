.text

/* Exact fallback; see src/overlays/ov033/overlay033_transition_state.c for documented portable C. */

    .extern func_02094bbc
    .extern func_02094cf0
    .extern GameWork_SetFlag
    .extern GamePhaseRuntime_StageAreaRequest
    .extern Heap_Alloc
    .extern func_0200c680
    .extern func_02092c8c
    .extern func_ov033_021fd598
    .extern Type7Actor_EnterFlag40000State
    .extern func_ov033_021fd04c
    .extern func_020740a4
    .extern data_ov033_021fdd60
    .extern gGameWork
    .extern data_021052fc
    .extern data_ov033_021fdec8
    .extern gHeapContext
    .extern data_ov033_021fdd2c
    .extern data_ov033_021fdd18

    .global func_ov033_021fd738
func_ov033_021fd738:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xd0]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fd96c
L_021fd754:
    b L_021fd764
    b L_021fd7b0
    b L_021fd878
    b L_021fd93c
L_021fd764:
    ldr r1, [r4, #0x4]
    ldr r0, [r4, #0x48]
    ldr ip, [r1, #0x1c]
    ldr r3, [r1, #0x20]
    mov r1, ip, asr #0xb
    mov r2, r3, asr #0xb
    add r1, ip, r1, lsr #0x14
    add r2, r3, r2, lsr #0x14
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    mov r3, #0x0
    bl func_02094bbc
    ldr r0, [r4, #0x48]
    ldr r1, L_021fd980
    mov r2, #0x0
    bl func_02094cf0
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
L_021fd7b0:
    ldr r0, [r4, #0x48]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_021fd83c
    ldr r0, L_021fd984
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_021fd984
    ldr r1, L_021fd988
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, L_021fd98c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x69
    mov r2, #0x80
    mov r3, #0x280
    bl GamePhaseRuntime_StageAreaRequest
    mov r0, #0x24
    ldr r1, L_021fd990
    sub r2, r0, #0x28
    ldr r3, L_021fd994
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd82c
    bl func_0200c680
L_021fd82c:
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    b L_021fd96c
L_021fd83c:
    ldr r1, [r4, #0x48]
    ldrh r0, [r1, #0x98]
    tst r0, #0x1
    beq L_021fd86c
    ldr r0, [r1, #0x7c]
    ldr r1, [r1, #0x80]
    sub r0, r0, #0x10
    cmp r1, r0
    bne L_021fd86c
    mov r0, #0x3
    mov r1, #0x10
    bl func_02092c8c
L_021fd86c:
    mov r0, r4
    bl func_ov033_021fd598
    b L_021fd96c
L_021fd878:
    ldr r1, L_021fd98c
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x4]
    ldr r2, [r0, #0x54]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x4]
    ldr r2, [r0, #0xa8]
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    str r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_021fd910
    ldrsh r1, [r0, #0xd6]
    cmp r1, #0x5
    cmpne r1, #0xc
    moveq r0, #0x0
    streq r0, [r4, #0x8]
    beq L_021fd910
    ldr r1, [r0, #0x268]
    tst r1, #0x40000
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne L_021fd910
    bl Type7Actor_EnterFlag40000State
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
L_021fd910:
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r4, #0x48]
    ldr r1, L_021fd998
    mov r2, #0x0
    bl func_02094cf0
    ldr r0, [r4, #0xd0]
    add r0, r0, #0x1
    str r0, [r4, #0xd0]
    b L_021fd96c
L_021fd93c:
    ldr r0, [r4, #0x48]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_021fd964
    ldr r1, L_021fd99c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov033_021fd04c
L_021fd964:
    mov r0, r4
    bl func_ov033_021fd598
L_021fd96c:
    ldr r0, [r4, #0x0]
    bl func_020740a4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021fd980: .word data_ov033_021fdd60
L_021fd984: .word gGameWork
L_021fd988: .word 0x386
L_021fd98c: .word data_021052fc
L_021fd990: .word data_ov033_021fdec8
L_021fd994: .word gHeapContext
L_021fd998: .word data_ov033_021fdd2c
L_021fd99c: .word data_ov033_021fdd18
.size func_ov033_021fd738, .-func_ov033_021fd738
