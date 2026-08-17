; Matching retail form; see src/game/actor_derived_type1_state_resets.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern Type7AuxiliaryPresentation_EnterRaisedState
.extern AuxiliaryInteraction_Destroy
.extern gGameWork

    .global ActorDerivedType1_ResetToDisabledState
    .type ActorDerivedType1_ResetToDisabledState, @function
ActorDerivedType1_ResetToDisabledState: ; 0x02038b64
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r5, [r4, #0x26c]
    cmp r5, #0x0
    beq .L_02038ba4
    beq .L_02038b8c
    mov r0, r5
    bl AuxiliaryInteraction_Destroy
    mov r0, r5
    bl Heap_Free
.L_02038b8c:
    mov r1, #0x0
    ldr r0, .L_02038c14
    str r1, [r4, #0x26c]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02038c18
    bl GameWork_ClearFlag
.L_02038ba4:
    mov r0, #0x8
    strh r0, [r4, #0xd8]
    strh r0, [r4, #0xd6]
    mov r1, #0x0
    strh r1, [r4, #0xdc]
    mov r0, r4
    strh r1, [r4, #0xda]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x18
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x800000
    str r0, [r4, #0x230]
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    beq .L_02038bf4
    bl Type7AuxiliaryPresentation_EnterRaisedState
.L_02038bf4:
    mov r0, #0x0
    str r0, [r4, #0x94]
    str r0, [r4, #0x90]
    str r0, [r4, #0x8c]
    str r0, [r4, #0x44]
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02038c14: .word gGameWork
.L_02038c18: .word 0x3ee
    .size ActorDerivedType1_ResetToDisabledState, . - ActorDerivedType1_ResetToDisabledState
