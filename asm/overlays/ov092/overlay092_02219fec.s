.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern GameWork_SetFlag
.extern data_021052fc
.extern func_020390c8
.extern func_ov092_02218394
.extern func_ov092_02219fc8
.extern gGameWork

.global func_ov092_02219fec
func_ov092_02219fec:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0221a098
    mov r5, r0
    ldr r1, [r1, #0x0]
    ldr r2, .L_0221a09c
    add r0, r1, #0x2000
    ldr r4, [r0, #0xea4]
    mov r1, #0x3ec
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x40000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x230]
    orr r0, r0, #0x4
    bic r0, r0, #0x20
    str r0, [r4, #0x230]
    ldr r0, [r2, #0x0]
    bl GameWork_SetFlag
    mov r0, r4
    bl func_020390c8
    ldr r0, .L_0221a09c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, #0x1
    bl func_ov092_02218394
    ldr r0, .L_0221a09c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    mov r3, r1
    bl func_ov092_02218394
    add r0, r4, #0x60
    add r1, r5, #0x290
    bl func_ov092_02219fc8
    ldr r1, [r5, #0x250]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x248]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221a098: .word data_021052fc
.L_0221a09c: .word gGameWork
.size func_ov092_02219fec, . - func_ov092_02219fec
