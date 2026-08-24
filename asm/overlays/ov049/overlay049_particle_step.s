.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern gFx32CosSinTable
.extern func_020bf1f8
.extern func_ov049_0220c23c
.extern genrand_int32

.global func_ov049_0220c6cc
func_ov049_0220c6cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x24
    mov r3, #0xa
    mov r7, r0
    mov r6, r1
    str r2, [sp, #0x0]
    sub r5, r3, #0x1
.L_0220c6e8:
    add r0, r7, r5, lsl #0x1
    add r0, r0, #0x600
    ldrsh r0, [r0, #0x44]
    cmp r0, #0x0
    bge .L_0220c88c
    mov r8, #0x14
    ldr r0, [sp, #0x0]
    mla r8, r5, r8, r7
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r10, r3, #0x1
    mov r0, #0x3c
    mul r2, r5, r0
    str r8, [sp, #0x4]
    add r1, r7, #0x4
    add r0, r7, #0x25c
    mov r4, #0x5
    add r1, r1, r2
    add r0, r0, r2
    ldr r9, .L_0220c89c
    mov r10, r10, lsl #0x1
    mov r8, r3, lsl #0x1
    ldrsh r3, [r9, r10]
    sub r4, r4, #0x1
    str r1, [sp, #0xc]
    str r3, [sp, #0x18]
    ldrsh r3, [r9, r8]
    str r0, [sp, #0x8]
    str r3, [sp, #0x10]
    add r3, r7, r2
    str r3, [sp, #0x20]
    ldr r3, [sp, #0x18]
    mov r3, r3, asr #0x1f
    str r3, [sp, #0x1c]
    ldr r3, [sp, #0x10]
    mov r3, r3, asr #0x1f
    str r3, [sp, #0x14]
.L_0220c77c:
    mov r0, #0xc
    mul r1, r4, r0
    ldr r0, [sp, #0x20]
    ldr r3, [r6, #0x4]
    add ip, r0, r1
    rsb r0, r4, #0x0
    add r2, r0, r0, lsl #0x3
    mov r0, #0x64
    mla r0, r4, r0, r3
    str r0, [ip, #0x8]
    ldr r0, [r6, #0x8]
    mov r3, r2, lsl #0xc
    str r0, [ip, #0xc]
    ldr r0, [sp, #0x8]
    ldr r8, [sp, #0xc]
    add r0, r0, r1
    ldr r10, [sp, #0x18]
    add r1, r8, r1
    umull r9, r8, r10, r3
    mov r2, r3, asr #0x1f
    mla r8, r10, r2, r8
    ldr r10, [sp, #0x1c]
    adds r9, r9, #0x800
    mla r8, r10, r3, r8
    ldr lr, [ip, #0x8]
    mov r9, r9, lsr #0xc
    adc r8, r8, #0x0
    orr r9, r9, r8, lsl #0x14
    add r8, lr, r9
    str r8, [ip, #0x8]
    ldr r10, [sp, #0x10]
    ldr r9, [ip, #0xc]
    umull r8, lr, r10, r3
    mla lr, r10, r2, lr
    ldr r2, [sp, #0x14]
    mla lr, r2, r3, lr
    adds r3, r8, #0x800
    adc r2, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r2, r9, r3
    str r2, [ip, #0xc]
    bl func_ov049_0220c23c
    ldr r0, [sp, #0x4]
    add r1, r0, r4, lsl #0x2
    mov r0, #0xf
    str r0, [r1, #0x57c]
    ldr r0, [sp, #0x0]
    subs r4, r4, #0x1
    str r0, [r1, #0x4b4]
    bpl .L_0220c77c
    add r0, r7, r5, lsl #0x1
    mov r1, #0x0
    add r0, r0, #0x600
    strh r1, [r0, #0x6c]
    strh r1, [r0, #0x58]
    strh r1, [r0, #0x44]
    bl genrand_int32
    mov r1, #0x14
    bl func_020bf1f8
    add r1, r1, r1, lsl #0x2
    add r0, r7, r5, lsl #0x1
    add r1, r1, #0xc8
    add r0, r0, #0x600
    strh r1, [r0, #0x80]
    mov r1, #0x0
    strh r1, [r0, #0x94]
    b .L_0220c894
.L_0220c88c:
    subs r5, r5, #0x1
    bpl .L_0220c6e8
.L_0220c894:
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0220c89c: .word gFx32CosSinTable
.size func_ov049_0220c6cc, . - func_ov049_0220c6cc
