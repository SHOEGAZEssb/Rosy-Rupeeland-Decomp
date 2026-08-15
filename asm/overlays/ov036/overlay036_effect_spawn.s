.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_spawn.c for documented portable C. */

    .extern Heap_Alloc
    .extern func_ov036_021fe258
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern PresentationList_Append
    .extern Sound_Play
    .extern data_ov036_02205ccc
    .extern data_ov036_02206158
    .extern gHeapContext
    .extern gSoundContext

    .global func_ov036_021fef6c
func_ov036_021fef6c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r2, L_021ff040
    mov r6, r0
    add r4, r2, r1, lsl #0x5
    ldr r1, L_021ff044
    ldr r3, L_021ff048
    mov r0, #0xd4
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fefa8
    mov r1, r4
    bl func_ov036_021fe258
    mov r5, r0
L_021fefa8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    ldr r0, [r6, #0xdc]
    beq L_021fefc4
    add r1, r6, #0xe0
    bl GraphicsAnimationInstanceManager_CreateInstance
    b L_021fefcc
L_021fefc4:
    add r1, r6, #0xec
    bl GraphicsAnimationInstanceManager_CreateInstance
L_021fefcc:
    mov r1, #0x0
    str r0, [r5, #0xcc]
    str r1, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r5, #0xcc]
    mov r2, r1
    mov r3, r1
    bl func_ov036_021ff050
    mov r1, r5
    add r0, r6, #0x108
    bl PresentationList_Append
    ldr r0, [r4, #0x1c]
    mov r1, #0x1cc
    cmp r0, #0x2
    bne L_021ff028
    ldr r0, L_021ff04c
    mov r2, #0x4
    ldr r0, [r0, #0x0]
    bl Sound_Play
    b L_021ff038
L_021ff028:
    ldr r0, L_021ff04c
    mov r2, #0x3
    ldr r0, [r0, #0x0]
    bl Sound_Play
L_021ff038:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021ff040: .word data_ov036_02205ccc
L_021ff044: .word data_ov036_02206158
L_021ff048: .word gHeapContext
L_021ff04c: .word gSoundContext
    .size func_ov036_021fef6c, .-func_ov036_021fef6c

