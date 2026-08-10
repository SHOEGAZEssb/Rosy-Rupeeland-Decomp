.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_ov022_022004f8
.extern DisplayBrightness_IsMainTransitionComplete
.extern func_02010b64
.extern func_02010c00
.extern func_02092c8c
.extern func_ov022_021fcfd4
.extern func_ov022_021fd068
.extern func_ov022_021fdd1c
.extern func_ov022_021ff0d0
.extern func_ov022_021ff220
.extern func_ov022_021ff368
.extern GameWork_ClearFlag
.extern gGameWork
.extern gLupyContext


    .global func_ov022_022002e4
func_ov022_022002e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_0220045c
L_022002fc: ; jump table
    b L_02200310 ; case 0
    b L_02200344 ; case 1
    b L_022003a8 ; case 2
    b L_022003ec ; case 3
    b L_02200410 ; case 4
L_02200310:
    ldr r1, L_0220046c
    mov r0, #0x1
    ldr r3, [r1, #0x0]
    sub r1, r0, #0x9
    ldrsh r2, [r3, #0x98]
    add r2, r2, #0x1
    strh r2, [r3, #0x98]
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02200344:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0220045c
    ldr r0, L_02200470
    ldr r0, [r0, #0x0]
    bl func_02010b64
    ldr r2, [r4, #0x2bc]
    mov r1, r0
    ldr r0, [r4, #0x354]
    ldr r2, [r2, #0x24]
    mov r3, #0x1
    bl func_ov022_021fcfd4
    ldr r2, [r4, #0x2bc]
    ldr r1, L_02200470
    ldr r3, [r2, #0x24]
    mov r2, r0
    ldr r0, [r1, #0x0]
    rsb r1, r3, #0x0
    bl func_02010c00
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_0220045c
L_022003a8:
    ldr r0, [r4, #0x354]
    bl func_ov022_021fd068
    cmp r0, #0x0
    beq L_0220045c
    ldr r0, [r4, #0x354]
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne L_0220045c
    mov r0, r4
    mov r1, #0x6
    bl func_ov022_021ff220
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_0220045c
L_022003ec:
    bl func_ov022_021ff368
    cmp r0, #0x0
    beq L_0220045c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_0220045c
L_02200410:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble L_0220045c
    ldr r0, [r4, #0x2bc]
    ldr r1, L_0220046c
    ldrh r2, [r0, #0x2]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x200
    strh r2, [r0, #0x4]
    ldr r2, [r4, #0x2bc]
    ldr r0, [r1, #0x0]
    ldrh r1, [r2, #0x20]
    bl GameWork_ClearFlag
    ldr r1, L_02200474
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
L_0220045c:
    mov r0, r4
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0220046c: .word gGameWork
L_02200470: .word gLupyContext
L_02200474: .word data_ov022_022004f8
.size func_ov022_022002e4, .-func_ov022_022002e4

