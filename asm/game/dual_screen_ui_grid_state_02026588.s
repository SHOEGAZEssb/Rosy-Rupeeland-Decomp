; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern Heap_Alloc
.extern data_020c3704
.extern data_020d6b58
.extern gGamePhaseRuntime
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern GridMotion_ResetWithVelocity
.extern DualScreenUiGridState_IsRuntimeEligible
.extern DualScreenUiGridState_RefreshTransitionFrames
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReleaseState
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_020befec
.extern gDebugFont
.extern gHeapContext

    .global DualScreenUiGridState_Rebuild
    .type DualScreenUiGridState_Rebuild, @function
DualScreenUiGridState_Rebuild: ; 0x02026588
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xc
    ldr r2, .L_02026970
    mov r9, r0
    ldr r0, [r2, #0x0]
    mov r8, r1
    add r0, r0, #0x2000
    ldr r7, [r0, #0xea8]
    ldrh r0, [r7, #0x4e]
    strh r0, [r9, #0x74]
    ldr r0, [r9, #0x0]
    cmp r0, #0x0
    beq .L_020265e0
    ldr r1, [r9, #0x6c]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r0, [r9, #0xc]
    cmp r0, #0x0
    beq .L_02026798
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    b .L_02026798
.L_020265e0:
    ldr r0, .L_02026974
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r9, #0x0]
    ldr r1, .L_02026978
    ldr r3, .L_0202697c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202661c
    ldr r1, .L_02026980
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_0202661c:
    ldr r1, .L_02026978
    str r0, [r9, #0x4]
    ldr r3, .L_0202697c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202664c
    ldr r1, .L_02026984
    sub r2, r1, #0x2
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0202664c:
    mov r6, #0x0
    str r0, [r9, #0x8]
    mov r5, r6
    mov r4, #0x2
    mov r10, #0xc
.L_02026660:
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r0, [r9, #0x0]
    ldr r1, [r9, #0x8]
    mov r2, r4
    mov r3, r5
    bl GraphicsSpriteState_Create
    mov r2, r6, lsr #0x1f
    rsb r1, r2, r6, lsl #0x1e
    add r2, r2, r1, ror #0x1e
    mul r1, r2, r10
    mov r2, r6, asr #0x1
    add r2, r6, r2, lsr #0x1e
    add r3, r9, r6, lsl #0x2
    mov r2, r2, asr #0x2
    add r6, r6, #0x1
    rsb r2, r2, r2, lsl #0x4
    str r0, [r3, #0x14]
    add r1, r1, #0xcf
    strh r1, [r0, #0x2c]
    add r1, r2, #0x6a
    strh r1, [r0, #0x2e]
    cmp r6, #0x14
    blt .L_02026660
    mov r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x2
    stmib sp, {r0, r3}
    ldmia r9, {r0, r1}
    mov r2, #0x1
    bl GraphicsSpriteState_Create
    mov r2, #0x0
    str r0, [r9, #0x64]
    mov r1, #0xd8
    strh r1, [r0, #0x2c]
    mov r1, #0x31
    strh r1, [r0, #0x2e]
    mov r0, #0x40
    str r0, [sp, #0x0]
    mov r0, #0x2
    stmib sp, {r0, r2}
    ldmia r9, {r0, r1}
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r9, #0x68]
    mov r2, #0xd8
    strh r2, [r0, #0x2c]
    mov r2, #0x32
    strh r2, [r0, #0x2e]
    ldr r1, .L_02026978
    ldr r3, .L_0202697c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02026754
    ldr r1, .L_02026988
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02026754:
    str r0, [r9, #0x10]
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r9, #0x0]
    ldr r1, [r9, #0x10]
    mov r2, #0x1
    bl GraphicsSpriteState_Create
    str r0, [r9, #0x70]
    mov r1, #0xd8
    strh r1, [r0, #0x2c]
    mov r1, #0x59
    strh r1, [r0, #0x2e]
    mov r0, #0x0
    strb r0, [r9, #0x8d]
.L_02026798:
    ldr r1, .L_02026978
    ldr r3, .L_0202697c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020267c8
    ldr r3, [r7, #0x29c]
    ldrh r1, [r3, #0x1a]
    ldrh r2, [r3, #0x1c]
    ldrh r3, [r3, #0x1e]
    bl AnimationResource_Init
.L_020267c8:
    str r0, [r9, #0xc]
    mov r2, #0x0
    mov r0, #0x20
    stmia sp, {r0, r2}
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r9, #0x0]
    ldr r1, [r9, #0xc]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r9, #0x6c]
    mov r1, #0xd8
    strh r1, [r0, #0x2c]
    mov r1, #0x31
    strh r1, [r0, #0x2e]
    cmp r8, #0x0
    moveq r0, #0x0
    beq .L_02026820
    ldr r0, [r7, #0x1fc]
    mov r1, #0x64
    add r0, r0, #0x63
    bl func_020befec
.L_02026820:
    strh r0, [r9, #0x78]
    mov r0, #0x1
    strh r0, [r9, #0x7a]
    mov r0, #0x0
    strh r0, [r9, #0x76]
    ldr r0, [r7, #0x200]
    mov r1, #0x12c
    bl func_020befec
    strh r0, [r9, #0x8e]
    mov r2, #0x0
    b .L_02026864
.L_0202684c:
    add r0, r9, r2, lsl #0x2
    ldr r1, [r0, #0x14]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_02026864:
    ldrh r0, [r9, #0x8e]
    cmp r2, r0
    blt .L_0202684c
    b .L_0202688c
.L_02026874:
    add r0, r9, r2, lsl #0x2
    ldr r1, [r0, #0x14]
    add r2, r2, #0x1
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_0202688c:
    cmp r2, #0x14
    blt .L_02026874
    cmp r8, #0x0
    bne .L_020268a8
    add r0, r9, #0x7c
    mov r1, #0x6000
    bl GridMotion_ResetWithVelocity
.L_020268a8:
    mov r2, #0x0
    mov r1, #0xff
.L_020268b0:
    add r0, r9, r2
    add r2, r2, #0x1
    strb r1, [r0, #0x90]
    cmp r2, #0x14
    blt .L_020268b0
    cmp r8, #0x0
    bne .L_02026900
    mov r0, r9
    bl DualScreenUiGridState_RefreshTransitionFrames
    mov r0, r7
    bl DualScreenUiGridState_IsRuntimeEligible
    cmp r0, #0x0
    beq .L_02026968
    ldrb r0, [r9, #0x8c]
    mov r1, #0x1
    bic r0, r0, #0x1
    strb r0, [r9, #0x8c]
    ldr r0, [r9, #0x0]
    str r1, [r0, #0x20]
    b .L_02026968
.L_02026900:
    ldrsh r7, [r9, #0x78]
    mov r8, #0x0
    ldr r4, .L_0202698c
    mov r5, r8
    mov r6, #0x3
.L_02026914:
    mov r10, r7
    cmp r7, #0x3
    movgt r10, r6
    bgt .L_0202692c
    cmp r7, #0x0
    movlt r10, r5
.L_0202692c:
    add r0, r9, r8, lsl #0x2
    ldrb r1, [r4, r10]
    ldr r0, [r0, #0x14]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r9, r8, lsl #0x2
    ldr r2, [r0, #0x14]
    add r0, r9, r8
    ldrh r1, [r2, #0x24]
    add r8, r8, #0x1
    cmp r8, #0x14
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    strb r10, [r0, #0x90]
    sub r7, r7, #0x3
    blt .L_02026914
.L_02026968:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_02026970: .word gGamePhaseRuntime
.L_02026974: .word gDebugFont
.L_02026978: .word data_020d6b58
.L_0202697c: .word gHeapContext
.L_02026980: .word 0x32b2
.L_02026984: .word 0x32b5
.L_02026988: .word 0x1664
.L_0202698c: .word data_020c3704
    .size DualScreenUiGridState_Rebuild, . - DualScreenUiGridState_Rebuild
