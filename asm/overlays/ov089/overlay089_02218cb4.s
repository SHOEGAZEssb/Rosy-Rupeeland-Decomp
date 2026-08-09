.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219918
.extern func_ov089_02218c44
.extern gSystemState

.global func_ov089_02218cb4
func_ov089_02218cb4:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    ldr r1, .L_02218e64
    mov r2, #0x0
    str r1, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r1, [r0, #0x228]
    cmp r1, #0x0
    bgt .L_02218d40
    ldr r1, .L_02218e68
    ldrh r1, [r1, #0x1c]
    tst r1, #0x40
    movne r1, #0x2c
    strne r1, [r0, #0x228]
    movne r1, #0x4
    strne r1, [r0, #0x22c]
    bne .L_02218ddc
    tst r1, #0x80
    movne r1, #0x2c
    strne r1, [r0, #0x228]
    strne r2, [r0, #0x22c]
    bne .L_02218ddc
    tst r1, #0x20
    movne r1, #0x2c
    strne r1, [r0, #0x228]
    movne r1, #0x6
    strne r1, [r0, #0x22c]
    bne .L_02218ddc
    tst r1, #0x10
    movne r1, #0x2c
    strne r1, [r0, #0x228]
    movne r1, #0x2
    strne r1, [r0, #0x22c]
    b .L_02218ddc
.L_02218d40:
    ldr r3, [r0, #0x22c]
    cmp r3, #0x4
    bne .L_02218d68
    ldr r1, .L_02218e68
    ldrh r1, [r1, #0x1a]
    tst r1, #0x40
    streq r2, [r0, #0x228]
    subeq r1, r2, #0x1
    streq r1, [r0, #0x230]
    beq .L_02218ddc
.L_02218d68:
    cmp r3, #0x0
    bne .L_02218d90
    ldr r1, .L_02218e68
    ldrh r1, [r1, #0x1a]
    tst r1, #0x80
    moveq r1, #0x0
    streq r1, [r0, #0x228]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x230]
    beq .L_02218ddc
.L_02218d90:
    cmp r3, #0x6
    bne .L_02218db8
    ldr r1, .L_02218e68
    ldrh r1, [r1, #0x1a]
    tst r1, #0x20
    moveq r1, #0x0
    streq r1, [r0, #0x228]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x230]
    beq .L_02218ddc
.L_02218db8:
    cmp r3, #0x2
    bne .L_02218ddc
    ldr r1, .L_02218e68
    ldrh r1, [r1, #0x1a]
    tst r1, #0x10
    moveq r1, #0x0
    streq r1, [r0, #0x228]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x230]
.L_02218ddc:
    ldr r1, [r0, #0x228]
    cmp r1, #0x0
    ble .L_02218e54
    sub r1, r1, #0x1
    str r1, [r0, #0x228]
    ldr r1, [r0, #0x230]
    ldr r2, [r0, #0x22c]
    cmp r1, #0x0
    movge r2, r1
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_02218e54
.L_02218e0c:
    b .L_02218e28
    b .L_02218e54
    b .L_02218e34
    b .L_02218e54
    b .L_02218e40
    b .L_02218e54
    b .L_02218e4c
.L_02218e28:
    mov r1, #0xf6
    str r1, [sp, #0x8]
    b .L_02218e54
.L_02218e34:
    mov r1, #0xf6
    str r1, [sp, #0x4]
    b .L_02218e54
.L_02218e40:
    mvn r1, #0xf5
    str r1, [sp, #0x8]
    b .L_02218e54
.L_02218e4c:
    mvn r1, #0xf5
    str r1, [sp, #0x4]
.L_02218e54:
    add r1, sp, #0x0
    bl func_ov089_02218c44
    add sp, sp, #0xc
    ldmia sp!, {pc}
.L_02218e64: .word data_ov089_02219918
.L_02218e68: .word gSystemState
.size func_ov089_02218cb4, . - func_ov089_02218cb4
