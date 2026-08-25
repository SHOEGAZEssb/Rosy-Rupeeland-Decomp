    .text
    .extern Heap_Alloc
    .extern data_ov016_02201580
    .extern Presentation_SetPosition
    .extern PresentationList_Append
    .extern SpritePresentation_SyncPosition
    .extern SpriteMotionController_Show
    .extern Overlay016_SpriteWrapper_Init
    .extern Overlay016_LayoutActors
    .extern func_ov016_021fe358
    .extern gHeapContext

/* Exact fallback; see src/overlays/ov016/overlay016_actor_spawn.c. */
    .global Overlay016_SpawnMatchingActors

Overlay016_SpawnMatchingActors:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    mov r8, r2
    ldr r1, [r10, #0xd4]
    mov r4, #0x0
    b L_021fe3c0
L_021fe3ac:
    ldr r0, [r1, #0xac]
    cmp r0, r8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r1, [r1, #0x8]
L_021fe3c0:
    cmp r1, #0x0
    bne L_021fe3ac
    ldr r2, [r9, #0x0]
    mov r0, #0x0
    ldr r1, [r2, #0x100]
    add r7, r2, #0x28
    mov r2, #0x24
    b L_021fe4b8
L_021fe3e0:
    mul r6, r0, r2
    ldr r3, [r8, #0xc]
    ldrh r5, [r7, r6]
    ldrh r3, [r3, #0x0]
    add r6, r7, r6
    cmp r5, r3
    bne L_021fe4b4
    ldr r5, [r8, #0x10]
    ldrh r4, [r6, #0x4]
    ldr r6, [r5, #0x0]
    mov r7, #0x0
    b L_021fe480
L_021fe410:
    ldr r1, L_021fe4c8
    ldr r3, L_021fe4cc
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    movs r11, r0
    beq L_021fe43c
    ldr r2, [r10, #0x18]
    mov r1, r8
    bl Overlay016_SpriteWrapper_Init
    mov r11, r0
L_021fe43c:
    mov r1, r11
    add r0, r10, #0xd0
    bl PresentationList_Append
    ldrsh r2, [r5, #0x2c]
    ldr r1, [r6, #0x18]
    ldrsh ip, [r5, #0x2e]
    add r1, r2, r1
    ldr r2, [r6, #0x1c]
    mov r0, r11
    add r2, ip, r2
    mov r1, r1, lsl #0xc
    mov r3, #0x0
    mov r2, r2, lsl #0xc
    bl Presentation_SetPosition
    mov r0, r11
    bl SpritePresentation_SyncPosition
    add r7, r7, #0x1
L_021fe480:
    cmp r7, r4
    blt L_021fe410
    mov r0, r10
    bl Overlay016_LayoutActors
    ldr r5, [r10, #0xdc]
    mov r0, r10
    mov r1, r9
    bl func_ov016_021fe358
    cmp r5, r0
    bne L_021fe4c0
    add r0, r10, #0x20
    bl SpriteMotionController_Show
    b L_021fe4c0
L_021fe4b4:
    add r0, r0, #0x1
L_021fe4b8:
    cmp r0, r1
    blt L_021fe3e0
L_021fe4c0:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe4c8: .word data_ov016_02201580
L_021fe4cc: .word gHeapContext

    .size Overlay016_SpawnMatchingActors, . - Overlay016_SpawnMatchingActors
