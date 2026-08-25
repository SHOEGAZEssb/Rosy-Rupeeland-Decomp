; Matching retail form; see src/game/overlay_worker_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern func_ov047_0220baa8
.extern func_ov047_0220bda8
.extern func_ov047_0220c338
.extern gGameWork

.global OverlayWorkerPresentation_Update
    .type OverlayWorkerPresentation_Update, @function
OverlayWorkerPresentation_Update: ; 0x02020278
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_02020298
    cmp r0, #0x1
    beq .L_020202c4
    b .L_02020354
.L_02020298:
    ldr r0, [r4, #0xc]
    bl func_ov047_0220baa8
    ldr r0, [r4, #0xc]
    bl func_ov047_0220c338
    cmp r0, #0x0
    ldrne r0, [r4, #0x8]
    addne r0, r0, #0x1
    strne r0, [r4, #0x8]
    ldr r0, [r4, #0xc]
    bl func_ov047_0220bda8
    b .L_02020354
.L_020202c4:
    ldr r0, [r4, #0xc]
    bl func_ov047_0220bda8
    ldr r0, [r4, #0xc]
    ldr r0, [r0, #0x20]
    cmp r0, #0xe
    addls pc, pc, r0, lsl #0x2
    b .L_02020324
.L_020202e0:
    b .L_02020324
    b .L_02020324
    b .L_0202031c
    b .L_02020324
    b .L_02020324
    b .L_02020324
    b .L_02020324
    b .L_0202031c
    b .L_0202031c
    b .L_0202031c
    b .L_0202031c
    b .L_02020324
    b .L_0202031c
    b .L_02020324
    b .L_0202031c
.L_0202031c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02020324:
    ldr r0, .L_0202035c
    ldr r1, .L_02020360
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02020354
    ldr r0, .L_0202035c
    ldr r1, .L_02020360
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02020354:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0202035c: .word gGameWork
.L_02020360: .word 0x3bb
    .size OverlayWorkerPresentation_Update, .-OverlayWorkerPresentation_Update
