.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern data_020c9670
.extern VecFx32Object_Destroy
.extern func_020adae4
.extern func_020ae024
.extern func_020befec
.extern func_ov073_0221007c

.global func_ov073_0220ff3c
func_ov073_0220ff3c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldrh r2, [r5, #0x3c]
    mov r4, r1
    ldr r0, .L_02210070
    mov r1, r2, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    ldr r2, [r4, #0xc]
    ldr r0, [r5, #0x14]
    add r2, r2, r1, lsl #0x2
    ldrsh r1, [r5, #0x3e]
    sub r0, r2, r0
    bl func_020adae4
    str r0, [r5, #0x24]
    add r0, sp, #0x0
    mov r1, r4
    add r2, r5, #0x8
    bl func_ov073_0221007c
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0x4]
    smull r3, r0, r1, r1
    smlal r3, r0, r2, r2
    mov r0, r0, lsl #0x2
    ldr r2, .L_02210074
    mov r1, #0x1
    strh r1, [r2, #0x0]
    mov r1, r3, lsl #0x2
    str r1, [r2, #0x8]
    orr r0, r0, r3, lsr #0x1e
    str r0, [r2, #0xc]
.L_0220ffbc:
    ldrh r0, [r2, #0x0]
    tst r0, #0x8000
    bne .L_0220ffbc
    ldr r0, .L_02210078
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1
    mov r0, r0, asr #0x1
    cmp r0, #0x2000
    ble .L_02210060
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    ldrsh r1, [r5, #0x40]
    mov r2, r0, asr #0x4
    ldrsh r0, [r5, #0x3e]
    mov r4, r2, lsl #0x1
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0xc
    bl func_020befec
    add r1, r4, #0x1
    ldr r2, .L_02210070
    mov r3, r1, lsl #0x1
    mov r1, r4, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r3, [r2, r3]
    rsb r2, r0, #0xc00
    mov r0, r1, asr #0x1f
    smull r2, r4, r3, r2
    adds r3, r2, #0x800
    mov r2, r0, lsl #0xb
    mov r0, #0x800
    adc r4, r4, #0x0
    mov ip, r3, lsr #0xc
    adds r3, r0, r1, lsl #0xb
    orr r2, r2, r1, lsr #0x15
    orr ip, ip, r4, lsl #0x14
    adc r0, r2, #0x0
    mov r1, r3, lsr #0xc
    str ip, [r5, #0x1c]
    orr r1, r1, r0, lsl #0x14
    str r1, [r5, #0x20]
.L_02210060:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02210070: .word data_020c9670
.L_02210074: .word 0x40002b0
.L_02210078: .word 0x40002b4
.size func_ov073_0220ff3c, . - func_ov073_0220ff3c
