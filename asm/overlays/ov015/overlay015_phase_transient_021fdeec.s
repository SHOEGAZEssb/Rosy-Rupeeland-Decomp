    .text
    .extern data_ov015_021febd0
    .extern data_ov015_021fec18
    .extern func_02065468
    .extern func_02095dd4
    .extern func_ov001_021fc384
    .extern func_ov001_021fc39c
    .extern func_ov001_021fc3b4
    .extern func_ov001_021fc3dc
    .extern func_ov015_021fce30
    .extern func_ov015_021fdad4
    .extern func_ov015_021fde00
    .extern func_ov015_021fdeac

/* Exact fallbacks for transient-confirmation phase; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global func_ov015_021fdeec

func_ov015_021fdeec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fdf0c
    cmp r0, #0x1
    beq L_021fdf98
    b L_021fdfd8
L_021fdf0c:
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fdf20
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc3dc
L_021fdf20:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc3b4
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    beq L_021fdf84
    ldr r0, [r4, #0xdc]
    ldr r0, [r0, #0x204]
    bl func_02065468
    cmp r0, #0x0
    bne L_021fdf84
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc39c
    mov r0, r4
    mov r1, #0xf
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov015_021fde00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdfd8
L_021fdf84:
    ldr r1, L_021fdfe0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fdfd8
L_021fdf98:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_021fdfd8
    mov r0, r4
    bl func_ov015_021fdeac
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc384
    ldr r1, L_021fdfe4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fdfd8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdfe0: .word data_ov015_021febd0
L_021fdfe4: .word data_ov015_021fec18

    .size func_ov015_021fdeec, . - func_ov015_021fdeec
