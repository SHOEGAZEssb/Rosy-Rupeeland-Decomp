; Matching retail form; see src/game/type7_actor_state_predicates.c.
.extern data_021052fc
.extern GamePhaseState_GetConfiguration
.text
    .global Type7Actor_MatchesGlobalRecordIndex
.type Type7Actor_MatchesGlobalRecordIndex, @function
Type7Actor_MatchesGlobalRecordIndex: ; 0x0204a564
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x7e]
    mvn r0, #0x0
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_0204a5b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    add r1, r4, #0x200
    ldr r0, [r0, #0x0]
    ldrsh r1, [r1, #0x7e]
    mov r0, r0, lsl #0x10
    cmp r1, r0, asr #0x10
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_0204a5b4: .word data_021052fc
.size Type7Actor_MatchesGlobalRecordIndex, . - Type7Actor_MatchesGlobalRecordIndex

    .global Type7Actor_HasFlag4Target
.type Type7Actor_HasFlag4Target, @function
Type7Actor_HasFlag4Target: ; 0x0204a5b8
    ldr r1, [r0, #0x280]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r0, [r0, #0x10]
    tst r0, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size Type7Actor_HasFlag4Target, . - Type7Actor_HasFlag4Target

