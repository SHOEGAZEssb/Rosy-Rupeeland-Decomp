; Matching retail form; see src/game/actor_extended_table_destructors.c.
.text
.extern Heap_Free
.extern ActorExtendedType2_Destroy
.global ActorExtendedTable_Destroy
.type ActorExtendedTable_Destroy, @function
.global ActorExtendedTable_DestroyAndFree
.type ActorExtendedTable_DestroyAndFree, @function
ActorExtendedTable_Destroy: ; 0x02044698
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedTable_Destroy, . - ActorExtendedTable_Destroy
ActorExtendedTable_DestroyAndFree: ; 0x020446ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size ActorExtendedTable_DestroyAndFree, . - ActorExtendedTable_DestroyAndFree
