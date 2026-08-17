; Matching retail form; see src/game/actor_terrain_neighbor_response.c.
.text
.extern func_02034568

    .global func_02034800
    .type func_02034800, @function
func_02034800: ; 0x02034800
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r1
    ldr r1, [r10, #0xc]
    mvn r7, #0x0
    ldr r6, [r10, #0x4]
    ldr r5, [r10, #0x8]
    str r0, [sp, #0x0]
    mov r11, r1, asr #0x10
    str r7, [sp, #0x4]
.L_02034828:
    mov r0, r7, lsl #0x2
    ldr r8, [sp, #0x4]
    add r9, r7, r6, asr #0x10
    rsb r4, r0, #0x0
.L_02034838:
    ldr r0, [sp, #0x0]
    mov r1, r9
    mov r3, r11
    add r2, r8, r5, asr #0x10
    bl func_02034568
    cmp r0, #0x0
    bne .L_02034874
    ldr r1, [r10, #0x4]
    mov r0, r8, lsl #0x2
    add r1, r1, r4, lsl #0xc
    str r1, [r10, #0x4]
    ldr r1, [r10, #0x8]
    rsb r0, r0, #0x0
    add r0, r1, r0, lsl #0xc
    str r0, [r10, #0x8]
.L_02034874:
    add r8, r8, #0x1
    cmp r8, #0x1
    ble .L_02034838
    add r7, r7, #0x1
    cmp r7, #0x1
    ble .L_02034828
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_02034800, . - func_02034800

    .global ActorTerrain_ApplyNeighborAxisBias

