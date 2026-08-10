.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern __construct_array
.extern data_021052fc
.extern data_ov092_0221c728
.extern func_02007f0c
.extern Actor_TranslateSecondaryBounds
.extern func_0204d520
.extern func_ov092_02217928
.extern func_ov092_0221792c
.extern func_ov092_02217930
.extern gGameWork

.global func_ov092_02217940
func_ov092_02217940:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    bl func_0204d520
    ldr r0, .L_02217b68
    mov r1, #0x0
    str r0, [r10, #0x0]
    strb r1, [r10, #0x1ec]
    strb r1, [r10, #0x1ed]
    add r0, r10, #0x100
    strh r1, [r0, #0xee]
    ldr r4, .L_02217b6c
    ldr r3, .L_02217b70
    add r0, r10, #0x1f0
    mov r1, #0x5
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r7, #0x0
    str r7, [r10, #0x240]
    strb r7, [r10, #0x278]
    mov r11, #0x1
    strb r7, [r10, #0x279]
    add r0, r10, #0x200
    strh r7, [r0, #0x7a]
    strh r7, [r0, #0x84]
    strh r7, [r0, #0x86]
    strh r7, [r0, #0x88]
    strh r7, [r0, #0x8a]
    sub r1, r7, #0x1
    strh r1, [r0, #0x8c]
    strh r7, [r0, #0x8e]
    strh r7, [r0, #0x98]
    strh r7, [r0, #0x9a]
    strh r7, [r0, #0x9c]
    strh r7, [r0, #0x9e]
    strb r7, [r10, #0x2a0]
    mov r9, r7
    strh r7, [r0, #0xa2]
    mvn r5, #0xf
    mov r6, r11
    ldr r4, .L_02217b74
    b .L_02217b20
.L_022179e8:
    ldr r0, [r4, #0x0]
    mov r1, r6
    bl func_02007f0c
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_02217b1c
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x3
    moveq r0, r11
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02217b1c
    ldrh r0, [r8, #0x4e]
    cmp r0, #0x10
    bne .L_02217b1c
    cmp r7, #0x5
    bge .L_02217a68
    add r0, r10, r7, lsl #0x2
    str r8, [r0, #0x22c]
    ldr r3, [r8, #0x54]
    mov r0, r8
    ldrh ip, [r3, #0x24]
    mov r1, #0x0
    mov r2, r5
    orr ip, ip, #0x12
    strh ip, [r3, #0x24]
    bl Actor_TranslateSecondaryBounds
    ldr r0, [r8, #0x5c]
    and r0, r0, r5, lsl #0xc
    orr r0, r0, #0x20
    str r0, [r8, #0x5c]
    b .L_02217b18
.L_02217a68:
    bne .L_02217ab4
    str r8, [r10, #0x254]
    ldr r3, [r8, #0x54]
    mov r1, #0x0
    ldrh ip, [r3, #0x24]
    mov r0, r8
    mov r2, r1
    orr ip, ip, #0x12
    strh ip, [r3, #0x24]
    bl Actor_TranslateSecondaryBounds
    ldr r1, [r8, #0x5c]
    add r0, r8, #0x18
    and r1, r1, r5, lsl #0xc
    str r1, [r8, #0x5c]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
    b .L_02217b18
.L_02217ab4:
    cmp r7, #0x6
    strne r8, [r10, #0x274]
    ldrne r1, [r8, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x12
    strneh r0, [r1, #0x24]
    bne .L_02217b18
    str r8, [r10, #0x264]
    ldr r3, [r8, #0x54]
    mov r0, r8
    ldrh ip, [r3, #0x24]
    mov r1, #0x0
    mov r2, r5
    orr ip, ip, #0x12
    strh ip, [r3, #0x24]
    bl Actor_TranslateSecondaryBounds
    ldr r1, [r8, #0x5c]
    add r0, r8, #0x18
    and r1, r1, r5, lsl #0xc
    orr r1, r1, #0x20
    str r1, [r8, #0x5c]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov092_02217930
.L_02217b18:
    add r7, r7, #0x1
.L_02217b1c:
    add r9, r9, #0x1
.L_02217b20:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    cmplt r7, #0x8
    blt .L_022179e8
    ldr r0, .L_02217b78
    ldr r0, [r0, #0x0]
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x46]
    cmp r0, #0x0
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r10
    strb r1, [r10, #0x2a1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217b68: .word data_ov092_0221c728
.L_02217b6c: .word func_ov092_0221792c
.L_02217b70: .word func_ov092_02217928
.L_02217b74: .word data_021052fc
.L_02217b78: .word gGameWork
.size func_ov092_02217940, . - func_ov092_02217940
