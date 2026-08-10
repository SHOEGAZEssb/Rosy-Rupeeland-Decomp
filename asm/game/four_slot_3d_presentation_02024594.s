; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern GameWork_TestFlag
.extern __construct_array
.extern data_020d6780
.extern data_020d6934
.extern func_0201e250
.extern DisplayControlElement_NoOp
.extern func_02091b6c
.extern func_02091bac
.extern gGameWork
.extern genrand_int32

    .global FourSlot3DPresentation_Init
    .type FourSlot3DPresentation_Init, @function
FourSlot3DPresentation_Init: ; 0x02024594
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r5, r1
    bl func_0201e250
    ldr r0, .L_0202465c
    ldr r4, .L_02024660
    str r0, [r10, #0x0]
    ldr r3, .L_02024664
    add r0, r10, #0x1c
    mov r1, #0x4
    mov r2, #0x1c
    str r4, [sp, #0x0]
    bl __construct_array
    mov r0, #0x0
    str r0, [r10, #0x8c]
    str r5, [r10, #0x8]
    bl genrand_int32
    mov r9, #0x0
    ldr r7, .L_02024668
    ldr r11, .L_0202466c
    str r0, [r10, #0x8c]
    add r4, r10, #0x1c
    mov r6, #0x800
    mov r5, #0x6
    mov r8, r9
.L_020245f8:
    add r0, r10, r9, lsl #0x2
    str r8, [r0, #0xc]
    mov r0, r9, lsl #0x1
    ldrh r1, [r7, r0]
    ldr r0, [r11, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    addeq r0, r10, r9, lsl #0x2
    streq r6, [r0, #0xc]
    str r5, [sp, #0x0]
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0xc]
    mov r0, #0x1c
    mov r1, r2, asr #0x7
    add r3, r2, r1, lsr #0x18
    mov r1, #0x3
    mla r0, r9, r0, r4
    mov r2, r1
    mov r3, r3, asr #0x8
    bl func_02091bac
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_020245f8
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202465c: .word data_020d6934
.L_02024660: .word DisplayControlElement_NoOp
.L_02024664: .word func_02091b6c
.L_02024668: .word data_020d6780
.L_0202466c: .word gGameWork
    .size FourSlot3DPresentation_Init, . - FourSlot3DPresentation_Init
