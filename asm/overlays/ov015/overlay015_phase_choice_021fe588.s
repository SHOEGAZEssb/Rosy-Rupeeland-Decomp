    .text
    .extern data_ov015_021febb0
    .extern data_ov015_021febc0
    .extern data_ov015_021febc8
    .extern data_ov015_021febd8
    .extern ActorDescriptor_GetPrimaryLabel
    .extern SceneSound_PlayPackedEffect
    .extern ModalState_UpdateInput
    .extern func_ov001_021fc7e4
    .extern func_ov001_021fc7f4
    .extern func_ov001_021fc88c
    .extern func_ov015_021fce30
    .extern Overlay015_UpdateRecords
    .extern func_ov015_021fdad4
    .extern func_ov015_021fde00
    .extern func_ov015_021fdeac
    .extern func_ov015_021fe548
    .extern func_ov015_021fe560

/* Exact fallbacks for choice-resolution phase; see src/overlays/ov015/overlay015_terminal_phases.c. */
    .global func_ov015_021fe588

func_ov015_021fe588:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7e4
    ldr r1, [r4, #0x4]
    mov r5, r0
    cmp r1, #0xc
    addls pc, pc, r1, lsl #0x2
    b L_021fe804
L_021fe5ac: ; jump table
    b L_021fe5e0 ; case 0
    b L_021fe614 ; case 1
    b L_021fe68c ; case 2
    b L_021fe714 ; case 3
    b L_021fe730 ; case 4
    b L_021fe804 ; case 5
    b L_021fe804 ; case 6
    b L_021fe804 ; case 7
    b L_021fe804 ; case 8
    b L_021fe804 ; case 9
    b L_021fe754 ; case 10
    b L_021fe7c8 ; case 11
    b L_021fe7e4 ; case 12
L_021fe5e0:
    ldr r1, [r4, #0xf0]
    add r2, r4, #0xfc
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov015_021fe548
    cmp r0, #0x0
    beq L_021fe804
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe614:
    ldr r1, [r5, #0xc]
    mov r0, r4
    ldrh r1, [r1, #0x0]
    bl func_ov015_021fe560
    cmp r0, #0x0
    ldr r0, [r5, #0xc]
    beq L_021fe65c
    bl ActorDescriptor_GetPrimaryLabel
    mov r3, r0
    mov r0, r4
    mov r1, #0x26
    mov r2, #0x0
    bl func_ov015_021fde00
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe65c:
    bl ActorDescriptor_GetPrimaryLabel
    mov r3, r0
    mov r0, r4
    mov r1, #0x11
    mov r2, #0x0
    bl func_ov015_021fde00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe68c:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_021fe804
    cmp r0, #0x1
    beq L_021fe6c0
    cmp r0, #0x2
    beq L_021fe6f4
    b L_021fe804
L_021fe6c0:
    ldr r1, L_021fe814
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc88c
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe6f4:
    mov r0, r4
    bl func_ov015_021fdeac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe714:
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe818
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe804
L_021fe730:
    mov r0, r4
    bl func_ov015_021fdeac
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe81c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe804
L_021fe754:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_021fe804
    cmp r0, #0x1
    beq L_021fe788
    cmp r0, #0x2
    beq L_021fe7a8
    b L_021fe804
L_021fe788:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe7a8:
    mov r0, r4
    bl func_ov015_021fdeac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe804
L_021fe7c8:
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe820
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe804
L_021fe7e4:
    mov r0, r4
    bl func_ov015_021fdeac
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe824
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fe804:
    mov r0, r4
    bl Overlay015_UpdateRecords
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe814: .word 0x4102
L_021fe818: .word data_ov015_021febb0
L_021fe81c: .word data_ov015_021febd8
L_021fe820: .word data_ov015_021febc0
L_021fe824: .word data_ov015_021febc8

    .size func_ov015_021fe588, . - func_ov015_021fe588
