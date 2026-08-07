.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern data_021f3ecc
.extern func_02076004
.extern func_02079f3c
.extern func_020939d8
.extern func_ov022_021ff2c4


    .global func_ov022_021ff048
func_ov022_021ff048:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x2bc]
    ldr r0, L_021ff0c4
    ldrh r1, [r1, #0x0]
    bl func_02079f3c
    add r2, r0, #0x2
    mov r3, #0x0
    b L_021ff08c
L_021ff06c:
    mov r0, r3, lsl #0x1
    ldrh r1, [r2, r0]
    add r0, r4, r3, lsl #0x1
    add r0, r0, #0x200
    strh r1, [r0, #0xd0]
    cmp r1, #0x0
    beq L_021ff094
    add r3, r3, #0x1
L_021ff08c:
    cmp r3, #0x20
    blt L_021ff06c
L_021ff094:
    ldr r0, [r4, #0x2bc]
    ldr r2, L_021ff0c8
    ldr r1, [r0, #0x24]
    add r0, r4, #0x310
    mov r3, #0x0
    bl func_02076004
    ldr r0, [r4, #0x2cc]
    bl func_020939d8
    ldr r1, L_021ff0cc
    mov r0, r4
    bl func_ov022_021ff2c4
    ldmia sp!, {r4, pc}
L_021ff0c4: .word data_021f3ecc
L_021ff0c8: .word 0xff676980
L_021ff0cc: .word 0x206
.size func_ov022_021ff048, .-func_ov022_021ff048

