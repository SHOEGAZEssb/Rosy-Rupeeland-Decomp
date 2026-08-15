.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern OverlaySlot_Init
.extern data_020e558c
.extern data_020e559c
.extern data_020e55ac
.extern data_020e55d8
.extern func_02068408
.extern func_0206841c
.extern func_02068630
.extern func_02068698
.extern func_02091e28
.extern gGameWork

.global func_02068444
func_02068444:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02091e28
    ldr r1, .L_02068520
    add r0, r4, #0x58
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    add r0, r4, #0x64
    bl OverlaySlot_Init
    add r0, r4, #0x70
    bl func_02068408
    add r0, r4, #0x7c
    bl func_02068408
    ldr r0, .L_02068524
    ldr r1, .L_02068528
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_020684ac
    mov r0, r4
    bl func_02068630
    ldr r1, .L_0206852c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_0206841c
    b .L_020684f8
.L_020684ac:
    ldr r0, .L_02068524
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_020684e0
    mov r0, r4
    bl func_02068698
    ldr r1, .L_02068530
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_0206841c
    b .L_020684f8
.L_020684e0:
    mov r0, #0x0
    ldr r1, .L_02068534
    str r0, [r4, #0x54]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_0206841c
.L_020684f8:
    ldr r0, .L_02068524
    ldr r1, .L_02068528
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02068524
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02068520: .word data_020e55d8
.L_02068524: .word gGameWork
.L_02068528: .word 0x387
.L_0206852c: .word data_020e559c
.L_02068530: .word data_020e558c
.L_02068534: .word data_020e55ac
.size func_02068444, . - func_02068444
