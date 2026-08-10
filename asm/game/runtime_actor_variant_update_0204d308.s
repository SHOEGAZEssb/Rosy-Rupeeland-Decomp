; Matching retail form; see src/game/runtime_actor_variant_update.c.
.extern Actor_SetRuntimeFlag80
.extern func_0201b23c
.extern func_0201273c
.extern func_0200b058
.extern Actor_GetCollectionBySlot
.extern Actor_GetCollection
.extern ActorCollection_EndTrackedPair
.extern func_0200af04
.extern func_0201b180
.extern func_0201b228
.extern ActorCollection_QueueActorForRemoval
.extern data_02105310
.text
    .global func_0204d308
func_0204d308: ; 0x0204d308
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl Actor_SetRuntimeFlag80
    add r0, r4, #0xec
    bl func_0201b23c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r4, #0xec
    mov r1, #0x0
    bl func_0201273c
    ldrb r0, [r4, #0x169]
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_0204d3b4
    ldr r0, .L_0204d3d4
    mov r1, r4
    bl func_0200b058
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x2
    beq .L_0204d390
    mov r0, r4
    mov r1, #0x1
    bl Actor_GetCollectionBySlot
    mov r5, r0
    mov r0, r4
    bl Actor_GetCollection
    add r1, r5, #0x2000
    ldr r1, [r1, #0xe7c]
    mov r2, r4
    bl ActorCollection_EndTrackedPair
.L_0204d390:
    ldr r0, .L_0204d3d4
    mov r1, #0x0
    strb r1, [r4, #0xe8]
    bl func_0200af04
    mov r1, r0
    add r0, r4, #0xec
    bl func_0201b180
    add r0, r4, #0xec
    bl func_0201b228
.L_0204d3b4:
    ldr r0, [r4, #0x14]
    tst r0, #0x20
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d3d4: .word data_02105310
.size func_0204d308, . - func_0204d308
