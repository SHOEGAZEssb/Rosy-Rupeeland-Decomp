    .text
/* Exact fallback; see src/overlays/ov022/overlay022_emitter_runtime.c. */
    .extern data_ov022_022004b4
    .extern data_ov022_022006b4
    .extern Sound_PlayEffectWithParameters
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_0209189c
    .extern TitleRandom_NextBounded
    .extern func_02091b98
    .extern func_02091c7c
    .extern func_02091cf0
    .extern PresentationScalar_TransitionTo
    .extern Presentation_SetPosition
    .extern PresentationList_Append
    .extern func_ov022_021fce00
    .extern func_ov022_021fd2dc
    .extern gHeapContext
    .extern gSoundContext
    .extern Heap_Alloc

.global func_ov022_021fd068
func_ov022_021fd068:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    add r0, r6, #0x10
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r6, #0x58]
    ldr r1, [r6, #0x5c]
    sub r0, r0, r2
    add r4, r0, r1
    ldr r3, L_021fd2cc
    add r2, sp, #0xc
    mov r1, #0x7
L_021fd09c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne L_021fd09c
    cmp r4, #0x0
    beq L_021fd2b4
    add r0, r6, #0x2c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fd104
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, L_021fd2d0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x4f
    mov r3, #0x7f
    bl Sound_PlayEffectWithParameters
    add r0, r6, #0x64
    mov r1, #0xa
    mov r2, #0x14
    bl func_0209189c
    mov r1, r0
    add r0, r6, #0x2c
    bl func_02091b98
L_021fd104:
    mov r5, #0x0
    add r1, sp, #0xc
    b L_021fd148
L_021fd110:
    mov r0, r5, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r4, r0
    bgt L_021fd144
    bge L_021fd12c
    cmp r5, #0x0
    subne r5, r5, #0x1
L_021fd12c:
    add r0, sp, #0xc
    mov r1, r5, lsl #0x1
    ldrsh r0, [r0, r1]
    sub r0, r4, r0
    str r0, [r6, #0x5c]
    b L_021fd150
L_021fd144:
    add r5, r5, #0x1
L_021fd148:
    cmp r5, #0x6
    blt L_021fd110
L_021fd150:
    ldr r0, [r6, #0x0]
    add r1, r6, #0x4
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r3, [r6, #0x68]
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, r5
    ldmia r3, {r2, r3}
    mov r5, r0
    bl func_02073e48
    ldr r1, L_021fd2d4
    ldr r3, L_021fd2d8
    mov r0, #0xa4
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_021fd1b0
    ldr r2, [r6, #0x60]
    mov r1, r5
    bl func_ov022_021fce00
    mov r4, r0
L_021fd1b0:
    ldr r8, [r6, #0x68]
    add r0, r6, #0x64
    ldr r2, [r8, #0x8]
    ldr r7, [r8, #0xc]
    rsb r1, r2, #0x0
    bl func_0209189c
    mov r5, r0
    mov r2, r7
    add r0, r6, #0x64
    rsb r1, r7, #0x0
    bl func_0209189c
    ldr r1, [r6, #0x68]
    ldr r2, [r1, #0x0]
    ldr r1, [r8, #0x4]
    add r3, r2, r5
    add r2, r1, r0
    mov r1, r3, lsl #0xc
    mov r0, r4
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r5, [r6, #0x6c]
    add r0, r6, #0x64
    ldr r2, [r5, #0x8]
    rsb r1, r2, #0x0
    bl func_0209189c
    ldr r1, [r5, #0x0]
    ldr r2, [r5, #0xc]
    add r0, r1, r0
    mov r5, r0, lsl #0xc
    add r0, r6, #0x64
    rsb r1, r2, #0x0
    bl func_0209189c
    ldr r2, [r6, #0x6c]
    ldr r1, [r6, #0x60]
    ldr r2, [r2, #0x4]
    cmp r1, #0x0
    add r0, r2, r0
    mov r7, r0, lsl #0xc
    mov r2, r5
    add r0, r4, #0xc
    bne L_021fd274
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    mov r2, r7
    add r0, r4, #0x1c
    mov r1, #0x5
    bl PresentationScalar_TransitionTo
    b L_021fd28c
L_021fd274:
    mov r1, #0x5
    bl PresentationScalar_TransitionTo
    mov r2, r7
    add r0, r4, #0x1c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
L_021fd28c:
    add r0, r6, #0x64
    mov r1, #0x4
    bl TitleRandom_NextBounded
    mov r1, r0
    mov r0, r4
    add r1, r1, #0x18
    bl func_ov022_021fd2dc
    mov r1, r4
    add r0, r6, #0x48
    bl PresentationList_Append
L_021fd2b4:
    ldr r1, [r6, #0x20]
    add r0, r6, #0x10
    str r1, [r6, #0x58]
    bl func_02091cf0
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_021fd2cc: .word data_ov022_022004b4
L_021fd2d0: .word gSoundContext
L_021fd2d4: .word data_ov022_022006b4
L_021fd2d8: .word gHeapContext
.size func_ov022_021fd068, . - func_ov022_021fd068
