    .text
    .extern GameWork_SetFlag
    .extern GameWork_TestFlag
    .extern data_ov015_021febb8
    .extern data_ov015_021fec20
    .extern ActorDescriptor_GetPrimaryLabel
    .extern SceneSound_PlayPackedEffect
    .extern ModalState_UpdateInput
    .extern func_ov001_021fc39c
    .extern func_ov001_021fc7e4
    .extern Overlay001_MergeActiveCell
    .extern func_ov015_021fce30
    .extern Overlay015_UpdateRecords
    .extern func_ov015_021fdad4
    .extern func_ov015_021fde00
    .extern func_ov015_021fe548
    .extern gGameWork

/* Exact fallbacks for auxiliary action phase; see src/overlays/ov015/overlay015_terminal_phases.c. */
    .global func_ov015_021fe828

func_ov015_021fe828:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7e4
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fe994
L_021fe848: ; jump table
    b L_021fe858 ; case 0
    b L_021fe898 ; case 1
    b L_021fe904 ; case 2
    b L_021fe954 ; case 3
L_021fe858:
    ldr r1, [r4, #0xf0]
    add r2, r4, #0xfc
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov015_021fe548
    cmp r0, #0x0
    beq L_021fe994
    ldr r1, L_021fe9a4
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe994
L_021fe898:
    ldr r0, [r4, #0xdc]
    ldr r2, [r4, #0xec]
    mov r1, #0x1
    bl Overlay001_MergeActiveCell
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r0, L_021fe9a8
    ldr r1, L_021fe9ac
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fe8dc
    ldr r1, L_021fe9b0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe994
L_021fe8dc:
    ldr r0, L_021fe9a8
    ldr r1, L_021fe9ac
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe994
L_021fe904:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x1e
    ble L_021fe994
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc39c
    ldr r0, [r4, #0xec]
    bl ActorDescriptor_GetPrimaryLabel
    mov r3, r0
    mov r0, r4
    mov r1, #0x10
    mov r2, #0x1
    bl func_ov015_021fde00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe994
L_021fe954:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_021fe994
    ldr r0, L_021fe9a8
    mov r1, #0x3b0
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_021fe9b4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fe994:
    mov r0, r4
    bl Overlay015_UpdateRecords
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe9a4: .word 0x4104
L_021fe9a8: .word gGameWork
L_021fe9ac: .word 0x3af
L_021fe9b0: .word data_ov015_021fec20
L_021fe9b4: .word data_ov015_021febb8

    .size func_ov015_021fe828, . - func_ov015_021fe828
