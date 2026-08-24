; Matching retail form; see src/game/presentation_backed_actor_split_spawn.c.
.extern data_020c3e78
.extern gFx32CosSinTable
.extern gPresentationBackedActorRuntimeState
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern PresentationBackedActor_Spawn
.extern func_020adae4
.extern func_020bf1f8
.extern genrand_int32
.text

    .global PresentationBackedActor_SpawnSplitAmount
PresentationBackedActor_SpawnSplitAmount: ; 0x0204e3f4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x2c
    mov r5, r1
    mov r6, r0
    mov r0, r5
    mov r1, #0x3
    mov r4, r2
    bl func_020adae4
    mov r1, #0x0
    mov r7, r0
    add r0, sp, #0x1c
    mov r2, r1
    mov r3, #0x2000
    bl VecFx32Object_InitComponents
    mov r8, #0x0
    ldr r1, .L_0204e574
    b .L_0204e44c
.L_0204e438:
    mov r0, r8, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, r7
    bgt .L_0204e454
    add r8, r8, #0x1
.L_0204e44c:
    cmp r8, #0x7
    blt .L_0204e438
.L_0204e454:
    cmp r8, #0x0
    subgt r8, r8, #0x1
    mov r7, #0x0
    b .L_0204e554
.L_0204e464:
    mov r9, r8
    ldr r0, .L_0204e574
    b .L_0204e548
.L_0204e470:
    mov r1, r9, lsl #0x1
    ldrsh r10, [r0, r1]
    cmp r5, r10
    blt .L_0204e544
    ldr r0, .L_0204e578
    sub r1, r5, r10
    ldrh r2, [r0, #0x0]
    mov r0, r1, lsl #0x10
    ldr r1, .L_0204e57c
    mov r2, r2, asr #0x4
    add r1, r1, r2, lsl #0x2
    ldrsh r2, [r1, #0x2]
    mov r5, r0, asr #0x10
    mov r1, #0x2
    add r0, r2, r2, lsl #0x1
    bl func_020adae4
    ldr r1, .L_0204e578
    ldr r2, .L_0204e57c
    ldrh r3, [r1, #0x0]
    str r0, [sp, #0x20]
    mov r1, #0x2
    mov r0, r3, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r2, r0]
    add r0, r0, r0, lsl #0x1
    bl func_020adae4
    str r0, [sp, #0x24]
    ldr r1, .L_0204e580
    add r0, sp, #0x1c
    stmia sp, {r0, r1}
    add r0, r1, #0x1
    str r0, [sp, #0x8]
    add r0, r1, #0x2
    str r0, [sp, #0xc]
    str r9, [sp, #0x10]
    mov r0, #0x7
    str r0, [sp, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x18]
    mov r2, r10
    mov r0, #0xa
    mov r1, r6
    mov r3, r4
    bl PresentationBackedActor_Spawn
    bl genrand_int32
    mov r1, #0x3000
    bl func_020bf1f8
    ldr r0, .L_0204e578
    add r1, r1, #0x1800
    ldrh r2, [r0, #0x0]
    add r1, r2, r1
    strh r1, [r0, #0x0]
    b .L_0204e550
.L_0204e544:
    sub r9, r9, #0x1
.L_0204e548:
    cmp r9, #0x0
    bge .L_0204e470
.L_0204e550:
    add r7, r7, #0x1
.L_0204e554:
    cmp r7, #0x5
    bge .L_0204e564
    cmp r5, #0x0
    bgt .L_0204e464
.L_0204e564:
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0204e574: .word data_020c3e78
.L_0204e578: .word gPresentationBackedActorRuntimeState
.L_0204e57c: .word gFx32CosSinTable
.L_0204e580: .word 0x300d
.size PresentationBackedActor_SpawnSplitAmount, . - PresentationBackedActor_SpawnSplitAmount

