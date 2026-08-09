.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_02105310
.extern func_0200b04c
.extern func_02050260
.extern func_020505f0

.global func_ov095_0221ca14
func_ov095_0221ca14:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, .L_0221cadc
    mov r5, r1
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_0221cabc
    cmp r5, #0x0
    beq .L_0221cabc
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0221ca98
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0221ca98
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0221ca98
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221cabc
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x5
    bne .L_0221cabc
.L_0221ca98:
    mov r0, r4
    bl func_02050260
    mov r0, r4
    bl func_020505f0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xdc]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0221cabc:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc8]
    blx r1
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x800000
    str r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221cadc: .word data_02105310
.size func_ov095_0221ca14, . - func_ov095_0221ca14
