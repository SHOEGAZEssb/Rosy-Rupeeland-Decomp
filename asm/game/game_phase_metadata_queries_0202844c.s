; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern GameWork_TestFlag
.extern data_020d4864
.extern gGameWork

    .global GamePhaseMetadata_IsAreaBehaviorPermitted
    .type GamePhaseMetadata_IsAreaBehaviorPermitted, @function
GamePhaseMetadata_IsAreaBehaviorPermitted: ; 0x0202844c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, [r0, #0x40]
    mov r3, #0x0
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    moveq r3, #0x1
    beq .L_020284d0
    ldrsb r2, [r0, #0x4c]
    cmp r2, #0x0
    blt .L_020284d0
    mov r0, #0x18
    mul r1, r2, r0
    ldr r0, .L_020284d8
    ldr r0, [r0, r1]
    ldrh r1, [r0, #0x1e]
    ldrh r4, [r0, #0x20]
    cmp r1, #0x0
    blt .L_020284cc
    ldr r0, .L_020284dc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    ldr r1, .L_020284dc
    mov r5, r0
    ldr r0, [r1, #0x0]
    mov r1, r4
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    and r3, r5, r0
    b .L_020284d0
.L_020284cc:
    mov r3, #0x1
.L_020284d0:
    mov r0, r3
    ldmia sp!, {r3, r4, r5, pc}
.L_020284d8: .word data_020d4864
.L_020284dc: .word gGameWork
    .size GamePhaseMetadata_IsAreaBehaviorPermitted, . - GamePhaseMetadata_IsAreaBehaviorPermitted

