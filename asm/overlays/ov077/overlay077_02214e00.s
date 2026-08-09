.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Sound_Play
.extern func_020349b8
.extern gSoundContext

.global func_ov077_02214e00
func_ov077_02214e00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r2, [r0, #0xe8]
    cmp r2, #0x0
    ldreqsh r2, [r0, #0xea]
    cmpeq r2, #0x0
    ldreqsh r0, [r0, #0xec]
    cmpeq r0, #0x0
    bne .L_02214eb8
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x71
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214e74
    mov r0, r1
    add r2, r4, #0x200
    mov r3, #0x1
    strh r3, [r2, #0xea]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xe8]
    blx r2
    ldr r1, .L_02214ee4
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    ldmia sp!, {r4, pc}
.L_02214e74:
    add r0, r4, #0x200
    mov r4, #0xb4
    strh r4, [r0, #0xec]
    ldr r0, [r1, #0x3c]
    ldr r3, .L_02214ee8
    mov r0, r0, lsl #0x1
    rsb r0, r0, #0x0
    str r0, [r1, #0x3c]
    ldr r0, [r1, #0x40]
    mov r2, #0x7
    mov r0, r0, lsl #0x1
    rsb r0, r0, #0x0
    str r0, [r1, #0x40]
    ldr r0, [r3, #0x0]
    add r1, r4, #0x8b
    bl Sound_Play
    ldmia sp!, {r4, pc}
.L_02214eb8:
    ldr r0, [r1, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [r1, #0x3c]
    ldr r0, [r1, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    str r0, [r1, #0x40]
    ldmia sp!, {r4, pc}
.L_02214ee4: .word 0x9f80
.L_02214ee8: .word gSoundContext
.size func_ov077_02214e00, . - func_ov077_02214e00
