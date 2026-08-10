; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimePayloadList_Clear
.global ActorRuntimeObjectLists_ClearFirst
ActorRuntimeObjectLists_ClearFirst:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r4, [r5, #0x8]
    b L_0200bcfc
L_0200bce0:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200bcf8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200bcf8:
    ldr r4, [r4, #0x0]
L_0200bcfc:
    cmp r4, #0x0
    bne L_0200bce0
    add r0, r5, #0x4
    bl ActorRuntimePayloadList_Clear
    ldmia sp!, {r3, r4, r5, pc}
.size ActorRuntimeObjectLists_ClearFirst, . - ActorRuntimeObjectLists_ClearFirst

