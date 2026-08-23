; Matching retail form; see src/graphics/graphics_3d_runtime_manager_update.c
; for the documented portable implementation and recovered behavior.
.text
.extern gPairedEntryMode2EmissionIntervals
.extern data_020c9670
.extern PairedEntryManager_SpawnEntry
.extern genrand_int32

    .global PairedEntryManager_Update
.type PairedEntryManager_Update, @function
PairedEntryManager_Update:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    ldr r3, L_020a2fc4
    add r2, sp, #0
    mov r4, r0
    mov r1, #0xa
L_020a2dc0:
    ldrb r0, [r3], #1
    subs r1, r1, #1
    strb r0, [r2], #1
    bne L_020a2dc0
    ldr r0, [r4, #8]
    cmp r0, #0
    bne L_020a2ebc
    ldrsb r0, [r4, #4]
    cmp r0, #3
    bne L_020a2e0c
    mov r1, #2
    mov r0, r4
    mov r2, r1
    bl PairedEntryManager_SpawnEntry
    cmp r0, #0
    movne r0, #1
    strne r0, [r4, #8]
    mov r0, #1
    strb r0, [r4, #5]
L_020a2e0c:
    ldrsb r0, [r4, #4]
    cmp r0, #2
    bne L_020a2e80
    ldrsb r0, [r4, #5]
    sub r0, r0, #1
    strb r0, [r4, #5]
    ldrsb r0, [r4, #5]
    cmp r0, #0
    bne L_020a2ebc
    mov r0, r4
    mov r1, #1
    mov r2, #0
    bl PairedEntryManager_SpawnEntry
    mov r1, #1
    mov r0, r4
    mov r2, r1
    bl PairedEntryManager_SpawnEntry
    ldrsb r1, [r4, #6]
    add r0, sp, #0
    ldrb r0, [r0, r1]
    strb r0, [r4, #5]
    ldrsb r0, [r4, #6]
    add r0, r0, #1
    strb r0, [r4, #6]
    ldrsb r0, [r4, #6]
    cmp r0, #0xa
    movhs r0, #9
    strhsb r0, [r4, #6]
    b L_020a2ebc
L_020a2e80:
    cmp r0, #1
    ldreqsb r0, [r4, #5]
    subeq r0, r0, #1
    streqb r0, [r4, #5]
    ldreqsb r0, [r4, #5]
    cmpeq r0, #0
    bne L_020a2ebc
    mov r1, #0
    mov r0, r4
    mov r2, r1
    bl PairedEntryManager_SpawnEntry
    bl genrand_int32
    and r0, r0, #0x18
    add r0, r0, #0x28
    strb r0, [r4, #5]
L_020a2ebc:
    mov r8, #0
    mov r0, #0xf
    mov lr, #0x800
    sub r3, r0, #1
    ldr r1, L_020a2fc8
    mov r0, #0x4000
    mov r12, #0xc
    mov r5, r8
    mov r7, r8
    mov r6, lr
L_020a2ee4:
    add r2, r4, r3, lsl #2
    ldr r11, [r2, #0x184]
    cmp r11, #0
    beq L_020a2fb4
    cmp r11, #1
    bne L_020a2f4c
    ldr r10, [r2, #0xd0]
    ldr r9, [r2, #0x148]
    mov r10, r10, asr #4
    mov r10, r10, lsl #2
    ldrsh r10, [r1, r10]
    smull r11, r9, r10, r9
    adds r10, r11, r6
    adc r9, r9, r7
    mov r10, r10, lsr #0xc
    orr r10, r10, r9, lsl #0x14
    str r10, [r2, #0x10c]
    ldr r9, [r2, #0xd0]
    add r9, r9, #0xb4
    str r9, [r2, #0xd0]
    cmp r9, #0x4000
    strgt r0, [r2, #0xd0]
    ldrgt r2, [r4, #8]
    addgt r2, r2, #1
    strgt r2, [r4, #8]
    b L_020a2fb4
L_020a2f4c:
    mla r10, r3, r12, r4
    ldr r9, [r10, #0x20]
    add r9, r9, r11
    str r9, [r10, #0x20]
    ldr r10, [r2, #0xd0]
    ldr r9, [r2, #0x148]
    mov r10, r10, asr #4
    mov r10, r10, lsl #2
    ldrsh r10, [r1, r10]
    smull r11, r9, r10, r9
    adds r10, r11, lr
    adc r9, r9, r5
    mov r10, r10, lsr #0xc
    orr r10, r10, r9, lsl #0x14
    str r10, [r2, #0x10c]
    ldrsb r2, [r4, #4]
    add r10, r4, r3, lsl #2
    cmp r2, #1
    moveq r9, #0x96
    ldr r2, [r10, #0xd0]
    movne r9, #0x12c
    add r9, r2, r9
    ldr r2, L_020a2fcc
    str r9, [r10, #0xd0]
    cmp r9, r2
    strgt r8, [r10, #0x184]
L_020a2fb4:
    subs r3, r3, #1
    bpl L_020a2ee4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_020a2fc4: .word gPairedEntryMode2EmissionIntervals
L_020a2fc8: .word data_020c9670
L_020a2fcc: .word 0x7fff
    .size PairedEntryManager_Update, .-PairedEntryManager_Update
