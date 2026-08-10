; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global Actor_SnapshotTransientState
    .type Actor_SnapshotTransientState, @function
Actor_SnapshotTransientState: ; 0x020316e8
    ldrb r2, [r0, #0xd4]
    ldr r1, .L_0203171c
    strb r2, [r0, #0xd5]
    ldr r2, [r0, #0xc8]
    str r2, [r0, #0xcc]
    ldr r2, [r0, #0xd0]
    and r1, r2, r1
    str r1, [r0, #0xd0]
    ldrsh r1, [r0, #0xd6]
    strh r1, [r0, #0xd8]
    ldrsh r1, [r0, #0xda]
    strh r1, [r0, #0xdc]
    bx lr
.L_0203171c: .word 0x801f37ee
    .size Actor_SnapshotTransientState, . - Actor_SnapshotTransientState

