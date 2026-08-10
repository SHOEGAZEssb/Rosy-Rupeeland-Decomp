; Matching retail form; see src/game/actor_extended_type3_wrappers.c.
.text
.extern Heap_Free
.extern func_02005030
.extern func_02005058
.extern ActorExtendedType2_Destroy
.extern ActorExtendedType2_UpdateTargetMotion
.extern ActorExtendedType2_TryDescriptorInteraction120
.extern ActorExtendedType2_TryDescriptorInteraction128
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_020befec
.global ActorExtendedType3_Destroy
.type ActorExtendedType3_Destroy, @function
ActorExtendedType3_Destroy: ; 0x02043864
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedType3_Destroy, . - ActorExtendedType3_Destroy

.global ActorExtendedType3_DestroyAndFree
.type ActorExtendedType3_DestroyAndFree, @function
ActorExtendedType3_DestroyAndFree: ; 0x02043878
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

.size ActorExtendedType3_DestroyAndFree, . - ActorExtendedType3_DestroyAndFree

.global ActorExtendedType3_ForwardInteractionGateA
.type ActorExtendedType3_ForwardInteractionGateA, @function
ActorExtendedType3_ForwardInteractionGateA: ; 0x02043894
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl ActorExtendedType2_TryDescriptorInteraction120
    movs r4, r0
    beq .L_020438b8
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue2A
    add r1, r5, #0x200
    strh r0, [r1, #0x9a]
.L_020438b8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}

.size ActorExtendedType3_ForwardInteractionGateA, . - ActorExtendedType3_ForwardInteractionGateA

.global ActorExtendedType3_ForwardInteractionGateB
.type ActorExtendedType3_ForwardInteractionGateB, @function
ActorExtendedType3_ForwardInteractionGateB: ; 0x020438c0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl ActorExtendedType2_TryDescriptorInteraction128
    movs r4, r0
    beq .L_020438e4
    mov r0, r5
    bl ActorExtendedType2_GetDescriptorValue2A
    add r1, r5, #0x200
    strh r0, [r1, #0x9a]
.L_020438e4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}

.size ActorExtendedType3_ForwardInteractionGateB, . - ActorExtendedType3_ForwardInteractionGateB

.global ActorExtendedType3_ApplyTransformAndDampAxis
.type ActorExtendedType3_ApplyTransformAndDampAxis, @function
ActorExtendedType3_ApplyTransformAndDampAxis: ; 0x020438ec
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_02005030
    add r1, sp, #0x0
    mov r0, r4
    bl ActorExtendedType2_UpdateTargetMotion
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x0
    bne .L_02043930
    ldr r0, [r4, #0x40]
    mov r1, #0x3
    bl func_020befec
    str r0, [r4, #0x40]
    b .L_02043948
.L_02043930:
    cmp r0, #0x1
    bne .L_02043948
    ldr r0, [r4, #0x3c]
    mov r1, #0x3
    bl func_020befec
    str r0, [r4, #0x3c]
.L_02043948:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size ActorExtendedType3_ApplyTransformAndDampAxis, . - ActorExtendedType3_ApplyTransformAndDampAxis
