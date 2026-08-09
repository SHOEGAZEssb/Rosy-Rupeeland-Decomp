.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_0221483c
.extern func_02034a60
.extern func_020435f4
.extern func_0204362c

.global func_ov082_0221340c
func_ov082_0221340c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x200
    ldrh r1, [r1, #0x98]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0221344c
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    beq .L_02213454
.L_0221344c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02213454:
    add r1, r4, #0x200
    ldrh r2, [r1, #0x98]
    mov r0, r4
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    strh r2, [r1, #0x98]
    bl func_020435f4
    add r1, r4, #0x200
    strh r0, [r1, #0x9a]
    mov r0, #0x0
    strh r0, [r4, #0xda]
    ldr r0, [r4, #0xd0]
    ldr r1, .L_022134f0
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldr r2, [r4, #0x260]
    mov r0, r4
    orr r2, r2, #0x8
    str r2, [r4, #0x260]
    ldr r2, [r4, #0x10]
    bic r2, r2, #0x10000
    str r2, [r4, #0x10]
    ldr r3, [r1, #0x8]
    ldr r2, [r1, #0xc]
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r2, [r1, #0x10]
    ldr r1, [r1, #0x14]
    str r2, [r4, #0x220]
    str r1, [r4, #0x224]
    bl func_0204362c
    cmp r0, #0x0
    bne .L_022134e8
    ldr r1, .L_022134f4
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
.L_022134e8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_022134f0: .word data_ov082_0221483c
.L_022134f4: .word 0xc882
.size func_ov082_0221340c, . - func_ov082_0221340c
