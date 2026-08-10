; Matching retail form; see src/game/actor_runtime_object_lists_populate.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorRuntimeObjectLists_AddRecord
.global ActorRuntimeObjectLists_AddRecords
ActorRuntimeObjectLists_AddRecords:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r7, r2
    mov r9, r0
    mov r8, r1
    mov r6, r3
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x0
    mov r5, r4
    b L_0200be08
L_0200bde8:
    str r6, [sp, #0x0]
    add r0, r8, r5, lsl #0x2
    ldmib r0, {r2, r3}
    ldr r1, [r8, r5, lsl #0x2]
    mov r0, r9
    bl ActorRuntimeObjectLists_AddRecord
    add r4, r4, #0x1
    add r5, r5, #0x3
L_0200be08:
    cmp r4, r7
    blo L_0200bde8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.size ActorRuntimeObjectLists_AddRecords, . - ActorRuntimeObjectLists_AddRecords

