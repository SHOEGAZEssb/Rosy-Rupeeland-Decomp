    .text
/* Exact fallback; see src/overlays/ov018/overlay018_actor_visibility.c. */
    .extern data_020c37e4
    .extern data_020d7a48
    .extern data_021052fc
    .extern GamePhaseRuntime_GetActorCollection
    .extern ActorCollection_GetSpriteOwner
    .extern func_02091b98
    .extern gGameWork
.global func_ov018_021fe5a8
func_ov018_021fe5a8:
    bx lr
    .size func_ov018_021fe5a8, . - func_ov018_021fe5a8

    .global func_ov018_021fe5ac
func_ov018_021fe5ac:
    stmdb sp!, {r3, lr}
    ldr r0, L_021fe5f4
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r0, #0xc]
    b L_021fe5e8
L_021fe5cc:
    ldr r0, [r1, #0x18]
    ldr r0, [r0, #0x10]
    cmp r0, #0x70
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x10
    streqh r0, [r1, #0x24]
    ldr r1, [r1, #0x8]
L_021fe5e8:
    cmp r1, #0x0
    bne L_021fe5cc
    ldmia sp!, {r3, pc}
L_021fe5f4: .word data_021052fc
    .size func_ov018_021fe5ac, . - func_ov018_021fe5ac

    .global func_ov018_021fe5f8
func_ov018_021fe5f8:
    stmdb sp!, {r3, lr}
    ldr r0, L_021fe640
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    ldr r1, [r0, #0xc]
    b L_021fe634
L_021fe618:
    ldr r0, [r1, #0x18]
    ldr r0, [r0, #0x10]
    cmp r0, #0x70
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x10
    streqh r0, [r1, #0x24]
    ldr r1, [r1, #0x8]
L_021fe634:
    cmp r1, #0x0
    bne L_021fe618
    ldmia sp!, {r3, pc}
L_021fe640: .word data_021052fc
    .size func_ov018_021fe5f8, . - func_ov018_021fe5f8

    .global func_ov018_021fe644
func_ov018_021fe644:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, [r0, #0x400]
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r5, L_021fe6e4
    mov r1, #0x0
    ldr r4, L_021fe6e8
    ldr ip, [r5, #0x0]
    mov r2, r1
    mov r3, r1
    ldr lr, [r4, #0x0]
    ldr r6, L_021fe6ec
    mov r5, #0x24
    b L_021fe6b8
L_021fe67c:
    mul r4, r3, r5
    ldrsh r4, [r6, r4]
    ldr r7, [r0, #0x19c]
    cmp r7, r4
    bne L_021fe6b4
    cmp r3, #0x0
    add r1, r1, #0x1
    beq L_021fe6b0
    add r4, ip, r3
    add r4, r4, #0x5000
    ldrb r4, [r4, #0xe94]
    cmp r4, #0x0
    beq L_021fe6b4
L_021fe6b0:
    add r2, r2, #0x1
L_021fe6b4:
    add r3, r3, #0x1
L_021fe6b8:
    cmp r3, lr
    blt L_021fe67c
    cmp r1, r2
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, #0x1
    str r1, [r0, #0x3fc]
    str r1, [r0, #0x400]
    add r0, r0, #0x3e0
    mov r1, #0x78
    bl func_02091b98
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fe6e4: .word gGameWork
L_021fe6e8: .word data_020c37e4
L_021fe6ec: .word data_020d7a48
    .size func_ov018_021fe644, . - func_ov018_021fe644
