.text
.extern func_02092c8c
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_ov043_0220bcf4
.extern func_020755bc
.extern OverlaySlot_LoadOverlay
.extern Heap_Alloc
.extern func_ov016_021fe77c
.extern func_ov043_0220bd24
.extern func_02091fb0
.extern OverlaySlot_UnloadOverlay
.extern func_ov043_0220b744
.extern func_ov043_0220ba28
.extern func_ov043_0220bc2c
.extern func_ov017_021feab4
.extern GameWork_TestFlag
.extern data_020f4e14
.extern gDebugFont
.extern gHeapContext
.extern gGameWork
.extern data_ov043_0220c4d0
.extern data_ov043_0220c4d8
.extern data_ov043_0220c450
.extern data_ov043_0220c460
.extern data_ov043_0220c468
.extern data_ov043_0220c478

    .global func_ov043_0220bed4
func_ov043_0220bed4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_0220c184
.L_0220beec: ; jump table
    b .L_0220bf04 ; case 0
    b .L_0220bf2c ; case 1
    b .L_0220bfc8 ; case 2
    b .L_0220bff8 ; case 3
    b .L_0220c030 ; case 4
    b .L_0220c15c ; case 5
.L_0220bf04:
    mov r1, #0x0
    mov r0, #0x3
    str r1, [r4, #0x294]
    sub r1, r0, #0x13
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
.L_0220bf2c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    mov r0, r4
    beq .L_0220bfc0
    bl func_ov043_0220bcf4
    ldr r0, .L_0220c18c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_0220c190
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r1, .L_0220c194
    add r0, r4, #0x2dc
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0220c198
    add r0, r4, #0x2e8
    bl OverlaySlot_LoadOverlay
    ldr r0, .L_0220c19c
    ldr r1, .L_0220c1a0
    ldr r3, .L_0220c1a4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220bf98
    ldr r1, [r4, #0x58]
    ldr r2, [r4, #0x54]
    bl func_ov016_021fe77c ; func_ov023_021fe77c, func_ov028_021fe77c
.L_0220bf98:
    str r0, [r4, #0x2f4]
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c184
.L_0220bfc0:
    bl func_ov043_0220bd24
    b .L_0220c184
.L_0220bfc8:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c184
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c184
.L_0220bff8:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x1
    bl func_02091fb0
    cmp r0, #0x0
    beq .L_0220c184
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c184
.L_0220c030:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c184
    ldr ip, [r4, #0x2f4]
    ldr r0, [ip, #0x478]
    str r0, [r4, #0x294]
    cmp r0, #0x0
    beq .L_0220c0a8
    ldr r1, [ip, #0x470]
    mov r0, #0x0
    str r0, [r4, #0x298]
    ldr lr, [r1, #0xd4]
    b .L_0220c098
.L_0220c070:
    ldr r1, [lr, #0xac]
    ldr r0, [r4, #0x298]
    ldr r1, [r1, #0xc]
    mov r2, r0
    ldrh r3, [r1, #0x0]
    add r1, r0, #0x1
    add r0, r4, r2, lsl #0x2
    str r1, [r4, #0x298]
    str r3, [r0, #0x29c]
    ldr lr, [lr, #0x8]
.L_0220c098:
    cmp lr, #0x0
    bne .L_0220c070
    ldr r0, [ip, #0x484]
    str r0, [r4, #0x2d8]
.L_0220c0a8:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2f4]
    cmp r0, #0x0
    beq .L_0220c0cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220c0cc:
    mov r0, #0x0
    str r0, [r4, #0x2f4]
    ldr r1, [r4, #0x20]
    add r0, r4, #0x2dc
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0x2e8
    bl OverlaySlot_UnloadOverlay
    ldr r0, [r4, #0x294]
    cmp r0, #0x0
    beq .L_0220c110
    ldr r1, .L_0220c1a8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220c184
.L_0220c110:
    ldr r0, .L_0220c18c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_0220c190
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov043_0220ba28
    mov r0, r4
    bl func_ov043_0220bc2c
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c184
.L_0220c15c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c17c
    ldr r1, .L_0220c1ac
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220c184
.L_0220c17c:
    mov r0, r4
    bl func_ov043_0220bd24
.L_0220c184:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220c18c: .word data_020f4e14
.L_0220c190: .word gDebugFont
.L_0220c194: .word 0x0
.L_0220c198: .word 0x10
.L_0220c19c: .word 0x488
.L_0220c1a0: .word data_ov043_0220c4d0
.L_0220c1a4: .word gHeapContext
.L_0220c1a8: .word data_ov043_0220c478
.L_0220c1ac: .word data_ov043_0220c450
.size func_ov043_0220bed4, . - func_ov043_0220bed4

    .global func_ov043_0220c1b0
func_ov043_0220c1b0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_0220c3e4
.L_0220c1cc: ; jump table
    b .L_0220c1e4 ; case 0
    b .L_0220c204 ; case 1
    b .L_0220c284 ; case 2
    b .L_0220c2b4 ; case 3
    b .L_0220c2ec ; case 4
    b .L_0220c3bc ; case 5
.L_0220c1e4:
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
.L_0220c204:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c278
    ldr r1, .L_0220c3f0
    add r0, r4, #0x2e8
    bl OverlaySlot_LoadOverlay
    ldr r0, .L_0220c3f4
    ldr r1, .L_0220c3f8
    ldr r3, .L_0220c3fc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220c250
    ldr r1, [r4, #0x54]
    add r2, r4, #0x29c
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x298]
    ldr r3, [r4, #0x2d8]
    bl func_ov017_021feab4
.L_0220c250:
    str r0, [r4, #0x2f4]
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c3e4
.L_0220c278:
    mov r0, r4
    bl func_ov043_0220bd24
    b .L_0220c3e4
.L_0220c284:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c3e4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c3e4
.L_0220c2b4:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x1
    bl func_02091fb0
    cmp r0, #0x0
    beq .L_0220c3e4
    mov r0, #0x3
    sub r1, r0, #0x13
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c3e4
.L_0220c2ec:
    ldr r0, [r4, #0x2f4]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c3e4
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x2f4]
    cmp r0, #0x0
    beq .L_0220c328
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220c328:
    mov r0, #0x0
    str r0, [r4, #0x2f4]
    ldr r1, [r4, #0x20]
    add r0, r4, #0x2e8
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    bl OverlaySlot_UnloadOverlay
    ldr r0, .L_0220c400
    ldr r1, .L_0220c404
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220c370
    ldr r1, .L_0220c408
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220c3e4
.L_0220c370:
    ldr r0, .L_0220c40c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, .L_0220c410
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov043_0220ba28
    mov r0, r4
    bl func_ov043_0220bc2c
    mov r0, #0x3
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_0220c3e4
.L_0220c3bc:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_0220c3dc
    ldr r1, .L_0220c414
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov043_0220b744
    b .L_0220c3e4
.L_0220c3dc:
    mov r0, r4
    bl func_ov043_0220bd24
.L_0220c3e4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0220c3f0: .word 0x11
.L_0220c3f4: .word 0x444
.L_0220c3f8: .word data_ov043_0220c4d8
.L_0220c3fc: .word gHeapContext
.L_0220c400: .word gGameWork
.L_0220c404: .word 0x3a6
.L_0220c408: .word data_ov043_0220c468
.L_0220c40c: .word data_020f4e14
.L_0220c410: .word gDebugFont
.L_0220c414: .word data_ov043_0220c460
.size func_ov043_0220c1b0, . - func_ov043_0220c1b0

    .global func_ov043_0220c418
func_ov043_0220c418:
    stmdb sp!, {r3, lr}
    bl func_ov043_0220bd24
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov043_0220c418, . - func_ov043_0220c418

