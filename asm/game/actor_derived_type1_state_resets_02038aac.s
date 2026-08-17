; Matching retail form; see src/game/actor_derived_type1_state_resets.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern Actor_RefreshTerrainHeight
.extern Type7AuxiliaryPresentation_Reset
.extern AuxiliaryInteraction_Destroy
.extern gGameWork

    .global ActorDerivedType1_ResetToBaseState
    .type ActorDerivedType1_ResetToBaseState, @function
ActorDerivedType1_ResetToBaseState: ; 0x02038aac
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r5, [r4, #0x26c]
    cmp r5, #0x0
    beq .L_02038aec
    beq .L_02038ad4
    mov r0, r5
    bl AuxiliaryInteraction_Destroy
    mov r0, r5
    bl Heap_Free
.L_02038ad4:
    mov r1, #0x0
    ldr r0, .L_02038b5c
    str r1, [r4, #0x26c]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02038b60
    bl GameWork_ClearFlag
.L_02038aec:
    ldr r1, [r4, #0x10]
    mov r0, #0x1
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    strh r0, [r4, #0xd8]
    strh r0, [r4, #0xd6]
    mov r1, #0x0
    strh r1, [r4, #0xdc]
    mov r0, r4
    strh r1, [r4, #0xda]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0x270]
    cmp r0, #0x0
    beq .L_02038b30
    bl Type7AuxiliaryPresentation_Reset
.L_02038b30:
    mov r1, #0x0
    str r1, [r4, #0x44]
    str r1, [r4, #0x40]
    str r1, [r4, #0x3c]
    mov r0, r4
    strb r1, [r4, #0x26b]
    bl Actor_RefreshTerrainHeight
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x800000
    str r0, [r4, #0x230]
    ldmia sp!, {r3, r4, r5, pc}
.L_02038b5c: .word gGameWork
.L_02038b60: .word 0x3ee
    .size ActorDerivedType1_ResetToBaseState, . - ActorDerivedType1_ResetToBaseState
