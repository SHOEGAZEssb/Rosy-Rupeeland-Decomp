.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08
.extern data_ov079_02213c2c
.extern func_0203db80

.global func_ov079_02212ae0
func_ov079_02212ae0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl func_0203db80
    ldr r0, .L_02212b50
    mov r1, #0x5
    str r0, [r4, #0x0]
    strb r1, [r4, #0x4d]
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, .L_02212b54
    mov r1, #0x0
    ldr r3, [r0, #0x10]
    ldr r2, [r0, #0x14]
    mov r0, r4
    str r3, [r4, #0x298]
    str r2, [r4, #0x29c]
    ldr r2, [r4, #0x260]
    bic r2, r2, #0x8
    orr r2, r2, #0x20
    str r2, [r4, #0x260]
    str r1, [r4, #0x2a0]
    str r1, [r4, #0x2a4]
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.L_02212b50: .word data_ov079_02213c2c
.L_02212b54: .word data_ov079_02213b08
.size func_ov079_02212ae0, . - func_ov079_02212ae0
