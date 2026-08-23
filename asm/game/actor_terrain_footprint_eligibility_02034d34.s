; Matching retail form; see src/game/actor_terrain_footprint_eligibility.c.
.text
.extern ActorBounds_GetWidth
.extern ActorBounds_GetHeight
.extern Actor_IsTerrainCellEligibleAtHeight
.extern Actor_IsTerrainCellEligibleAtHeightOrOneBelow
.extern func_020adae4

    .global func_02034d34
    .type func_02034d34, @function
func_02034d34: ; 0x02034d34
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r9, r1
    mov r8, r2
    mov r3, r3, asr #0x10
    mov r1, r9, asr #0x10
    mov r2, r8, asr #0x10
    str r3, [sp, #0x0]
    mov r10, r0
    bl Actor_IsTerrainCellEligibleAtHeight
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02034e00
    add r0, r10, #0x4
    bl ActorBounds_GetWidth
    mov r1, #0x2
    bl func_020adae4
    add r1, r0, #0x2
    add r0, r10, #0x4
    mov r4, r1, lsl #0xc
    bl ActorBounds_GetHeight
    mov r1, #0x2
    bl func_020adae4
    add r0, r0, #0x2
    mvn r6, #0x0
    mov r5, r0, lsl #0xc
    str r6, [sp, #0x4]
    b .L_02034df4
.L_02034da4:
    mla r0, r6, r4, r9
    ldr r7, [sp, #0x4]
    mov r11, r0, asr #0x10
    b .L_02034de8
.L_02034db4:
    cmp r6, #0x0
    cmpeq r7, #0x0
    beq .L_02034de4
    mla r2, r7, r5, r8
    ldr r3, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    mov r2, r2, asr #0x10
    bl Actor_IsTerrainCellEligibleAtHeightOrOneBelow
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_02034e00
.L_02034de4:
    add r7, r7, #0x1
.L_02034de8:
    cmp r7, #0x1
    ble .L_02034db4
    add r6, r6, #0x1
.L_02034df4:
    cmp r6, #0x1
    ble .L_02034da4
    mov r0, #0x1
.L_02034e00:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_02034d34, . - func_02034d34

    .global S8BoundsCenter_DestroyAndFree
