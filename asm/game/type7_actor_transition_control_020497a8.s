; Matching retail form; see src/game/type7_actor_transition_control.c.
.extern gType7ActorPresentationEffectAllocationTag
.extern gHeapContext
.extern Heap_Alloc
.extern AuxiliaryTimedSpritePresentation_Init
.extern Type7Actor_SelectRandomCallback
.extern Type7Actor_DispatchCurrentCallback
.extern Type7Actor_TryAcquireTarget
.extern func_020ada8c
.text
    .global Type7Actor_EnterMode1WithPresentation12
.type Type7Actor_EnterMode1WithPresentation12, @function
Type7Actor_EnterMode1WithPresentation12: ; 0x020497a8
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    mov r4, r0
    blx r2
    mov r0, #0xc
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size Type7Actor_EnterMode1WithPresentation12, . - Type7Actor_EnterMode1WithPresentation12

    .global Type7Actor_UpdateFlag200PresentationEffect
.type Type7Actor_UpdateFlag200PresentationEffect, @function
Type7Actor_UpdateFlag200PresentationEffect: ; 0x020497d0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r0, [r4, #0x268]
    tst r0, #0x200
    beq .L_0204986c
    mov r0, #0xe
    strh r0, [r4, #0xd6]
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x48]
    mov r1, #0x14
    bl func_020ada8c
    cmp r0, #0x5
    bne .L_02049874
    ldr r1, .L_02049880
    ldr r3, .L_02049884
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02049874
    ldr r3, .L_02049888
    mov r1, #0xc
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0xd
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
    b .L_02049874
.L_0204986c:
    mov r0, #0xd
    strh r0, [r4, #0xd6]
.L_02049874:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_02049880: .word gType7ActorPresentationEffectAllocationTag
.L_02049884: .word gHeapContext
.L_02049888: .word 0x162c
.size Type7Actor_UpdateFlag200PresentationEffect, . - Type7Actor_UpdateFlag200PresentationEffect

    .global Type7Actor_ResolveFlag200TargetTransition
.type Type7Actor_ResolveFlag200TargetTransition, @function
Type7Actor_ResolveFlag200TargetTransition: ; 0x0204988c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    tst r1, #0x200
    beq .L_020498d8
    bic r2, r1, #0x200
    mov r1, #0x0
    str r2, [r4, #0x268]
    bl Type7Actor_TryAcquireTarget
    cmp r0, #0x0
    beq .L_020498d8
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_020498d8:
    mov r0, r4
    bl Type7Actor_SelectRandomCallback
    ldmia sp!, {r4, pc}
.size Type7Actor_ResolveFlag200TargetTransition, . - Type7Actor_ResolveFlag200TargetTransition

    .global Type7Actor_DispatchCallbackOrReturnToMode0
.type Type7Actor_DispatchCallbackOrReturnToMode0, @function
Type7Actor_DispatchCallbackOrReturnToMode0: ; 0x020498e4
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x10]
    tst r1, #0x4
    bne .L_020498fc
    bl Type7Actor_DispatchCurrentCallback
    b .L_02049914
.L_020498fc:
    mov r1, #0xc
    strh r1, [r0, #0xd6]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02049914:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size Type7Actor_DispatchCallbackOrReturnToMode0, . - Type7Actor_DispatchCallbackOrReturnToMode0

