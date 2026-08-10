; Matching retail form; see src/game/actor_extended_table_descriptor_gates.c.
.text
.extern func_0203f2ec
.extern ActorExtendedType2_GetDescriptorValue2C
.extern ActorExtendedTable_MatchesCallbackPair18
.extern ActorExtendedTable_MatchesCallbackPair00
.global ActorExtendedTable_FilterDescriptorOutput
.type ActorExtendedTable_FilterDescriptorOutput, @function
ActorExtendedTable_FilterDescriptorOutput: ; 0x020446c8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203f2ec
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl ActorExtendedTable_MatchesCallbackPair18
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl ActorExtendedTable_MatchesCallbackPair00
    cmp r0, #0x0
    moveq r0, #0x0
    streqh r0, [r4, #0x0]
    streqh r0, [r4, #0x2]
    streqh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.size ActorExtendedTable_FilterDescriptorOutput, . - ActorExtendedTable_FilterDescriptorOutput
