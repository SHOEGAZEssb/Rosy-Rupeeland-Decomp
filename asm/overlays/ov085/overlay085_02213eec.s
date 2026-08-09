.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_0209189c
.extern func_ov085_02213b3c
.extern func_ov085_02213bf8

.global func_ov085_02213eec
func_ov085_02213eec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x2
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    bne .L_02213f44
    add r0, r4, #0x254
    mov r1, #0x10
    mov r2, #0xf0
    bl func_0209189c
    mov r3, r0, lsl #0xc
    add r0, r4, #0x254
    mov r1, #0x88
    mov r2, #0xb0
    str r3, [r4, #0x7c]
    bl func_0209189c
    mov r0, r0, lsl #0xc
    str r0, [r4, #0x80]
    mov r0, #0x0
    str r0, [r4, #0x210]
.L_02213f44:
    mov r0, r4
    bl func_ov085_02213bf8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    ldreq r0, [r4, #0x40]
    cmpeq r0, #0x0
    bne .L_02213f88
    mov r0, r4
    bl func_ov085_02213b3c
.L_02213f88:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov085_02213eec, . - func_ov085_02213eec
