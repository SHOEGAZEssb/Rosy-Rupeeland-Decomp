.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_sprite_recovery.c.
.extern func_02072b68
.extern func_020adc40

.global func_ov049_0220bac0
func_ov049_0220bac0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r6, r0
    mov r8, #0x0
    mov r7, #0x800
    mov r5, r1
    ldr r4, [r6, #0x88]
    mov r10, r8
    mov r9, r7
    b .L_0220bb74
.L_0220bae4:
    add r1, r6, r4, lsl #0x2
    ldr r0, [r1, #0x68]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    bne .L_0220bb74
    ldr r1, [r1, #0x4c]
    ldr r0, [r5, #0x8]
    ldr r3, [r1, #0x34]
    ldr r2, [r1, #0x30]
    ldr r1, [r5, #0x4]
    sub r0, r3, r0
    sub r2, r2, r1
    smull r1, ip, r2, r2
    adds r1, r1, r7
    smull r3, r2, r0, r0
    adc r0, ip, r8
    adds r3, r3, r9
    mov ip, r1, lsr #0xc
    adc r1, r2, r10
    mov r2, r3, lsr #0xc
    orr ip, ip, r0, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, ip, r2
    bl func_020adc40
    cmp r0, #0x1e000
    bge .L_0220bb74
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r6, r4, lsl #0x1
    mov r1, #0x1a4
    strh r1, [r0, #0xac]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0220bb74:
    subs r4, r4, #0x1
    bpl .L_0220bae4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_ov049_0220bac0, . - func_ov049_0220bac0
