.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_particle_recovery.c.
.extern func_020adc40

.global func_ov049_0220c3d8
func_ov049_0220c3d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r3, #0xa
    mov r11, #0x0
    mov r10, r0
    mov r9, r1
    mov r8, r2
    sub r7, r3, #0x1
    mvn r6, #0x0
    mov r5, r11
    mov r4, #0x800
.L_0220c400:
    add r0, r10, r7, lsl #0x1
    add r0, r0, #0x600
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x6c]
    cmpeq r0, #0x0
    bne .L_0220c47c
    mov r0, #0x3c
    mla r2, r7, r0, r10
    ldr r1, [r9, #0x8]
    ldr r0, [r2, #0x24]
    ldr r3, [r9, #0x4]
    sub ip, r1, r0
    ldr r0, [r2, #0x20]
    smull r2, r1, ip, ip
    sub r0, r3, r0
    smull ip, r3, r0, r0
    mov r0, #0x800
    adds r0, ip, r0
    adc r3, r3, r11
    adds r2, r2, r4
    mov r0, r0, lsr #0xc
    adc r1, r1, r5
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_020adc40
    cmp r0, r8
    movlt r8, r0
    movlt r6, r7
.L_0220c47c:
    subs r7, r7, #0x1
    bpl .L_0220c400
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov049_0220c3d8, . - func_ov049_0220c3d8
