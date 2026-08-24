.text

/* Exact fallback; see src/overlays/ov035/overlay035_radial_particle_spawn.c for documented portable C. */

    .extern TitleRandom_NextBounded
    .extern func_0209189c
    .extern Heap_Alloc
    .extern func_ov035_021fd2bc
    .extern Presentation_SetPosition
    .extern PresentationScalar_TransitionTo
    .extern PresentationList_Append
    .extern gFx32CosSinTable
    .extern data_ov035_02203d68
    .extern gHeapContext

    .global func_ov035_02200ec0
func_ov035_02200ec0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r9, r1
    add r0, r10, #0xc0
    mov r1, #0x1000
    mov r8, r2
    mov r7, r3
    bl TitleRandom_NextBounded
    mov r4, r0, lsl #0x4
    add r0, r10, #0xc0
    mov r1, #0x100
    mov r2, #0x200
    bl func_0209189c
    rsb r1, r4, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r4, asr #0x3
    mov r1, r1, asr #0x4
    mov r5, r1, lsl #0x1
    add r1, r2, #0x1
    mov r4, r2, lsl #0x1
    ldr r2, L_02200ff4
    mov r3, r1, lsl #0x1
    ldrsh r11, [r2, r4]
    ldrsh r6, [r2, r3]
    mov r1, r5, lsl #0x1
    ldrsh r4, [r2, r1]
    mul r3, r0, r11
    mul r1, r0, r6
    add r0, r5, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r5, [r2, r0]
    mov r0, r3, asr #0x7
    add r0, r3, r0, lsr #0x18
    mov r0, r0, asr #0x8
    str r0, [sp, #0x8]
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r11, r0, asr #0x8
    ldr r1, L_02200ff8
    ldr r3, L_02200ffc
    mov r0, #0xa8
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq L_02200fa8
    orr r1, r9, r8, lsl #0x5
    orr r1, r1, r7, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r4
    mov r3, r5
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    bl func_ov035_021fd2bc
    mov r6, r0
L_02200fa8:
    mov r3, #0x10000
    ldr r1, [sp, #0x8]
    mov r0, r6
    mov r2, r11
    rsb r3, r3, #0x0
    bl Presentation_SetPosition
    add r0, r6, #0x2c
    mov r1, #0x1
    mov r2, #0x2000
    bl PresentationScalar_TransitionTo
    mov r0, #0x28
    str r0, [r6, #0x7c]
    mov r2, #0x0
    mov r1, r6
    add r0, r10, #0x118
    str r2, [r6, #0x80]
    bl PresentationList_Append
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02200ff4: .word gFx32CosSinTable
L_02200ff8: .word data_ov035_02203d68
L_02200ffc: .word gHeapContext
    .size func_ov035_02200ec0, .-func_ov035_02200ec0

