.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_020e7318
.extern data_ov080_02213e68
.extern Sound_StopEffect
.extern gSoundContext

.global func_ov080_02213960
func_ov080_02213960:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov ip, #0x0
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    strb ip, [r4, #0x24c]
    add r2, r4, #0x200
    strh ip, [r2, #0x5a]
    ldr r3, .L_022139e0
    strh ip, [r2, #0x56]
    ldr ip, [r3, #0x50]
    ldr r2, [r3, #0x54]
    str ip, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x160]
    blx r2
    ldrh r2, [r4, #0x4e]
    ldr r1, .L_022139e4
    ldr r0, .L_022139e8
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_022139d8
    ldr r0, .L_022139ec
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_StopEffect
.L_022139d8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_022139e0: .word data_ov080_02213e68
.L_022139e4: .word data_020e7318
.L_022139e8: .word 0xffff
.L_022139ec: .word gSoundContext
.size func_ov080_02213960, . - func_ov080_02213960
