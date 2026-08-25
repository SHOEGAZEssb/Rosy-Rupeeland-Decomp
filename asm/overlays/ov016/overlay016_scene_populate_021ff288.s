    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_populate.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021e9ac0
    .extern data_021e9e00
    .extern data_ov016_02201588
    .extern data_ov016_02201590
    .extern ActorDescriptorState_FindInactiveQuantity
    .extern RetailPhaseRecord_IsUnlocked
    .extern func_ov016_021fce34
    .extern func_ov016_021fd0e0
    .extern func_ov016_021fd210
    .extern func_ov016_021fd6c8
    .extern func_ov016_021ffcb0
    .extern gDebugFont
    .extern gHeapContext
.global func_ov016_021ff288
func_ov016_021ff288:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, L_021ff3e8
    mov r7, r0
    ldr r3, L_021ff3ec
    mov r0, #0x114
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff2bc
    ldr r1, L_021ff3f0
    ldr r1, [r1, #0x0]
    bl func_ov016_021fd6c8
L_021ff2bc:
    ldr r1, L_021ff3f4
    str r0, [r7, #0x448]
    ldr r3, L_021ff3ec
    mov r0, #0x64
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff2ec
    ldr r1, L_021ff3f8
    ldr r2, [r7, #0x58]
    ldr r1, [r1, #0x0]
    bl func_ov016_021fce34
L_021ff2ec:
    str r0, [r7, #0x444]
    mov r4, #0x0
    b L_021ff3c8
L_021ff2f8:
    ldr r0, L_021ff3fc
    ldr r0, [r0, #0x8]
    add r0, r0, r4, lsl #0x2
    bl RetailPhaseRecord_IsUnlocked
    cmp r0, #0x0
    beq L_021ff3b0
    ldr r0, L_021ff3fc
    add r2, sp, #0x0
    ldr r1, [r0, #0x8]
    mov r0, r7
    add r6, r1, r4, lsl #0x2
    mov r1, r6
    mov r5, #0x0
    bl func_ov016_021ffcb0
    cmp r0, #0x0
    ldr r1, [r6, #0x0]
    ldr r0, L_021ff400
    ldrh r1, [r1, #0x4]
    ldr r0, [r0, #0x0]
    orreq r5, r5, #0x1
    add r0, r0, #0x1c
    bl ActorDescriptorState_FindInactiveQuantity
    cmp r0, #0x63
    ldr r0, [r6, #0x0]
    mov r2, #0x0
    ldr ip, [r0, #0x100]
    orrge r5, r5, #0x2
    mov r3, r2
    mov r0, #0x24
    b L_021ff384
L_021ff370:
    ldr r1, [r6, #0x0]
    mla r1, r3, r0, r1
    ldrh r1, [r1, #0x2c]
    add r3, r3, #0x1
    add r2, r2, r1
L_021ff384:
    cmp r3, ip
    blt L_021ff370
    ldr r0, [r7, #0x5c]
    mov r1, r6
    cmp r2, r0
    orrgt r5, r5, #0x4
    ldr r0, [r7, #0x444]
    add r2, sp, #0x0
    mov r3, r5
    bl func_ov016_021fd0e0
    b L_021ff3c4
L_021ff3b0:
    mov r1, #0x0
    ldr r0, [r7, #0x444]
    mov r2, r1
    mov r3, #0x1
    bl func_ov016_021fd0e0
L_021ff3c4:
    add r4, r4, #0x1
L_021ff3c8:
    ldr r0, L_021ff3fc
    ldr r0, [r0, #0x4]
    cmp r4, r0
    blt L_021ff2f8
    ldr r0, [r7, #0x444]
    bl func_ov016_021fd210
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021ff3e8: .word data_ov016_02201588
L_021ff3ec: .word gHeapContext
L_021ff3f0: .word gDebugFont
L_021ff3f4: .word data_ov016_02201590
L_021ff3f8: .word data_020f4e14
L_021ff3fc: .word data_021e9e00
L_021ff400: .word data_021e9ac0
    .size func_ov016_021ff288, . - func_ov016_021ff288

