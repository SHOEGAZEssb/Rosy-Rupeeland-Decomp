; Matching retail form; see src/game/actor_extended_table_subclass_lifecycle.c.
.text
.extern Heap_Free
.extern data_020e0b70
.extern ActorExtendedType2_Destroy
.extern ActorExtendedTable_Init
.extern ActorExtendedTable_ResetStageCounters
.global ActorExtendedTableCyclic_Init
.type ActorExtendedTableCyclic_Init, @function
.global ActorExtendedTableCyclic_Destroy
.type ActorExtendedTableCyclic_Destroy, @function
.global ActorExtendedTableCyclic_DestroyAndFree
.type ActorExtendedTableCyclic_DestroyAndFree, @function
.global ActorExtendedTableCyclic_ResetStageCycle
.type ActorExtendedTableCyclic_ResetStageCycle, @function
ActorExtendedTableCyclic_Init: ; 0x02044d84
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTable_Init
    ldr r0, .L_02044db0
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0xa8]
    mov r0, r4
    strh r2, [r1, #0xaa]
    ldmia sp!, {r4, pc}
.L_02044db0: .word data_020e0b70

.size ActorExtendedTableCyclic_Init, . - ActorExtendedTableCyclic_Init
ActorExtendedTableCyclic_Destroy: ; 0x02044db4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedTableCyclic_Destroy, . - ActorExtendedTableCyclic_Destroy
ActorExtendedTableCyclic_DestroyAndFree: ; 0x02044dc8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedTableCyclic_DestroyAndFree, . - ActorExtendedTableCyclic_DestroyAndFree
ActorExtendedTableCyclic_ResetStageCycle: ; 0x02044de4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTable_ResetStageCounters
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa8]
    mov r1, #0xf
    strh r1, [r0, #0xaa]
    ldmia sp!, {r4, pc}
.size ActorExtendedTableCyclic_ResetStageCycle, . - ActorExtendedTableCyclic_ResetStageCycle
