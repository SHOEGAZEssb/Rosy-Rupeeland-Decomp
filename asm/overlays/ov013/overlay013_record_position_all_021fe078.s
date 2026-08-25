    .text
    .extern Overlay013_RandomizeRecordPosition

/* Exact fallback; see src/overlays/ov013/overlay013_record_position.c. */
    .global Overlay013_RandomizeActiveRecordPositions

Overlay013_RandomizeActiveRecordPositions:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r1
    add r1, r9, r9, lsr #0x1f
    mov r10, r0
    mov r8, r2
    mov r7, r3
    mov r6, r1, asr #0x1
    mov r5, #0x0
    add r4, r10, #0x8c
    mov r11, #0xac
L_021fe0a0:
    mul r1, r5, r11
    add r0, r10, r1
    add r0, r0, #0x100
    ldrh r0, [r0, #0x24]
    tst r0, #0x1
    beq L_021fe0cc
    mov r0, r10
    mov r2, r9
    mov r3, r6
    add r1, r4, r1
    bl Overlay013_RandomizeRecordPosition
L_021fe0cc:
    add r5, r5, #0x1
    cmp r5, #0x7
    blt L_021fe0a0
    mov r4, #0x0
    add r6, r10, #0x540
    mov r5, #0xac
L_021fe0e4:
    mul r1, r4, r5
    add r0, r10, r1
    add r0, r0, #0x500
    ldrh r0, [r0, #0xd8]
    tst r0, #0x1
    beq L_021fe110
    mov r0, r10
    mov r2, r8
    mov r3, r8
    add r1, r6, r1
    bl Overlay013_RandomizeRecordPosition
L_021fe110:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt L_021fe0e4
    add r0, r10, #0x900
    ldrh r0, [r0, #0x34]
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    add r1, r10, #0x9c
    mov r0, r10
    mov r2, r7
    mov r3, r7
    add r1, r1, #0x800
    bl Overlay013_RandomizeRecordPosition
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size Overlay013_RandomizeActiveRecordPositions, . - Overlay013_RandomizeActiveRecordPositions
