.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern data_021052fc
.extern func_020afce8

.global func_ov064_02211cec
func_ov064_02211cec:
    stmdb sp!, {r4, lr}
    ldrb r1, [r0, #0x77]
    cmp r1, #0x3
    beq .L_02211d14
    ldr r0, .L_02211dc8
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    b .L_02211dc0
.L_02211d14:
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_02211d88
    ldrsh r0, [r0, #0x74]
    mvn r1, #0xf
    mov ip, #0x4000000
    mov r0, r0, lsl #0x1
    rsb r4, r0, #0x0
    cmp r4, r1
    movlt r4, r1
    ldr r1, [ip, #0x0]
    ldr r0, [ip, #0x0]
    and r1, r1, #0x1f00
    mov r2, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r2, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [ip, #0x0]
    mov r3, #0x0
    mov r2, r4
    add r0, ip, #0x50
    mov r1, #0xf
    strh r3, [ip, #0x50]
    bl func_020afce8
    ldr r0, .L_02211dcc
    mov r2, r4
    mov r1, #0xf
    bl func_020afce8
    b .L_02211dc0
.L_02211d88:
    cmp r1, #0x1
    bne .L_02211dc0
    ldrsh r1, [r0, #0x74]
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    cmp r0, #0x0
    movgt r0, #0x1f
    mov r0, r0, lsl #0x10
    mov r1, #0x5000000
    mov r2, r0, lsr #0x10
    strh r2, [r1, #0x0]
    add r0, r1, #0x400
    strh r2, [r0, #0x0]
.L_02211dc0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02211dc8: .word data_021052fc
.L_02211dcc: .word 0x4001050
.size func_ov064_02211cec, . - func_ov064_02211cec
