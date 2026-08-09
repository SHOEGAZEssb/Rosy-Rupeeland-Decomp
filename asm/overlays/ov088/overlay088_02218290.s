.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_0205940c
.extern func_ov088_02219960
.extern gSoundContext

.global func_ov088_02218290
func_ov088_02218290:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_ov088_02219960
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x238]
    ldrh r2, [r0, #0x26]
    cmp r2, #0x0
    beq .L_022182d0
    ldr r0, .L_02218320
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_022182d0:
    ldr r0, .L_02218320
    ldr r1, .L_02218324
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    ldr r0, .L_02218320
    mov r1, #0x1fc
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    add r0, r4, #0x200
    ldrh r2, [r0, #0x1a]
    mov r1, #0x0
    bic r2, r2, #0x2000
    strh r2, [r0, #0x1a]
    strh r1, [r0, #0x6c]
    ldrh r1, [r0, #0x1a]
    orr r1, r1, #0x20
    strh r1, [r0, #0x1a]
    ldmia sp!, {r4, pc}
.L_02218320: .word gSoundContext
.L_02218324: .word 0x1fb
.size func_ov088_02218290, . - func_ov088_02218290
