.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_020adc40

.global func_ov069_02211778
func_ov069_02211778:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r2, #0x5a
    mvn r7, #0x0
    mov r10, r0
    mov r9, r1
    sub r8, r2, #0x1
    mov r6, #0x3e8000
    mov r5, r7
    mov r4, #0x0
    mov r11, #0x800
.L_022117a0:
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x7c0]
    cmp r0, #0x0
    beq .L_0221181c
    add r0, r1, #0x1000
    ldr r0, [r0, #0x30]
    cmp r0, r5
    bgt .L_0221181c
    add r0, r10, r8, lsl #0x4
    ldr r3, [r0, #0xa9c]
    ldr r1, [r0, #0xa94]
    ldr r0, [r9, #0x4]
    ldr r2, [r9, #0x8]
    sub r0, r1, r0
    sub ip, r3, r2
    smull r1, r2, r0, r0
    mov r0, #0x800
    adds r3, r1, r0
    smull r1, r0, ip, ip
    adc ip, r2, #0x0
    adds r1, r1, r11
    mov r2, r3, lsr #0xc
    adc r0, r0, r4
    mov r1, r1, lsr #0xc
    orr r2, r2, ip, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    bl func_020adc40
    cmp r6, r0
    movgt r6, r0
    movgt r7, r8
.L_0221181c:
    subs r8, r8, #0x1
    bpl .L_022117a0
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov069_02211778, . - func_ov069_02211778
