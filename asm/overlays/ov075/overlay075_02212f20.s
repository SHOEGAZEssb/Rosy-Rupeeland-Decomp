.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern func_020050a4
.extern func_02033f44

.global func_ov075_02212f20
func_ov075_02212f20:
    stmdb sp!, {r4, lr}
    ldr r2, .L_02212f94
    mov r4, r0
    ldr r3, [r2, #0x20]
    ldr r2, [r2, #0x24]
    add r0, r4, #0x28
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x18
    bl func_020050a4
    mov r0, r4
    bl func_02033f44
    sub r0, r0, #0x1000
    str r0, [r4, #0x24]
    mov r0, #0x0
    str r0, [r4, #0x298]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x200]
    str r0, [r4, #0x1fc]
    ldmia sp!, {r4, pc}
.L_02212f94: .word data_ov075_02216cc8
.size func_ov075_02212f20, . - func_ov075_02212f20
