; Matching retail form; see src/game/overlay_worker_presentation.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern data_020d6304
.extern gOverlayWorkerAllocationTag
.extern data_021055cc
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern FieldEffect_Init
.extern func_ov043_0220b740
.extern func_ov047_0220bda8
.extern gGameWork
.extern gHeapContext

.global OverlayWorkerPresentation_Init
    .type OverlayWorkerPresentation_Init, @function
OverlayWorkerPresentation_Init: ; 0x020200bc
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl FieldEffect_Init
    ldr r1, .L_0202016c
    add r0, r7, #0x10
    str r1, [r7, #0x0]
    bl OverlaySlot_Init
    ldr r0, .L_02020170
    ldr r1, .L_02020174
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02020178
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_02020110
    ldr r1, .L_0202017c
    add r0, r7, #0x10
    bl OverlaySlot_LoadOverlay
.L_02020110:
    ldr r1, .L_02020180
    ldr r3, .L_02020184
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02020144
    ldr ip, [sp, #0x18]
    mov r1, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x0]
    bl func_ov043_0220b740
.L_02020144:
    str r0, [r7, #0xc]
    bl func_ov047_0220bda8
    mov r0, #0x0
    str r0, [r7, #0x8]
    ldr r1, .L_02020178
    mov r0, r7
    ldr r2, [r1, #0x0]
    add r2, r2, #0x1
    str r2, [r1, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0202016c: .word data_020d6304
.L_02020170: .word gGameWork
.L_02020174: .word 0x3bb
.L_02020178: .word data_021055cc
.L_0202017c: .word 0x2f
.L_02020180: .word gOverlayWorkerAllocationTag
.L_02020184: .word gHeapContext
    .size OverlayWorkerPresentation_Init, .-OverlayWorkerPresentation_Init
