; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text
.extern GamePhaseRuntime_GetActorCollection
.extern Heap_Free
.extern func_0200ae4c
.extern data_021052fc
.global func_0200b180
func_0200b180:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x144]
    mov r0, #0x0
    cmp r1, #0x0
    moveq r1, #0x1
    movne r1, r0
    cmp r1, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, L_0200b238
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldr r4, [r0, #0x8]
    ldr r0, [r5, #0x140]
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    str r1, [r5, #0x140]
    ldrne r1, [r0, #0x4]
    movne r2, #0x0
    strne r2, [r1, #0x0]
    moveq r1, #0x0
    streq r1, [r5, #0x13c]
    cmp r0, #0x0
    ldr r6, [r0, #0x8]
    beq L_0200b1ec
    bl Heap_Free
L_0200b1ec:
    ldr r0, [r5, #0x144]
    subs r0, r0, #0x1
    str r0, [r5, #0x144]
    bne L_0200b204
    add r0, r5, #0x138
    bl func_0200ae4c
L_0200b204:
    mov r0, r4
    ldr r3, [r0, #0x0]
    mov r2, r6
    ldr r3, [r3, #0xac]
    mov r1, #0x4
    blx r3
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x4
    ldr r2, [r2, #0x78]
    blx r2
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
L_0200b238: .word data_021052fc
.size func_0200b180, . - func_0200b180

