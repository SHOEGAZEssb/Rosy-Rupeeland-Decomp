.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_sprite_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_02072b68
.extern func_020adc40
.extern func_ov049_0220be28

.global func_ov049_0220bee8
func_ov049_0220bee8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    bl func_ov049_0220be28
    mov r8, #0x0
    mov r11, #0x800
    ldr r9, [r10, #0x88]
    mov r7, #0x7f
    mov r4, r8
    mov r6, r8
    mov r5, r11
    b .L_0220c0a8
.L_0220bf18:
    add r1, r10, r9, lsl #0x1
    ldrsh r0, [r1, #0xac]
    cmp r0, #0x1
    bne .L_0220bf74
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r0, [r0, #0xc]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0220bfbc
    mov r1, #0x0
    bl func_02072b68
    add r0, r10, r9, lsl #0x2
    ldr r1, [r0, #0x4c]
    add r0, r10, r9, lsl #0x1
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    strh r8, [r0, #0xac]
    b .L_0220bfbc
.L_0220bf74:
    cmp r0, #0x0
    ble .L_0220bfbc
    sub r0, r0, #0x1
    strh r0, [r1, #0xac]
    ldrsh r0, [r1, #0xac]
    cmp r0, #0x1
    bne .L_0220bfbc
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, #0x2
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_0220bfbc:
    add r0, r10, r9, lsl #0x2
    ldr r2, [r0, #0x68]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r2, [r10, #0x48]
    ldr r1, [r2, #0x74]
    cmp r1, #0x17
    blt .L_0220c014
    cmp r1, #0x1a
    bgt .L_0220c014
    add r1, r10, r9, lsl #0x1
    ldrsh r1, [r1, #0xac]
    cmp r1, #0x1
    bgt .L_0220c008
    ldr r0, [r0, #0x4c]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl func_02072b68
.L_0220c008:
    add r0, r10, r9, lsl #0x1
    strh r7, [r0, #0xac]
    b .L_0220c0a8
.L_0220c014:
    add r0, r10, r9, lsl #0x1
    ldrsh r0, [r0, #0xac]
    cmp r0, #0x0
    bne .L_0220c0a8
    ldr r1, [r2, #0x8]
    add r0, sp, #0x0
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl func_02005030
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x4c]
    ldr r2, [sp, #0x8]
    ldr r1, [r0, #0x34]
    ldr r0, [r0, #0x30]
    sub r3, r2, r1
    smull r2, r1, r3, r3
    ldr r3, [sp, #0x4]
    sub ip, r3, r0
    smull r3, r0, ip, ip
    adds ip, r3, r11
    adc r3, r0, r4
    adds r2, r2, r5
    mov r0, ip, lsr #0xc
    adc r1, r1, r6
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    cmp r0, #0x1e000
    addlt r0, r10, r9, lsl #0x2
    ldrlt r1, [r0, #0x68]
    ldrlth r0, [r1, #0x42]
    biclt r0, r0, #0x4
    strlth r0, [r1, #0x42]
    add r0, sp, #0x0
    bl func_02005058
.L_0220c0a8:
    subs r9, r9, #0x1
    bpl .L_0220bf18
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov049_0220bee8, . - func_ov049_0220bee8
