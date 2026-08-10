; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text

.global ActorRuntimeCollection_IsQueuedValueMissing
ActorRuntimeCollection_IsQueuedValueMissing:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x144]
    mov r3, #0x0
    cmp r2, #0x0
    moveq r2, #0x1
    movne r2, r3
    cmp r2, #0x0
    bne L_0200b28c
    ldr ip, [r0, #0x13c]
    mov lr, #0x0
    mov r0, #0x1
    b L_0200b27c
L_0200b26c:
    ldr r2, [ip, #0x8]
    ldr ip, [ip, #0x0]
    cmp r1, r2
    moveq lr, r0
L_0200b27c:
    cmp ip, #0x0
    bne L_0200b26c
    cmp lr, #0x0
    moveq r3, #0x1
L_0200b28c:
    mov r0, r3
    ldmia sp!, {r3, pc}
.size ActorRuntimeCollection_IsQueuedValueMissing, . - ActorRuntimeCollection_IsQueuedValueMissing

