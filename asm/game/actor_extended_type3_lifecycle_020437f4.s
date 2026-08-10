; Matching retail form; see src/game/actor_extended_type3_lifecycle.c.
.text
.extern data_020dfec0
.extern data_020e0290
.extern NoOpDestructor
.extern ActorExtendedType2_Init
.extern func_020c0c24
.global ActorExtendedRecordArray_Destroy
.type ActorExtendedRecordArray_Destroy, @function
ActorExtendedRecordArray_Destroy: ; 0x020437f4
    stmdb sp!, {r4, lr}
    ldr r1, .L_02043828
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_02043820
    mov r1, #0x8
    ldr r3, .L_0204382c
    mov r2, r1
    bl func_020c0c24
.L_02043820:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02043828: .word data_020dfec0
.L_0204382c: .word NoOpDestructor

.size ActorExtendedRecordArray_Destroy, . - ActorExtendedRecordArray_Destroy

.global ActorExtendedType3_Init
.type ActorExtendedType3_Init, @function
ActorExtendedType3_Init: ; 0x02043830
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02043860
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r0, #0x2
    strh r0, [r1, #0x98]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x9a]
    ldmia sp!, {r4, pc}
.L_02043860: .word data_020e0290
.size ActorExtendedType3_Init, . - ActorExtendedType3_Init
