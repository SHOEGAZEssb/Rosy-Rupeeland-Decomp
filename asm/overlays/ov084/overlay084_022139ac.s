.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02032228
.extern func_ov084_02213bc8

.global func_ov084_022139ac
func_ov084_022139ac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0xd0]
    mov r2, #0x6
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r3, [r4, #0x260]
    mov r1, #0x2
    bic r3, r3, #0x1
    str r3, [r4, #0x260]
    strh r2, [r4, #0xd6]
    strb r1, [r4, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r5, [r4, #0x228]
    ldr r1, [r1, #0x144]
    blx r1
    mov r3, r0
    ldr lr, [r5, #0x1c]
    ldr r1, [r4, #0x1c]
    ldr ip, [r5, #0x20]
    ldr r2, [r4, #0x20]
    mov r0, r4
    sub r1, lr, r1
    sub r2, ip, r2
    bl func_02032228
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x2
    strneb r0, [r4, #0x24c]
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xa8]
    cmp r0, #0x1
    beq .L_02213a50
    cmp r0, #0x3
    beq .L_02213a5c
    b .L_02213a6c
.L_02213a50:
    mov r0, r4
    bl func_ov084_02213bc8
    b .L_02213a6c
.L_02213a5c:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_02213a6c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_022139ac, . - func_ov084_022139ac
