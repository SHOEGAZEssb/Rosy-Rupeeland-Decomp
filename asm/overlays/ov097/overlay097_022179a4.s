.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221a4c8
.extern data_ov097_0221a4d0
.extern data_ov097_0221a518
.extern data_ov097_0221a520
.extern Actor_PlayHorizontalSpatialSound

.global func_ov097_022179a4
func_ov097_022179a4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, .L_02217aac
    mov r2, #0x1
    ldr lr, [r0, #0x2a4]
    ldr r4, [r3, #0x50]
    mov r3, r2
    mov r5, r2
    cmp lr, r4
    ldr r4, .L_02217ab0
    bne .L_022179e0
    ldr ip, [r0, #0x2a8]
    ldr r4, [r4, #0x4]
    cmp ip, r4
    cmpne lr, #0x0
    moveq r5, #0x0
.L_022179e0:
    cmp r5, #0x0
    beq .L_02217a20
    ldr ip, .L_02217aac
    ldr r4, [r0, #0x2a4]
    ldr ip, [ip, #0x8]
    mov r5, #0x1
    cmp r4, ip
    ldr ip, .L_02217ab4
    bne .L_02217a18
    ldr lr, [r0, #0x2a8]
    ldr ip, [ip, #0x4]
    cmp lr, ip
    cmpne r4, #0x0
    moveq r5, #0x0
.L_02217a18:
    cmp r5, #0x0
    movne r3, #0x0
.L_02217a20:
    cmp r3, #0x0
    bne .L_02217a60
    ldr r3, .L_02217aac
    ldr lr, [r0, #0x2a4]
    ldr r3, [r3, #0x58]
    mov r4, #0x1
    cmp lr, r3
    ldr r3, .L_02217ab8
    bne .L_02217a58
    ldr ip, [r0, #0x2a8]
    ldr r3, [r3, #0x4]
    cmp ip, r3
    cmpne lr, #0x0
    moveq r4, #0x0
.L_02217a58:
    cmp r4, #0x0
    movne r2, #0x0
.L_02217a60:
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
    ldr r1, .L_02217abc
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    ldmia sp!, {r3, r4, r5, pc}
.L_02217aac: .word data_ov097_0221a4c8
.L_02217ab0: .word data_ov097_0221a518
.L_02217ab4: .word data_ov097_0221a4d0
.L_02217ab8: .word data_ov097_0221a520
.L_02217abc: .word 0x3089
.size func_ov097_022179a4, . - func_ov097_022179a4
