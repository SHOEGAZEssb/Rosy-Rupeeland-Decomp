.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02215d40
.extern func_020593dc
.extern func_ov078_022134d0
.extern gSoundContext

.global func_ov078_02214184
func_ov078_02214184:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x278]
    cmp r0, #0x0
    ldrne r2, [r4, #0x228]
    cmpne r2, #0x0
    beq .L_022141cc
    ldr r1, [r2, #0x1c]
    ldr r2, [r2, #0x20]
    bl func_ov078_022134d0
    cmp r0, #0x0
    bne .L_022141cc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    b .L_0221429c
.L_022141cc:
    ldr r0, .L_022142a4
    ldr r2, [r4, #0x2a4]
    ldr r0, [r0, #0xb8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022142a8
    bne .L_022141fc
    ldr r1, [r4, #0x2a8]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022141fc:
    cmp r3, #0x0
    beq .L_0221429c
    ldr r1, .L_022142a4
    add r0, r4, #0x200
    ldr r3, [r1, #0x0]
    ldr r1, [r1, #0x4]
    mov r2, #0x0
    str r3, [r4, #0x2a4]
    str r1, [r4, #0x2a8]
    strh r2, [r0, #0x98]
    strh r2, [r0, #0x9c]
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x8
    str r1, [r4, #0x260]
    ldrh r0, [r0, #0xc6]
    mov r1, #0x100
    str r2, [sp, #0x0]
    cmp r0, #0x0
    mov r2, #0x3
    beq .L_02214268
    ldr r0, .L_022142ac
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    bl func_020593dc
    b .L_02214280
.L_02214268:
    ldr r0, .L_022142ac
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x61
    bl func_020593dc
.L_02214280:
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    ldr r0, [r4, #0x260]
    bicne r0, r0, #0x8
    strne r0, [r4, #0x260]
    orreq r0, r0, #0xa
    streq r0, [r4, #0x260]
.L_0221429c:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_022142a4: .word data_ov078_02215c88
.L_022142a8: .word data_ov078_02215d40
.L_022142ac: .word gSoundContext
.size func_ov078_02214184, . - func_ov078_02214184
