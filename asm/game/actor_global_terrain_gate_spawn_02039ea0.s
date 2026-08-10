; Matching retail form; see src/game/actor_global_terrain_gate_spawn.c.
.text
.extern Heap_Alloc
.extern data_020df4d8
.extern data_021052fc
.extern func_0200222c
.extern func_020022dc
.extern ActorDerivedType1_IsIdleEligible
.extern func_ov062_02210b38
.extern gHeapContext

    .global Actor_TrySpawnTerrainGateObject
    .type Actor_TrySpawnTerrainGateObject, @function
Actor_TrySpawnTerrainGateObject: ; 0x02039ea0
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, .L_02039f5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02039f54
    ldr r0, .L_02039f5c
    ldr r0, [r0, #0x0]
    add r1, r0, #0x2000
    ldr r0, [r1, #0xed4]
    ldr r2, [r1, #0xea4]
    ldr r3, [r0, #0x0]
    ldr r1, [r2, #0x1c]
    ldr r2, [r2, #0x20]
    ldr r3, [r3, #0x2c]
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    blx r3
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x2
    blt .L_02039f50
    cmp r1, #0x5
    bgt .L_02039f50
    bl func_020022dc
    ldr r2, .L_02039f60
    mov r1, #0x2
    bl func_0200222c
    ldr r1, .L_02039f64
    ldr r3, .L_02039f68
    mov r0, #0x7c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02039f48
    bl func_ov062_02210b38
.L_02039f48:
    mov r0, #0x1
    b .L_02039f54
.L_02039f50:
    mov r0, #0x0
.L_02039f54:
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_02039f5c: .word data_021052fc
.L_02039f60: .word 0x3e
.L_02039f64: .word data_020df4d8
.L_02039f68: .word gHeapContext
    .size Actor_TrySpawnTerrainGateObject, . - Actor_TrySpawnTerrainGateObject
