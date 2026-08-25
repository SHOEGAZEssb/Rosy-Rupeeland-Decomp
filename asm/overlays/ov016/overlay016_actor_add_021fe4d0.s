    .text
    .extern Heap_Alloc
    .extern data_ov016_02201580
    .extern Presentation_SetPosition
    .extern PresentationList_Append
    .extern SpritePresentation_SyncPosition
    .extern SpriteMotionController_Show
    .extern func_ov016_021fe004
    .extern func_ov016_021fe2b0
    .extern gHeapContext

/* Exact fallbacks for single actor insertion; see src/overlays/ov016/overlay016_actor_runtime.c. */
    .global func_ov016_021fe4d0

func_ov016_021fe4d0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r2, [r5, #0xdc]
    ldr r0, [r5, #0xe0]
    mov r6, r1
    cmp r2, r0
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r1, L_021fe57c
    ldr r3, L_021fe580
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_021fe51c
    ldr r2, [r5, #0x18]
    mov r1, r6
    bl func_ov016_021fe004
    mov r4, r0
L_021fe51c:
    mov r1, r4
    add r0, r5, #0xd0
    bl PresentationList_Append
    ldr r2, [r6, #0x10]
    mov r0, r4
    ldr r1, [r2, #0x0]
    ldrsh ip, [r2, #0x2c]
    ldr r3, [r1, #0x18]
    ldrsh r2, [r2, #0x2e]
    ldr r1, [r1, #0x1c]
    add r3, ip, r3
    add r2, r2, r1
    mov r1, r3, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl Presentation_SetPosition
    mov r0, r4
    bl SpritePresentation_SyncPosition
    mov r0, r5
    bl func_ov016_021fe2b0
    add r0, r5, #0x20
    bl SpriteMotionController_Show
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
L_021fe57c: .word data_ov016_02201580
L_021fe580: .word gHeapContext

    .size func_ov016_021fe4d0, . - func_ov016_021fe4d0
