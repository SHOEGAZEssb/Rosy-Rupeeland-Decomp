; Matching retail form; see src/game/singleton_tracking_actor.c.
.extern ActorDerivedRuntime_Init
.extern ActorDerivedRuntime_DestroyAlternate
.extern Heap_Free
.extern ActorDerivedRuntime_UpdateFrame
.extern GamePhaseRuntime_GetActorCollection
.extern GameWork_TestFlag
.extern data_020e1f2c
.extern gGameWork
.extern data_021052fc
.text
    .global func_0204d068
func_0204d068: ; 0x0204d068
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    ldr r0, .L_0204d098
    mov r1, #0x0
    str r0, [r4, #0x0]
    str r1, [r4, #0x208]
    str r1, [r4, #0x20c]
    str r1, [r4, #0x210]
    mov r0, r4
    str r1, [r4, #0x214]
    ldmia sp!, {r4, pc}
.L_0204d098: .word data_020e1f2c
.size func_0204d068, . - func_0204d068

    .global func_0204d09c
func_0204d09c: ; 0x0204d09c
    stmdb sp!, {r4, lr}
    ldr r2, .L_0204d0c8
    mov r4, r0
    ldr r1, .L_0204d0cc
    str r2, [r4, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0x9e]
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d0c8: .word data_020e1f2c
.L_0204d0cc: .word gGameWork
.size func_0204d09c, . - func_0204d09c

    .global func_0204d0d0
func_0204d0d0: ; 0x0204d0d0
    stmdb sp!, {r4, lr}
    ldr r2, .L_0204d104
    mov r4, r0
    ldr r1, .L_0204d108
    str r2, [r4, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0x9e]
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d104: .word data_020e1f2c
.L_0204d108: .word gGameWork
.size func_0204d0d0, . - func_0204d0d0

    .global func_0204d10c
func_0204d10c: ; 0x0204d10c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    tst r1, #0x1000000
    beq .L_0204d128
    bl ActorDerivedRuntime_UpdateFrame
    ldmia sp!, {r4, pc}
.L_0204d128:
    ldr r0, .L_0204d214
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    ldr r0, .L_0204d218
    str r1, [r4, #0x208]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0204d21c
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0204d170
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_0204d170:
    ldr r0, .L_0204d214
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    ldr r0, [r4, #0x208]
    bne .L_0204d1d8
    ldr r0, [r0, #0x1c]
    ldr r1, .L_0204d218
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x1c]
    ldr r0, [r1, #0x0]
    ldr r3, [r4, #0x208]
    ldrsh r1, [r0, #0x9e]
    ldr r0, [r3, #0x20]
    mov r2, #0x0
    add r0, r0, r0, lsr #0x1f
    mov r1, r1, lsl #0xc
    add r0, r1, r0, asr #0x1
    str r0, [r4, #0x20]
    str r2, [r4, #0x24]
    ldmia sp!, {r4, pc}
.L_0204d1d8:
    ldr r0, [r0, #0x1c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x208]
    ldr r0, [r0, #0x20]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x208]
    ldr r0, [r0, #0x24]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x24]
    ldmia sp!, {r4, pc}
.L_0204d214: .word data_021052fc
.L_0204d218: .word gGameWork
.L_0204d21c: .word 0x405
.size func_0204d10c, . - func_0204d10c

