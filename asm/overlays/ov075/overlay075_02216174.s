.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern func_020050a4
.extern func_02044058
.extern func_ov075_0221625c

.global func_ov075_02216174
func_ov075_02216174:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r2, r5, #0x200
    ldrh r3, [r2, #0xa2]
    mov r4, r1
    mov ip, r3, lsl #0x1e
    movs ip, ip, lsr #0x1f
    beq .L_022161d0
    bic r3, r3, #0x2
    strh r3, [r2, #0xa2]
    bl func_02044058
    mov r0, #0x0
    str r0, [r5, #0x2a8]
    add r0, r5, #0x200
    ldrh r2, [r0, #0xa2]
    mov r1, #0x2
    bic r2, r2, #0x1
    strh r2, [r0, #0xa2]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r5, #0xd0]
    strh r1, [r5, #0xd6]
    ldmia sp!, {r3, r4, r5, pc}
.L_022161d0:
    mov r1, r3, lsl #0x1f
    movs r1, r1, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov075_0221625c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    str r4, [r5, #0x2a8]
    add r3, r5, #0x200
    ldrh r1, [r3, #0xa2]
    mov r0, #0x0
    ldr r2, .L_02216254
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [r3, #0xa2]
    strh r0, [r3, #0xa0]
    ldrh r4, [r3, #0xa2]
    add r0, r5, #0x2ac
    add r1, r5, #0x18
    and r2, r4, r2
    strh r2, [r3, #0xa2]
    bl func_020050a4
    ldr r0, .L_02216258
    ldr r1, [r0, #0xb0]
    ldr r0, [r0, #0xb4]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    ldmia sp!, {r3, r4, r5, pc}
.L_02216254: .word 0xffff0003
.L_02216258: .word data_ov075_02217290
.size func_ov075_02216174, . - func_ov075_02216174
