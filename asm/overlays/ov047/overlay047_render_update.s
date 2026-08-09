.text
; Matching fallback for the portable implementation in src/overlays/ov047/overlay047_render_recovery.c.
.extern func_020b0a54
.extern func_ov047_0220c2c8
.extern func_ov047_0220c308

.global func_ov047_0220bda8
func_ov047_0220bda8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x14
    ldr r1, .L_0220c2a0
    mov r4, r0
    mov r0, #0x0
    str r0, [r1, #0x0]
    str r0, [r1, #-0x4]
    str r0, [r1, #0x10]
    mov r2, #0x1000
    str r2, [sp, #0x0]
    mov r1, #0x8000
    stmib sp, {r1, r2}
    mov r1, #0x1
    str r1, [sp, #0xc]
    mov r2, r0
    mov r1, #0xc0000
    mov r3, #0x100000
    str r0, [sp, #0x10]
    bl func_020b0a54
    ldr r3, .L_0220c2a4
    mov ip, #0x3
    str ip, [r3, #0x0]
    mov r0, #0x0
    str r0, [r3, #0x14]
    mov r1, #0x2
    str r1, [r3, #0x0]
    str r0, [r3, #0x14]
    mov r1, #0x1000000
    str r1, [r3, #0x2c]
    str r1, [r3, #0x2c]
    mov r2, #0x1000
    ldr r1, .L_0220c2a8
    str r2, [r3, #0x2c]
    str r1, [r3, #0x64]
    ldr r1, [r4, #0x20]
    cmp r1, #0xe
    addls pc, pc, r1, lsl #0x2
    b .L_0220c28c
.L_0220be40:
    b .L_0220c28c
    b .L_0220be7c
    b .L_0220be7c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220c19c
    b .L_0220be7c
    b .L_0220be7c
    b .L_0220be7c
    b .L_0220be7c
.L_0220be7c:
    str ip, [sp, #0x0]
    str ip, [sp, #0x4]
    mov r1, #0x1
    str r1, [sp, #0x8]
    ldr r0, [r4, #0x30]
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x38]
    ldr r2, [r4, #0x3c]
    ldr r3, [r4, #0x40]
    bl func_ov047_0220c2c8
    ldr r0, [r4, #0x38]
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    ldr r1, [r4, #0x34]
    rsb r0, r0, #0x4
    mov r0, r1, lsr r0
    ldr r1, .L_0220c2ac
    mov r2, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #0x54]
    str r2, [r1, #-0x2c]
    str r2, [r1, #-0x24]
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    sub r2, r2, #0x1000
    bl func_ov047_0220c308
    mov r0, #0x8000000
    ldr r1, .L_0220c2b0
    add r3, r0, #0x800
    str r0, [r1, #0x0]
    ldr r0, [r4, #0x1c]
    ldr ip, [r4, #0x10]
    mov r0, r0, lsl #0x10
    mov r2, r0, asr #0x10
    mov r0, ip, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, asr #0x10
    mov r2, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0xc]
    str r3, [r1, #0x0]
    ldr r0, [r4, #0x1c]
    ldr r2, [r4, #0x18]
    mov r0, r0, lsl #0x10
    mov r3, r0, asr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, asr #0x10
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r1, #0xc]
    mov r2, #0x800
    str r2, [r1, #0x0]
    ldr r2, [r4, #0x14]
    ldr ip, [r4, #0x18]
    mov r2, r2, lsl #0x10
    mov r3, r2, asr #0x10
    mov r2, ip, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, asr #0x10
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    mov r0, #0x0
    str r2, [r1, #0xc]
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov047_0220c2c8
    ldr r1, .L_0220c2b4
    ldr r0, .L_0220c2b8
    mov r3, r1, lsl #0x10
    add r2, r1, #0xc40000
    str r1, [r0, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x10]
    mov ip, r3
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    orr r2, r2, #0xc20000
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x10]
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    mov r2, r2, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x18]
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    mov r2, r2, lsl #0x10
    orr r2, ip, r2, lsr #0x10
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x18]
    ldr r3, .L_0220c2bc
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    orr r2, r2, #0xc20000
    str r2, [r0, #0x0]
    str r3, [r0, #0x0]
    sub r2, r3, #0xc40000
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x10]
    mov r3, ip
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    mov r2, r2, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x14]
    ldr ip, [r4, #0x10]
    mov r2, r2, lsl #0x10
    mov r3, r2, asr #0x10
    mov r2, ip, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, asr #0x10
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r0, #0x0]
    ldr r2, [r4, #0x14]
    ldr ip, [r4, #0x18]
    mov r2, r2, lsl #0x10
    mov r3, r2, asr #0x10
    mov r2, ip, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, asr #0x10
    mov r3, r3, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r0, #0x0]
    ldr r3, [r4, #0x18]
    mov r2, r1, lsl #0x10
    mov r1, r3, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x1c]
    ldr r3, [r4, #0x10]
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x10]
    mov r3, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    orr r1, r1, #0xc20000
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x18]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    orr r1, r1, #0xc20000
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x1c]
    ldr r4, [r4, #0x18]
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    mov r1, r4, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    str r3, [r0, #0x70]
    b .L_0220c28c
.L_0220c19c:
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov047_0220c2c8
    mov r2, #0x0
    ldr r0, .L_0220c2c0
    mov r1, #0x1
    str r1, [r0, #0x0]
    str r2, [r0, #-0x80]
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x14]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    sub r2, r2, #0x1000
    bl func_ov047_0220c308
    ldr r0, [r4, #0x1c]
    ldr r2, [r4, #0x10]
    mov r0, r0, lsl #0x10
    mov r1, r0, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r0, asr #0x10
    mov r0, r1, lsr #0x10
    mov r1, r2, lsl #0x10
    mov r2, r0, lsl #0x10
    ldr r0, .L_0220c2b8
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x1c]
    ldr r3, [r4, #0x18]
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    ldr r1, [r4, #0x14]
    ldr r3, [r4, #0x18]
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    str r1, [r0, #0x0]
    mov r1, #0x0
    str r1, [r0, #0x70]
.L_0220c28c:
    ldr r0, .L_0220c2c4
    mov r1, #0x1
    str r1, [r0, #0x0]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, pc}
.L_0220c2a0: .word 0x4000444
.L_0220c2a4: .word 0x4000440
.L_0220c2a8: .word 0x3c1f00c0
.L_0220c2ac: .word 0x40004ac
.L_0220c2b0: .word 0x4000488
.L_0220c2b4: .word 0xfffefffe
.L_0220c2b8: .word 0x4000494
.L_0220c2bc: .word 0xc20102
.L_0220c2c0: .word 0x4000500
.L_0220c2c4: .word 0x4000448
.size func_ov047_0220bda8, . - func_ov047_0220bda8
