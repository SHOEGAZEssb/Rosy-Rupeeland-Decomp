.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern GameWork_TestFlag
.extern data_020e83a0
.extern data_ov077_02216fc8
.extern data_ov077_022172f4
.extern func_02043610
.extern func_020541d4
.extern func_0206899c
.extern func_020befec
.extern func_ov077_02212ae0
.extern gGameWork

.global func_ov077_02213110
func_ov077_02213110:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x70
    mov r4, r0
    bl func_ov077_02212ae0
    ldr r0, .L_02213374
    mov r7, #0x1000
    str r0, [r4, #0x0]
    ldrb r0, [r4, #0x2e4]
    mov r2, #0x0
    add ip, r4, #0x200
    bic r1, r0, #0x70
    and r0, r1, #0xff
    bic r0, r0, #0x80
    strb r0, [r4, #0x2e4]
    strb r2, [r4, #0x2e5]
    strh r2, [ip, #0xe6]
    strh r2, [ip, #0xe8]
    strh r2, [ip, #0xea]
    strh r2, [ip, #0xec]
    strh r2, [ip, #0xee]
    ldrh r0, [ip, #0xf2]
    sub r5, r7, #0x11000
    ldr r3, .L_02213378
    bic r0, r0, #0x1
    strh r0, [ip, #0xf2]
    ldrh r0, [ip, #0xf2]
    add lr, r4, #0x300
    mov r6, r5
    bic r0, r0, #0x8
    strh r0, [ip, #0xf2]
    ldrh r8, [ip, #0xf2]
    mov r0, r4
    add r1, sp, #0x40
    bic r8, r8, #0x30
    strh r8, [ip, #0xf2]
    ldrh r8, [ip, #0xf2]
    bic r8, r8, #0x40
    strh r8, [ip, #0xf2]
    ldrh r8, [ip, #0xf2]
    and r3, r8, r3
    strh r3, [ip, #0xf2]
    str r2, [r4, #0x2f4]
    str r2, [r4, #0x2f8]
    strh r2, [ip, #0xfc]
    strh r2, [ip, #0xfe]
    strh r2, [lr, #0x0]
    strh r7, [lr, #0x2]
    strh r2, [lr, #0x4]
    strh r2, [lr, #0x6]
    ldr r2, [r4, #0x308]
    and r2, r2, r5
    orr r3, r2, #0x1
    mov r2, r3, lsl #0x10
    orr r2, r6, r2, lsr #0x10
    str r2, [r4, #0x308]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xc8]
    blx r2
    ldrsb r0, [sp, #0x65]
    bl func_020541d4
    str r0, [r4, #0x2d0]
    add r1, r4, #0x200
    mov r0, #0x12c
    strh r0, [r1, #0xca]
    mov r2, #0x1e
    strh r2, [r1, #0xce]
    mov r0, r4
    strh r2, [r1, #0xcc]
    bl func_02043610
    cmp r0, #0x0
    beq .L_02213234
    cmp r0, #0x1
    b .L_02213288
.L_02213234:
    add r0, r4, #0x200
    ldrsb r3, [r0, #0xe4]
    mov r2, #0x0
    ldr r1, .L_0221337c
    bic r3, r3, #0xf
    strb r3, [r4, #0x2e4]
    strh r2, [r0, #0xc8]
    ldr r2, [r1, #0x60]
    ldr r1, [r1, #0x64]
    str r2, [r4, #0x218]
    str r1, [r4, #0x21c]
    ldrh r1, [r0, #0xf2]
    bic r1, r1, #0x2
    strh r1, [r0, #0xf2]
    ldrh r1, [r0, #0xf2]
    bic r1, r1, #0x4
    strh r1, [r0, #0xf2]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x2
    str r0, [r4, #0x14]
    b .L_02213314
.L_02213288:
    add r0, r4, #0x200
    ldrsb r1, [r0, #0xe4]
    mvn r2, #0x0
    bic r1, r1, #0xf
    orr r1, r1, #0x1
    strb r1, [r4, #0x2e4]
    ldrsh r1, [r0, #0xca]
    strh r1, [r0, #0xc8]
    ldr r1, [r4, #0x1cc]
    cmp r1, r2
    beq .L_022132f8
    ldr r0, .L_02213380
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_022132f8
    ldr r0, .L_0221337c
    mov r1, #0x3
    ldr r2, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldrb r0, [r4, #0x2e4]
    bic r0, r0, #0x70
    orr r0, r0, #0x30
    strb r0, [r4, #0x2e4]
    strh r1, [r4, #0xda]
    b .L_02213314
.L_022132f8:
    add r0, r4, #0x200
    ldrh r1, [r0, #0xf2]
    orr r1, r1, #0x6
    strh r1, [r0, #0xf2]
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x1000
    str r0, [r4, #0x260]
.L_02213314:
    ldr r1, [r4, #0x10]
    mov r0, #0x30
    orr r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldrh r2, [r4, #0x4e]
    ldr r1, .L_02213384
    mul r0, r2, r0
    ldrsh r0, [r1, r0]
    bl func_0206899c
    add r6, sp, #0x0
    mov ip, r0
    mov r5, #0x4
.L_02213344:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_02213344
    ldr r0, [sp, #0x20]
    mov r1, #0xa
    bl func_020befec
    add r1, r4, #0x200
    strh r0, [r1, #0xf0]
    mov r0, r4
    add sp, sp, #0x70
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02213374: .word data_ov077_022172f4
.L_02213378: .word 0xffff007f
.L_0221337c: .word data_ov077_02216fc8
.L_02213380: .word gGameWork
.L_02213384: .word data_020e83a0
.size func_ov077_02213110, . - func_ov077_02213110
