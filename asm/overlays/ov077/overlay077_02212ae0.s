.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_ov077_02217118
.extern func_0200500c
.extern func_0203db80

.global func_ov077_02212ae0
func_ov077_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203db80
    mov r1, #0x0
    ldr r0, .L_02212b74
    mov r2, r1
    str r0, [r4, #0x0]
    str r1, [r4, #0x298]
    str r1, [r4, #0x29c]
    strb r1, [r4, #0x2a0]
    mov r3, r1
    strb r1, [r4, #0x2a1]
    add ip, r4, #0x200
    add r0, r4, #0x2a4
    strh r1, [ip, #0xa2]
    bl func_0200500c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x2b4
    bl func_0200500c
    ldr r0, .L_02212b78
    ldr r2, [r4, #0x14]
    rsb r1, r0, #0x20
    orr r2, r2, #0x40
    str r2, [r4, #0x14]
    ldr r3, [r4, #0x260]
    sub r2, r0, #0x40
    orr r0, r3, #0x20
    orr r0, r0, #0x10000
    str r0, [r4, #0x260]
    ldr r3, [r4, #0x5c]
    mov r0, r4
    and r1, r3, r1
    orr r1, r1, r2
    str r1, [r4, #0x5c]
    ldmia sp!, {r4, pc}
.L_02212b74: .word data_ov077_02217118
.L_02212b78: .word 0x10020
.size func_ov077_02212ae0, . - func_ov077_02212ae0
