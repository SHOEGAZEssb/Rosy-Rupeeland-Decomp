; Matching retail form; see src/game/actor_motion_gamework_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02004fe0
.extern func_02005058
.extern func_02008740
.extern ActorMotion_UpdateOscillation
.extern func_02009c20
.extern gGameWork
.global func_02009a2c
func_02009a2c: ; 0x02009a2c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r6, r0
    ldr r2, [r6, #0x18]
    mov r5, r1
    cmp r2, #0x2
    mov r4, #0x0
    bne L_02009ac8
    ldr r1, [r6, #0x1c]
    ldr r0, [r6, #0x20]
    orrs r0, r1, r0
    beq L_02009ad0
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    ldr r0, [r6, #0x30]
    ble L_02009aa4
    orr r0, r0, #0x1
    str r0, [r6, #0x30]
    ldr r0, [r6, #0x2c]
    sub r0, r0, #0x1
    str r0, [r6, #0x2c]
    ldr r1, [r6, #0xc]
    ldr r0, [r6, #0x1c]
    add r0, r1, r0
    str r0, [r6, #0xc]
    ldr r1, [r6, #0x10]
    ldr r0, [r6, #0x20]
    add r0, r1, r0
    str r0, [r6, #0x10]
    b L_02009ad0
L_02009aa4:
    bic r0, r0, #0x1
    str r0, [r6, #0x30]
    ldr r0, [r6, #0x24]
    str r0, [r6, #0xc]
    ldr r0, [r6, #0x28]
    str r0, [r6, #0x10]
    str r4, [r6, #0x1c]
    str r4, [r6, #0x20]
    b L_02009ad0
L_02009ac8:
    bl func_02009c20
    mov r4, r0
L_02009ad0:
    ldrsh r0, [r5, #0x6]
    ldrsh r1, [r5, #0x0]
    cmp r0, #0x0
    ldrsh r0, [r5, #0x4]
    moveq r2, #0x1
    movne r2, #0x0
    cmp r0, #0x0
    moveq r3, #0x1
    movne r3, #0x0
    cmp r1, #0x0
    moveq ip, #0x1
    ldrsh r0, [r5, #0x2]
    movne ip, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    and r0, ip, r0
    and r0, r3, r0
    tst r2, r0
    bne L_02009b84
    ldr r0, [r6, #0xc]
    cmp r1, r0, asr #0xc
    movgt r0, r1, lsl #0xc
    strgt r0, [r6, #0xc]
    ldr r0, [r6, #0xc]
    ldrsh r1, [r5, #0x4]
    mov r0, r0, asr #0xc
    add r0, r0, #0x100
    cmp r0, r1
    subge r0, r1, #0x100
    movge r0, r0, lsl #0xc
    strge r0, [r6, #0xc]
    ldrsh r1, [r5, #0x2]
    ldr r0, [r6, #0x10]
    cmp r1, r0, asr #0xc
    movgt r0, r1, lsl #0xc
    strgt r0, [r6, #0x10]
    ldr r0, [r6, #0x10]
    ldrsh r1, [r5, #0x6]
    mov r0, r0, asr #0xc
    add r0, r0, #0xc0
    cmp r0, r1
    subge r0, r1, #0xc0
    movge r0, r0, lsl #0xc
    strge r0, [r6, #0x10]
L_02009b84:
    ldr r0, [r6, #0x30]
    tst r0, #0x2
    beq L_02009b98
    mov r0, r6
    bl ActorMotion_UpdateOscillation
L_02009b98:
    add r0, sp, #0x10
    add r1, r6, #0x44
    bl func_02008740
    ldr r0, L_02009c1c
    ldr r3, [r6, #0xc]
    ldr r1, [r0, #0x0]
    ldr r2, [sp, #0x14]
    ldr r0, [r6, #0x38]
    add r2, r3, r2
    sub r2, r2, r0
    add r0, sp, #0x10
    mov r2, r2, asr #0xc
    add r1, r1, #0x200
    strh r2, [r1, #0x32]
    bl func_02005058
    add r0, sp, #0x0
    add r1, r6, #0x44
    bl func_02008740
    ldr r0, L_02009c1c
    ldr r3, [r6, #0x10]
    ldr r1, [r0, #0x0]
    ldr r2, [sp, #0x8]
    ldr r0, [r6, #0x3c]
    add r2, r3, r2
    sub r2, r2, r0
    add r0, sp, #0x0
    mov r2, r2, asr #0xc
    add r1, r1, #0x200
    strh r2, [r1, #0x34]
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
L_02009c1c: .word gGameWork
    .size func_02009a2c, .-func_02009a2c

