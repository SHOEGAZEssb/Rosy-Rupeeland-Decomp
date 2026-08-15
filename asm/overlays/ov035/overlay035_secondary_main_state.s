.text

/* Exact fallback; see src/overlays/ov035/overlay035_secondary_main_state.c for documented portable C. */

    .extern func_02059278
    .extern Presentation_SetScript
    .extern Presentation_IsScriptSuspended
    .extern Sound_Play
    .extern Heap_Alloc
    .extern func_ov035_021fd7f0
    .extern PresentationList_Append
    .extern Presentation_IsScriptComplete
    .extern func_0205929c
    .extern func_ov035_021ff164
    .extern gSoundContext
    .extern data_ov035_02203344
    .extern data_ov035_02203434
    .extern data_ov035_02203274
    .extern data_ov035_02202fd0
    .extern data_ov035_02203038
    .extern data_ov035_02202dc0
    .extern data_ov035_02203d50
    .extern gHeapContext


    .global func_ov035_021ff190
func_ov035_021ff190: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xa0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b L_021ff384
L_021ff1a8: ; jump table
    b L_021ff1c0 ; case 0
    b L_021ff230 ; case 1
    b L_021ff274 ; case 2
    b L_021ff2c0 ; case 3
    b L_021ff318 ; case 4
    b L_021ff378 ; case 5
L_021ff1c0:
    ldr r0, L_021ff394
    mov r1, #0xb5
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r0, [r4, #0x100]
    ldr r1, L_021ff398
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x104]
    ldr r1, L_021ff39c
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xfc]
    ldr r1, L_021ff3a0
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xd8]
    ldr r1, L_021ff3a4
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0x140]
    ldr r1, L_021ff3a8
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
L_021ff230:
    ldr r0, [r4, #0x104]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ff384
    ldr r0, L_021ff394
    ldr r1, L_021ff3ac
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    ldr r0, [r4, #0x108]
    ldr r1, L_021ff3b0
    mov r2, #0x1
    bl Presentation_SetScript
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff384
L_021ff274:
    ldr r0, [r4, #0x108]
    bl Presentation_IsScriptSuspended
    cmp r0, #0x0
    beq L_021ff384
    ldr r0, [r4, #0x100]
    mov r2, #0x0
    str r2, [r0, #0x90]
    ldr r0, [r4, #0xfc]
    str r2, [r0, #0x90]
    ldr r1, [r4, #0x104]
    ldrh r0, [r1, #0x98]
    orr r0, r0, #0x1
    strh r0, [r1, #0x98]
    ldr r0, [r4, #0x108]
    str r2, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff384
L_021ff2c0:
    ldr r1, L_021ff3b4
    ldr r3, L_021ff3b8
    mov r0, #0xa8
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_021ff2e4
    bl func_ov035_021fd7f0
    mov r1, r0
L_021ff2e4:
    add r0, r4, #0x12c
    bl PresentationList_Append
    ldr r0, [r4, #0x108]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_021ff384
    ldr r0, [r4, #0x100]
    mov r1, #0x0
    str r1, [r0, #0x90]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff384
L_021ff318:
    ldr r1, L_021ff3b4
    ldr r3, L_021ff3b8
    mov r0, #0xa8
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_021ff33c
    bl func_ov035_021fd7f0
    mov r1, r0
L_021ff33c:
    add r0, r4, #0x12c
    bl PresentationList_Append
    ldr r0, [r4, #0x100]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    beq L_021ff384
    ldr r0, L_021ff394
    mov r1, #0xb5
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl func_0205929c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff384
L_021ff378:
    bl func_ov035_021ff164
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021ff384:
    mov r0, r4
    bl func_ov035_021ff164
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff394: .word gSoundContext
L_021ff398: .word data_ov035_02203344
L_021ff39c: .word data_ov035_02203434
L_021ff3a0: .word data_ov035_02203274
L_021ff3a4: .word data_ov035_02202fd0
L_021ff3a8: .word data_ov035_02203038
L_021ff3ac: .word 0x1b5
L_021ff3b0: .word data_ov035_02202dc0
L_021ff3b4: .word data_ov035_02203d50
L_021ff3b8: .word gHeapContext
.size func_ov035_021ff190, .-func_ov035_021ff190

