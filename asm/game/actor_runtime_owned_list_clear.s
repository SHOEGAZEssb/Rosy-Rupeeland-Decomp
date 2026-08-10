; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern Heap_Free
.global ActorRuntimeOwnedList_Clear
ActorRuntimeOwnedList_Clear:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b L_0200ae70
L_0200ae5c:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_0200ae6c
    bl Heap_Free
L_0200ae6c:
    mov r0, r4
L_0200ae70:
    cmp r0, #0x0
    bne L_0200ae5c
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size ActorRuntimeOwnedList_Clear, . - ActorRuntimeOwnedList_Clear

