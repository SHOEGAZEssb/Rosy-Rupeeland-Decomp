.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_022151bc
func_ov077_022151bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x11
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x13
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x58]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x13
    strneh r0, [r1, #0x24]
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02215208
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02215208:
    mov r0, #0x0
    str r0, [r4, #0x298]
    ldr r0, [r4, #0x2c4]
    cmp r0, #0x0
    beq .L_02215228
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02215228:
    mov r0, #0x0
    str r0, [r4, #0x2c4]
    ldr r1, [r4, #0x14]
    orr r1, r1, #0x10000000
    str r1, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov077_022151bc, . - func_ov077_022151bc
