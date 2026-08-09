.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_0204404c
.extern func_ov083_02213bd4

.global func_ov083_02213b4c
func_ov083_02213b4c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r4, r2
    mov r6, r0
    mov r5, r1
    bne .L_02213bc0
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02213ba0
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02213ba0
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02213bc0
.L_02213ba0:
    ldr r1, [r5, #0x1c]
    ldr r0, [r6, #0x1c]
    sub r0, r1, r0
    cmp r0, #0x0
    mov r1, #0x2800
    rsble r1, r1, #0x0
    add r0, r6, #0x2a0
    bl func_ov083_02213bd4
.L_02213bc0:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_0204404c
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov083_02213b4c, . - func_ov083_02213b4c
