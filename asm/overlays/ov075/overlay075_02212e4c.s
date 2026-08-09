.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02216cc8
.extern func_02032a64
.extern func_ov075_02212d80
.extern func_ov075_02212f10

.global func_ov075_02212e4c
func_ov075_02212e4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02032a64
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    str r1, [r4, #0x264]
    bl func_ov075_02212f10
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov075_02212f10
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov075_02212f10
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x20000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x29c]
    bl func_ov075_02212d80
    cmp r0, #0x0
    beq .L_02212edc
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x1fc]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    ldmia sp!, {r4, pc}
.L_02212edc:
    ldr r1, [r4, #0x200]
    ldr r0, .L_02212f0c
    str r1, [r4, #0x1fc]
    ldr r2, [r4, #0x54]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x14
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldmia sp!, {r4, pc}
.L_02212f0c: .word data_ov075_02216cc8
.size func_ov075_02212e4c, . - func_ov075_02212e4c
