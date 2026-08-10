; Matching retail form; see src/game/actor_derived_type1_contact_position.c.
.text
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern Actor_GetCachedTerrainHeight
.extern Actor_QueryTerrainHeight

    .global ActorDerivedType1_BuildContactPosition
    .type ActorDerivedType1_BuildContactPosition, @function
ActorDerivedType1_BuildContactPosition: ; 0x02038c4c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r5, r1
    add r1, r5, #0x200
    ldrsh r3, [r1, #0x4c]
    mov r6, r0
    mov r4, r2
    add r0, r3, #0x1
    strh r0, [r1, #0x4c]
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02038d24
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    ldrsh r0, [r5, #0xd6]
    sub r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_02038d0c
    ldr r1, [r5, #0x1c]
    ldr r0, [r4, #0x1c]
    ldr r2, [r5, #0x20]
    sub r0, r0, r1
    cmp r0, #0x0
    movgt r4, #0x1
    mvnle r4, #0x0
    add r8, r4, r1, asr #0x10
    mov r0, r5
    mov r1, r8
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r7, r0, lsl #0x4
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    cmp r0, r7, lsl #0xc
    bne .L_02038d0c
    mov r0, r8, lsl #0x10
    str r0, [sp, #0x4]
    cmp r4, #0x0
    addgt r0, r0, #0xf000
    strgt r0, [sp, #0x4]
.L_02038d0c:
    add r1, sp, #0x0
    mov r0, r6
    bl VecFx32Object_InitCopy
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_02038d30
.L_02038d24:
    mov r0, r6
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
.L_02038d30:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size ActorDerivedType1_BuildContactPosition, . - ActorDerivedType1_BuildContactPosition
