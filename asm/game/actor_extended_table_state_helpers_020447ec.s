; Matching retail form; see src/game/actor_extended_table_state_helpers.c.
.text
.extern data_020e0ac8
.extern ActorExtendedType2_SetCallbackPair130AndForwardD0
.global ActorExtendedTable_ResetStageCounters
.type ActorExtendedTable_ResetStageCounters, @function
.global ActorExtendedTable_InstallCallback30AndDispatch
.type ActorExtendedTable_InstallCallback30AndDispatch, @function
ActorExtendedTable_ResetStageCounters: ; 0x020447ec
    ldr r1, [r0, #0x2a4]
    cmp r1, #0x0
    bxeq lr
    add r0, r0, #0x200
    ldrsh r2, [r0, #0x9a]
    mov r1, #0x0
    strh r2, [r0, #0x98]
    ldrsh r2, [r0, #0xa2]
    strh r2, [r0, #0xa0]
    strh r1, [r0, #0x9c]
    bx lr

.size ActorExtendedTable_ResetStageCounters, . - ActorExtendedTable_ResetStageCounters
ActorExtendedTable_InstallCallback30AndDispatch: ; 0x02044818
    ldr r1, .L_02044834
    ldr ip, .L_02044838
    ldr r2, [r1, #0x30]
    ldr r1, [r1, #0x34]
    str r2, [r0, #0x218]
    str r1, [r0, #0x21c]
    bx ip
.L_02044834: .word data_020e0ac8
.L_02044838: .word ActorExtendedType2_SetCallbackPair130AndForwardD0
.size ActorExtendedTable_InstallCallback30AndDispatch, . - ActorExtendedTable_InstallCallback30AndDispatch
