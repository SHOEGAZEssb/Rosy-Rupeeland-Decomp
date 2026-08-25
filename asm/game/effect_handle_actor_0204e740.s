; Matching retail form; see src/game/effect_handle_actor.c.
.extern Heap_Free
.extern data_020e2458
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern PresentationBackedActor_InitBase
.extern PresentationBackedActor_Destroy
.extern PresentationBackedActor_UpdateStateMachine
.extern Graphics3dPresentation_RemoveSpriteEffect
.extern Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
.extern Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds
.text

    .global EffectHandleActor_Init
EffectHandleActor_Init: ; 0x0204e740
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl PresentationBackedActor_InitBase
    ldr r1, .L_0204e770
    mov r0, #0x0
    str r1, [r4, #0x0]
    add r1, r4, #0x100
    strh r0, [r1, #0xfc]
    sub r2, r0, #0x1
    mov r0, r4
    strh r2, [r1, #0xfe]
    ldmia sp!, {r4, pc}
.L_0204e770: .word data_020e2458
.size EffectHandleActor_Init, . - EffectHandleActor_Init

    .global func_0204e774

func_0204e774: ; 0x0204e774
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0204e7c4
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x100
    ldrsh r5, [r0, #0xfe]
    mvn r0, #0x0
    cmp r5, r0
    beq .L_0204e7b4
    ldr r0, .L_0204e7c8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r5
    bl Graphics3dPresentation_RemoveSpriteEffect
.L_0204e7b4:
    mov r0, r4
    bl PresentationBackedActor_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0204e7c4: .word data_020e2458
.L_0204e7c8: .word gGamePhaseRuntime
.size func_0204e774, . - func_0204e774

    .global EffectHandleActor_Delete

EffectHandleActor_Delete: ; 0x0204e7cc
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0204e824
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x100
    ldrsh r5, [r0, #0xfe]
    mvn r0, #0x0
    cmp r5, r0
    beq .L_0204e80c
    ldr r0, .L_0204e828
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, r5
    bl Graphics3dPresentation_RemoveSpriteEffect
.L_0204e80c:
    mov r0, r4
    bl PresentationBackedActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0204e824: .word data_020e2458
.L_0204e828: .word gGamePhaseRuntime
.size EffectHandleActor_Delete, . - EffectHandleActor_Delete

    .global func_0204e82c

func_0204e82c: ; 0x0204e82c
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x54]
    ldrb r0, [r0, #0x38]
    cmp r0, #0x6
    blt .L_0204e928
    ldr r0, .L_0204e938
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r1, r4, #0x100
    ldrh r2, [r1, #0xec]
    cmp r2, #0x0
    bne .L_0204e8c4
    ldrsh r2, [r1, #0xfc]
    add r2, r2, #0x1
    strh r2, [r1, #0xfc]
    ldrsh r1, [r1, #0xfc]
    tst r1, #0x1f
    bne .L_0204e928
    mov r1, #0x28
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0xf
    str r1, [sp, #0x8]
    ldr r1, [r4, #0x24]
    ldr r3, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    mov r1, r1, asr #0xc
    mov r3, r3, asr #0xc
    rsb r1, r1, r2, asr #0xc
    sub r2, r3, #0x14
    sub r3, r1, #0x14
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset3To5SpriteEffectInBounds
    b .L_0204e928
.L_0204e8c4:
    ldrsh r2, [r1, #0xfe]
    mvn r1, #0x0
    cmp r2, r1
    bne .L_0204e928
    mov r1, #0x28
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r1, #0x46
    str r1, [sp, #0x8]
    ldr r1, [r4, #0x24]
    ldr r3, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    mov r1, r1, asr #0xc
    mov r3, r3, asr #0xc
    rsb r1, r1, r2, asr #0xc
    sub r3, r3, #0x14
    sub r2, r1, #0x14
    mov r1, r3, lsl #0x10
    mov r3, r2, lsl #0x10
    mov r2, r1, asr #0x10
    mov r3, r3, asr #0x10
    mov r1, #0x0
    bl Graphics3dPresentation_CreatePreset1To2SpriteEffectInBounds
    add r1, r4, #0x100
    strh r0, [r1, #0xfe]
.L_0204e928:
    mov r0, r4
    bl PresentationBackedActor_UpdateStateMachine
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0204e938: .word gGamePhaseRuntime
.size func_0204e82c, . - func_0204e82c

