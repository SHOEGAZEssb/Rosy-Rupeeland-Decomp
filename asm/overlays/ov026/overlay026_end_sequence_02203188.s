.text

/* Exact fallback; see src/overlays/ov026/overlay026_end_sequence.c. */
.extern data_ov026_022041ac
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern Presentation_SetScript
.extern Presentation_InterpolateScalar
.extern Presentation_IsScriptComplete
.extern PresentationList_DeleteAll
.extern func_ov026_021fe8fc
.extern func_ov026_022009dc
.extern func_ov026_02203168
.extern func_ov026_02203178


    .global func_ov026_02203188
func_ov026_02203188:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    ldr r5, L_0220337c
    add lr, sp, #0x10
    mov r4, r0
    mov ip, #0x4
L_022031a0:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne L_022031a0
    ldr r0, [r4, #0x79c]
    cmp r0, #0x0
    beq L_022031c8
    cmp r0, #0x1
    beq L_02203320
    b L_02203368
L_022031c8:
    add r0, r4, #0x304
    bl PresentationList_DeleteAll
    ldr r2, L_02203380
    add r0, r4, #0x1c0
    mvn r1, #0xd5
    mov r3, #0x0
    bl func_ov026_02203168
    ldr r1, L_02203384
    ldr r0, [r4, #0x2e8]
    add r2, r1, #0x4800
    sub r3, r1, #0x1400
    bl Presentation_SetPosition
    ldr r1, L_02203384
    ldr r0, [r4, #0x2ec]
    rsb r2, r1, #0x2400
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r0, [r4, #0x160]
    add r1, sp, #0x10
    mov r2, #0x0
    bl Presentation_SetScript
    ldr r5, [r4, #0x164]
    ldr r1, L_02203388
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0x18000
    str r0, [r5, #0xb8]
    mov r1, #0x0
    ldr r0, [r4, #0x16c]
    mov r2, #0x1000
    mov r3, r1
    bl Presentation_SetPosition
    mov r0, #0x1000
    str r0, [sp, #0x0]
    mov r0, #0x1800
    str r0, [sp, #0x4]
    ldr r1, L_0220338c
    mov r0, #0xcd
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    add r3, r0, #0x400
    ldr r0, [r4, #0x16c]
    ldr r1, L_02203390
    mov r2, #0x40
    bl func_ov026_021fe8fc
    ldr r5, [r4, #0x168]
    ldr r1, L_02203388
    add r0, r5, #0x1c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0x6c
    mov r1, #0x4000
    bl PresentationScalar_SetImmediate
    mov r0, #0xa000
    str r0, [r5, #0xb4]
    ldr r0, [r4, #0x17c]
    ldr r1, L_02203394
    ldr r2, L_02203398
    mov r3, #0x6000
    bl Presentation_SetPosition
    ldr r0, [r4, #0x17c]
    ldr r1, L_0220339c
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    add r0, r0, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x17c]
    mov r1, #0x0
    str r1, [r0, #0xa0]
    ldr r0, [r4, #0x17c]
    mov r1, #0x1
    add r0, r0, #0xc
    mov r2, #0x2000
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x17c]
    mov r0, #0xb4
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x79c]
    add r0, r0, #0x1
    str r0, [r4, #0x79c]
L_02203320:
    mov r2, #0x4000
    ldr r0, [r4, #0x160]
    sub r3, r2, #0x6000
    mov r1, #0x1
    bl Presentation_InterpolateScalar
    mov r2, r0
    mov r1, #0x0
    ldr r0, [r4, #0x74]
    mov r3, r1
    bl func_ov026_02203178
    ldr r0, [r4, #0x160]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_02203368
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x1
    b L_02203374
L_02203368:
    mov r0, r4
    bl func_ov026_022009dc
    mov r0, #0x0
L_02203374:
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
L_0220337c: .word data_ov026_022041ac
L_02203380: .word 0xffa
L_02203384: .word 0x19a
L_02203388: .word 0xffff2333
L_0220338c: .word 0x666
L_02203390: .word 0x4210
L_02203394: .word 0x4214
L_02203398: .word 0xffff5571
L_0220339c: .word 0xab33
.size func_ov026_02203188, .-func_ov026_02203188

