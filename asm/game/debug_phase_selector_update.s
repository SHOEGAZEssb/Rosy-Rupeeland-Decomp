; Matching retail form; see src/game/debug_phase_selector_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern DebugText_BeginFrame
.extern DebugPhaseGridCanvas_DrawPage
.extern DebugMenu_Create
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern Heap_Alloc
.extern ScenarioSelectMenu_Construct
.extern DebugPhaseGridCanvas_DrawGrid
.extern DisplayBrightness_IsMainTransitionComplete
.extern GamePhase_Start
.extern gScenarioSelectMenuAllocationTag
.extern gHeapContext
.extern gSystemState
.global DebugPhaseSelector_Update
DebugPhaseSelector_Update:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl DebugText_BeginFrame
    ldr r1, [r4, #0x2c]
    ldr r2, [r4, #0x30]
    add r0, r4, #0x34
    bl DebugPhaseGridCanvas_DrawPage
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0200c394
    cmp r0, #0x1
    beq L_0200c55c
    b L_0200c59c
L_0200c394:
    ldr r1, L_0200c5a4
    ldrh r3, [r1, #0x6]
    tst r3, #0x2
    beq L_0200c3c8
    cmp r4, #0x0
    beq L_0200c3bc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200c3bc:
    bl DebugMenu_Create
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200c3c8:
    ldr r2, [r4, #0x28]
    mvn r0, #0x0
    cmp r2, r0
    beq L_0200c400
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r0, [r4, #0x24]
    add r0, r0, #0x1
    str r0, [r4, #0x24]
    b L_0200c59c
L_0200c400:
    tst r3, #0x4
    beq L_0200c454
    ldr r2, L_0200c5a8
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bl DebugText_BeginFrame
    ldr r1, L_0200c5ac
    ldr r3, L_0200c5b0
    mov r0, #0xb8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200c59c
    bl ScenarioSelectMenu_Construct
    b L_0200c59c
L_0200c454:
    tst r3, #0x1
    beq L_0200c4a4
    ldr r2, [r4, #0x2c]
    ldr r1, [r4, #0x30]
    mov r0, #0xa
    mla r2, r1, r0, r2
    ldr r1, [r4, #0x48]
    mov r0, #0x5a
    mla r2, r1, r0, r2
    mov r0, #0x2
    mov r1, #0x10
    str r2, [r4, #0x28]
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r0, [r4, #0x24]
    add r0, r0, #0x1
    str r0, [r4, #0x24]
    b L_0200c59c
L_0200c4a4:
    tst r3, #0x100
    beq L_0200c4d0
    ldr r0, [r4, #0x48]
    add r0, r0, #0x1
    str r0, [r4, #0x48]
    cmp r0, #0x2
    movgt r0, #0x0
    strgt r0, [r4, #0x48]
    add r0, r4, #0x34
    bl DebugPhaseGridCanvas_DrawGrid
    b L_0200c59c
L_0200c4d0:
    ldrh r0, [r1, #0xa]
    tst r0, #0x40
    beq L_0200c4f4
    ldr r0, [r4, #0x30]
    subs r0, r0, #0x1
    str r0, [r4, #0x30]
    movmi r0, #0x8
    strmi r0, [r4, #0x30]
    b L_0200c59c
L_0200c4f4:
    tst r0, #0x80
    beq L_0200c518
    ldr r0, [r4, #0x30]
    add r0, r0, #0x1
    str r0, [r4, #0x30]
    cmp r0, #0x9
    movge r0, #0x0
    strge r0, [r4, #0x30]
    b L_0200c59c
L_0200c518:
    tst r0, #0x20
    beq L_0200c538
    ldr r0, [r4, #0x2c]
    subs r0, r0, #0x1
    str r0, [r4, #0x2c]
    movmi r0, #0x9
    strmi r0, [r4, #0x2c]
    b L_0200c59c
L_0200c538:
    tst r0, #0x10
    beq L_0200c59c
    ldr r0, [r4, #0x2c]
    add r0, r0, #0x1
    str r0, [r4, #0x2c]
    cmp r0, #0xa
    movge r0, #0x0
    strge r0, [r4, #0x2c]
    b L_0200c59c
L_0200c55c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0200c59c
    ldr r5, [r4, #0x28]
    bl DebugText_BeginFrame
    cmp r4, #0x0
    beq L_0200c588
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200c588:
    add r0, r5, #0x1
    mov r1, #0x0
    bl GamePhase_Start
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200c59c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0200c5a4: .word gSystemState
L_0200c5a8: .word 0x4001000
L_0200c5ac: .word gScenarioSelectMenuAllocationTag
L_0200c5b0: .word gHeapContext
.size DebugPhaseSelector_Update, . - DebugPhaseSelector_Update
