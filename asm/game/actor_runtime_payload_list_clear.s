; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern Heap_Free
.global ActorRuntimeAnimationResourceList_Clear
ActorRuntimeAnimationResourceList_Clear:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b L_0200bbcc
L_0200bbb8:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_0200bbc8
    bl Heap_Free
L_0200bbc8:
    mov r0, r4
L_0200bbcc:
    cmp r0, #0x0
    bne L_0200bbb8
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size ActorRuntimeAnimationResourceList_Clear, . - ActorRuntimeAnimationResourceList_Clear

