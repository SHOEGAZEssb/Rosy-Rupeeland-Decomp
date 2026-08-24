; Matching retail form; see src/game/actor_derived_type1_constructor.c.
.text
.extern data_020df3c8
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_SetComponents
.extern ActorDerivedRuntime_Init
.extern Type7MarkerPresentation_Init

    .global ActorDerivedType1_Init
    .type ActorDerivedType1_Init, @function
ActorDerivedType1_Init: ; 0x02035060
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    mov r1, #0x0
    ldr ip, .L_02035184
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x238
    str ip, [r4, #0x0]
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    str r2, [r4, #0x248]
    add r1, r4, #0x200
    strh r2, [r1, #0x4c]
    strh r2, [r1, #0x4e]
    strh r2, [r1, #0x50]
    add r0, r4, #0x254
    strh r2, [r1, #0x52]
    bl VecFx32Object_Init
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x66]
    strh r1, [r0, #0x68]
    strb r1, [r4, #0x26b]
    str r1, [r4, #0x26c]
    str r1, [r4, #0x270]
    str r1, [r4, #0x274]
    str r1, [r4, #0x278]
    str r1, [r4, #0x27c]
    strh r1, [r0, #0x80]
    strh r1, [r0, #0x82]
    add r0, r4, #0x284
    bl VecFx32Object_Init
    mvn r1, #0x0
    add r0, r4, #0x200
    strh r1, [r0, #0x94]
    mov r1, #0x0
    strh r1, [r0, #0x96]
    strh r1, [r0, #0x98]
    strh r1, [r0, #0x9a]
    strh r1, [r0, #0x9c]
    strh r1, [r0, #0x9e]
    strb r1, [r4, #0x2a0]
    strb r1, [r4, #0x2a1]
    strh r1, [r0, #0xa2]
    strh r1, [r0, #0xa4]
    add r0, r4, #0x2a8
    mov r1, r4
    bl Type7MarkerPresentation_Init
    mov r0, #0x1
    strb r0, [r4, #0x4d]
    mov r1, #0x0
    str r1, [r4, #0x230]
    add r0, r4, #0x200
    strh r1, [r0, #0x34]
    strh r1, [r0, #0x36]
    ldr r2, [r4, #0xd0]
    add r0, r4, #0x254
    bic r2, r2, #0x4
    str r2, [r4, #0xd0]
    ldr r3, [r4, #0x14]
    mov r2, r1
    orr r3, r3, #0x100000
    str r3, [r4, #0x14]
    mov r3, r1
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    add r0, r4, #0x200
    strh r1, [r0, #0x64]
    sub r1, r1, #0x1
    mov r0, r4
    strb r1, [r4, #0x26a]
    ldmia sp!, {r4, pc}
.L_02035184: .word data_020df3c8
    .size ActorDerivedType1_Init, . - ActorDerivedType1_Init

    .global ActorDerivedType1_Destroy

