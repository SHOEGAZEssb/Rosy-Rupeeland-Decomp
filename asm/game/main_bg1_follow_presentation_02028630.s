; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern Heap_Alloc
.extern data_020de804
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_AppendFirstListEffect
.extern MainBg1FollowPresentation_Init
.extern gHeapContext

    .global MainBg1FollowPresentation_CreateAndRegister
    .type MainBg1FollowPresentation_CreateAndRegister, @function
MainBg1FollowPresentation_CreateAndRegister: ; 0x02028630
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02028678
    mov r5, r0
    ldr r4, [r1, #0x0]
    ldr r1, .L_0202867c
    ldr r3, .L_02028680
    mov r0, #0xc
    mov r2, #0x4
    add r4, r4, #0x37c
    bl Heap_Alloc
    movs r1, r0
    beq .L_0202866c
    mov r1, r5
    bl MainBg1FollowPresentation_Init
    mov r1, r0
.L_0202866c:
    add r0, r4, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    ldmia sp!, {r3, r4, r5, pc}
.L_02028678: .word gGamePhaseRuntime
.L_0202867c: .word data_020de804
.L_02028680: .word gHeapContext
    .size MainBg1FollowPresentation_CreateAndRegister, . - MainBg1FollowPresentation_CreateAndRegister

