.text

/* Exact fallback; see src/overlays/ov035/overlay035_tertiary_scene_lifecycle.c for documented portable C. */

    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern TitleRandom_NextBounded
    .extern func_ov035_021fdd28
    .extern Heap_Alloc
    .extern func_0209189c
    .extern func_ov035_021fdb54
    .extern PresentationList_Append
    .extern data_ov035_02203d28
    .extern gHeapContext


    .global func_ov035_021ffb74
func_ov035_021ffb74: 
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r5, r0
    ldr r0, [r5, #0x124]
    mov r4, r1
    add r1, r5, #0x118
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r8, r0
    add r0, r5, #0xc0
    mov r1, #0x2
    bl TitleRandom_NextBounded
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    mov r0, #0x12
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, r8
    mov r3, r2
    bl func_ov035_021fdd28
    ldr r1, L_021ffc58
    ldr r3, L_021ffc5c
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_021ffc44
    mov r1, #0x600
    add r0, r5, #0xc0
    rsb r1, r1, #0x0
    mov r2, #0x1200
    bl func_0209189c
    mov r7, r0
    add r0, r5, #0xc0
    mov r1, #0x0
    mov r2, #0x400
    bl func_0209189c
    mov r6, r0
    add r0, r5, #0xc0
    mov r1, #0x1000
    bl TitleRandom_NextBounded
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r2, r8
    mov r3, r4
    mov r0, r0, lsl #0x4
    str r0, [sp, #0x8]
    mov r0, r9
    mov r1, #0x3
    bl func_ov035_021fdb54
    mov r9, r0
L_021ffc44:
    mov r1, r9
    add r0, r5, #0x184
    bl PresentationList_Append
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_021ffc58: .word data_ov035_02203d28
L_021ffc5c: .word gHeapContext
.size func_ov035_021ffb74, .-func_ov035_021ffb74

