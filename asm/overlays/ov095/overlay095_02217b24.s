.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cba8
.extern data_ov095_0221cbc8
.extern data_ov095_0221cbd0
.extern Actor_PlayHorizontalSpatialSound

.global func_ov095_02217b24
func_ov095_02217b24:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, .L_02217c2c
    mov r2, #0x1
    ldr lr, [r0, #0x2a4]
    ldr r4, [r3, #0x0]
    mov r3, r2
    mov r5, r2
    cmp lr, r4
    ldr r4, .L_02217c30
    bne .L_02217b60
    ldr ip, [r0, #0x2a8]
    ldr r4, [r4, #0x4]
    cmp ip, r4
    cmpne lr, #0x0
    moveq r5, #0x0
.L_02217b60:
    cmp r5, #0x0
    beq .L_02217ba0
    ldr ip, .L_02217c2c
    ldr r4, [r0, #0x2a4]
    ldr ip, [ip, #0x20]
    mov r5, #0x1
    cmp r4, ip
    ldr ip, .L_02217c34
    bne .L_02217b98
    ldr lr, [r0, #0x2a8]
    ldr ip, [ip, #0x4]
    cmp lr, ip
    cmpne r4, #0x0
    moveq r5, #0x0
.L_02217b98:
    cmp r5, #0x0
    movne r3, #0x0
.L_02217ba0:
    cmp r3, #0x0
    bne .L_02217be0
    ldr r3, .L_02217c2c
    ldr lr, [r0, #0x2a4]
    ldr r3, [r3, #0x28]
    mov r4, #0x1
    cmp lr, r3
    ldr r3, .L_02217c38
    bne .L_02217bd8
    ldr ip, [r0, #0x2a8]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r4, #0x0
.L_02217bd8:
    cmp r4, #0x0
    movne r2, #0x0
.L_02217be0:
    cmp r2, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, [r0, #0x260]
    orr r2, r2, #0x10
    str r2, [r0, #0x260]
    ldr r2, [r1, #0xd0]
    tst r2, #0x100
    ldmneia sp!, {r3, r4, r5, pc}
    add r1, r1, #0x200
    ldrsh r1, [r1, #0x68]
    cmp r1, #0x0
    movgt r1, #0x1
    movle r1, #0x0
    cmp r1, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, .L_02217c3c
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldmia sp!, {r3, r4, r5, pc}
.L_02217c2c: .word data_ov095_0221cba8
.L_02217c30: .word data_ov095_0221cba8
.L_02217c34: .word data_ov095_0221cbc8
.L_02217c38: .word data_ov095_0221cbd0
.L_02217c3c: .word 0x3089
.size func_ov095_02217b24, . - func_ov095_02217b24
