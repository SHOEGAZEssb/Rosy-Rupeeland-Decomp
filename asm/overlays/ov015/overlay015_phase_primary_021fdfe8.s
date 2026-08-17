    .text
    .extern GameWork_SetFlag
    .extern data_ov015_021fec00
    .extern data_ov015_021fec08
    .extern data_ov015_021fec10
    .extern func_02092260
    .extern func_ov001_021fc0ac
    .extern func_ov001_021fc1f0
    .extern func_ov001_021fc214
    .extern func_ov001_021fc240
    .extern func_ov001_021fc250
    .extern func_ov001_021fc2e4
    .extern func_ov001_021fc310
    .extern func_ov001_021fc320
    .extern func_ov001_021fc3c4
    .extern func_ov001_021fc3ec
    .extern func_ov001_021fc644
    .extern func_ov001_021fc758
    .extern func_ov001_021fcae0
    .extern func_ov001_021fcb60
    .extern func_ov001_021fcbf0
    .extern func_ov001_021fcc44
    .extern func_ov015_021fce30
    .extern Overlay015_UpdateRecords
    .extern func_ov015_021fd6c8
    .extern func_ov015_021fdad4
    .extern func_ov015_021fdd1c
    .extern gGameWork

/* Exact fallbacks for primary interaction phase; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global func_ov015_021fdfe8

func_ov015_021fdfe8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fe28c
L_021fe000: ; jump table
    b L_021fe010 ; case 0
    b L_021fe038 ; case 1
    b L_021fe07c ; case 2
    b L_021fe244 ; case 3
L_021fe010:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc1f0
    mov r0, r4
    bl func_ov015_021fd6c8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe28c
L_021fe038:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc240
    cmp r0, #0x0
    beq L_021fe070
    mov r0, r4
    bl func_ov015_021fd6c8
    mov r0, r4
    bl func_ov015_021fdad4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe07c
L_021fe070:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc250
    b L_021fe28c
L_021fe07c:
    ldr r0, [r4, #0xdc]
    ldr r1, [r4, #0x2c]
    bl func_ov001_021fcae0
    cmp r0, #0x0
    bne L_021fe1dc
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fe1dc
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fcbf0
    cmp r0, #0x0
    bne L_021fe1dc
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe1dc
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fc0ac
    mov r5, r0
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fcb60
    cmp r0, #0x0
    bne L_021fe1dc
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fcc44
    cmp r0, #0x0
    beq L_021fe110
    ldr r1, L_021fe29c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe28c
L_021fe110:
    cmp r5, #0x0
    blt L_021fe158
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r4, #0xdc]
    ldr r1, [r0, #0x1ac]
    cmp r5, r1
    beq L_021fe28c
    mov r1, r5
    bl func_ov001_021fc758
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc644
    mov r0, r4
    bl func_ov015_021fd6c8
    mov r0, r4
    bl func_ov015_021fdad4
    b L_021fe28c
L_021fe158:
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fc3c4
    cmp r0, #0x0
    beq L_021fe18c
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fe2a0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe28c
L_021fe18c:
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x30
    bl func_ov001_021fc3ec
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe1d0
    mov r1, #0xb
    bl func_02092260
    ldr r0, L_021fe2a4
    ldr r1, L_021fe2a8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_021fe2ac
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fe28c
L_021fe1d0:
    bl func_ov015_021fdd1c
    cmp r0, #0x0
    bne L_021fe28c
L_021fe1dc:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc214
    cmp r0, #0x0
    beq L_021fe210
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe28c
L_021fe210:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc2e4
    cmp r0, #0x0
    beq L_021fe28c
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe28c
L_021fe244:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc310
    cmp r0, #0x0
    beq L_021fe26c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe28c
L_021fe26c:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc320
    cmp r0, #0x0
    beq L_021fe28c
    mov r0, r4
    bl func_ov015_021fd6c8
    mov r0, r4
    bl func_ov015_021fdad4
L_021fe28c:
    mov r0, r4
    bl Overlay015_UpdateRecords
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe29c: .word data_ov015_021fec10
L_021fe2a0: .word data_ov015_021fec00
L_021fe2a4: .word gGameWork
L_021fe2a8: .word 0x387
L_021fe2ac: .word data_ov015_021fec08

    .size func_ov015_021fdfe8, . - func_ov015_021fdfe8
