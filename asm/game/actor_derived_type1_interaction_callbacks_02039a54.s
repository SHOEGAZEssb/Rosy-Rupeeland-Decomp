; Matching retail form; see src/game/actor_derived_type1_interaction_callbacks.c.
.text
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern data_020df4a4
.extern gGamePhaseRuntime
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern RuntimePresentationManager_AppendFirstListEffect
.extern SpriteNumberMotionPresentation_Init
.extern Type1Actor_TryEnterFailureState
.extern gHeapContext
.extern gGamePhaseCurrencyHud
.extern gSceneManager

    .global ActorDerivedType1_TryApplyInteractionAmount
    .type ActorDerivedType1_TryApplyInteractionAmount, @function
ActorDerivedType1_TryApplyInteractionAmount: ; 0x02039a54
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x270]
    mov r4, r2
    cmp r0, #0x0
    beq .L_02039a80
    ldrb r0, [r0, #0x10]
    tst r0, #0x1
    movne r0, #0x0
    bne .L_02039b7c
.L_02039a80:
    ldr r0, [r6, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02039b7c
    cmp r1, #0x0
    ble .L_02039b78
    ldr r0, [r6, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02039b54
    ldr r0, .L_02039b84
    rsb r4, r1, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r4
    mov r2, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_02039b88
    ldr r3, .L_02039b8c
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02039b2c
    ldr r0, .L_02039b90
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov ip, #0x2000
    mov r1, r0
    mov r0, r5
    mov r2, r6
    mov r3, r4
    str ip, [sp, #0x0]
    sub r4, ip, #0x20c0
    str r4, [sp, #0x4]
    bl SpriteNumberMotionPresentation_Init
    mov r5, r0
.L_02039b2c:
    ldr r0, .L_02039b90
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    mov r0, r6
    bl Type1Actor_TryEnterFailureState
    mov r0, #0x1
    b .L_02039b7c
.L_02039b54:
    ldr r0, .L_02039b94
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4c]
    mov r1, r4
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xcc]
    blx r2
    b .L_02039b7c
.L_02039b78:
    mov r0, #0x0
.L_02039b7c:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02039b84: .word gGamePhaseCurrencyHud
.L_02039b88: .word data_020df4a4
.L_02039b8c: .word gHeapContext
.L_02039b90: .word gGamePhaseRuntime
.L_02039b94: .word gSceneManager
    .size ActorDerivedType1_TryApplyInteractionAmount, . - ActorDerivedType1_TryApplyInteractionAmount
