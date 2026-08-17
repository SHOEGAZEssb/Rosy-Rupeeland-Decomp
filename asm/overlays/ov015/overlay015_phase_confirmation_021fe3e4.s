    .text
    .extern data_ov015_021febe8
    .extern data_ov015_021febf0
    .extern ActorDescriptor_GetPrimaryLabel
    .extern func_02095dd4
    .extern func_ov001_021fc7e4
    .extern func_ov001_021fc7f4
    .extern func_ov015_021fce30
    .extern Overlay015_UpdateRecords
    .extern func_ov015_021fdad4
    .extern func_ov015_021fde00
    .extern func_ov015_021fdeac
    .extern func_ov015_021fe548

/* Exact fallbacks for action-confirmation phase; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global func_ov015_021fe3e4

func_ov015_021fe3e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7e4
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021fe530
L_021fe404: ; jump table
    b L_021fe418 ; case 0
    b L_021fe44c ; case 1
    b L_021fe480 ; case 2
    b L_021fe4f4 ; case 3
    b L_021fe510 ; case 4
L_021fe418:
    ldr r1, [r4, #0xf0]
    add r2, r4, #0xfc
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov015_021fe548
    cmp r0, #0x0
    beq L_021fe530
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe530
L_021fe44c:
    ldr r0, [r0, #0xc]
    bl ActorDescriptor_GetPrimaryLabel
    mov r3, r0
    mov r0, r4
    mov r1, #0x12
    mov r2, #0x0
    bl func_ov015_021fde00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe530
L_021fe480:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_021fe530
    cmp r0, #0x1
    beq L_021fe4b4
    cmp r0, #0x2
    beq L_021fe4d4
    b L_021fe530
L_021fe4b4:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc7f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x2
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe530
L_021fe4d4:
    mov r0, r4
    bl func_ov015_021fdeac
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe530
L_021fe4f4:
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe540
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe530
L_021fe510:
    mov r0, r4
    bl func_ov015_021fdeac
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, L_021fe544
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fe530:
    mov r0, r4
    bl Overlay015_UpdateRecords
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe540: .word data_ov015_021febf0
L_021fe544: .word data_ov015_021febe8

    .size func_ov015_021fe3e4, . - func_ov015_021fe3e4
