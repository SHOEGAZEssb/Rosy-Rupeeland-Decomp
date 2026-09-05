.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.
.extern Heap_Free
.extern TrackedResourceActor_Destroy

.global TrackedResourceActorType32_DestroyAndFree
TrackedResourceActorType32_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size TrackedResourceActorType32_DestroyAndFree, . - TrackedResourceActorType32_DestroyAndFree
