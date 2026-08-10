; Matching retail form; see src/game/tracked_resource_actor_sequence_complete.c.
.extern data_021052fc
.extern ActorMotionJitter_EnsureMinimum
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern func_02050260
.extern func_020505f0
.text
    .global func_02052254
func_02052254:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    mov r0, r4
    bl func_02050260
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    beq .L_02052298
    ldr r0, .L_020522a4
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
.L_02052298:
    mov r0, r4
    bl func_020505f0
    ldmia sp!, {r4, pc}
.L_020522a4: .word data_021052fc
    .size func_02052254, . - func_02052254
