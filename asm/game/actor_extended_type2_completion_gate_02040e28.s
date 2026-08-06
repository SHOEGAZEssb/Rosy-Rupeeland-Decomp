; Matching retail form; see src/game/actor_extended_type2_completion_gate.c.
.text
.extern data_020df9e8
.extern data_020e6c0c
.extern data_020e7318
.extern func_02040590
.extern func_0205940c
.extern gSoundContext
.global func_02040e28
.type func_02040e28, @function
func_02040e28: ; 0x02040e28
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r1, #0x1
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    strb r1, [r4, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    mov r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r2, [r4, #0x4e]
    ldr r1, .L_02040f38
    ldrb r1, [r1, r2]
    cmp r1, #0x0
    beq .L_02040e8c
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    movne r0, #0x1
    b .L_02040ea8
.L_02040e8c:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldrsh r1, [r1, #0x5a]
    cmp r1, #0x1e
    movgt r0, #0x1
.L_02040ea8:
    cmp r0, #0x0
    beq .L_02040f30
    add r0, r4, #0x200
    mov r2, #0x0
    strh r2, [r0, #0x5a]
    ldr r1, .L_02040f3c
    strh r2, [r0, #0x56]
    ldr r2, [r1, #0x2a0]
    ldr r0, [r1, #0x2a4]
    ldr r1, .L_02040f40
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r2, [r4, #0x260]
    ldr r0, .L_02040f44
    orr r2, r2, #0x4
    str r2, [r4, #0x260]
    ldrh r2, [r4, #0x4e]
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_02040f10
    ldr r0, .L_02040f48
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_02040f10:
    mov r0, r4
    bl func_02040590
    ldrh r0, [r4, #0x4e]
    cmp r0, #0x30
    moveq r0, #0x7
    streqh r0, [r4, #0xd6]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02040f30:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02040f38: .word data_020e6c0c
.L_02040f3c: .word data_020df9e8
.L_02040f40: .word data_020e7318
.L_02040f44: .word 0xffff
.L_02040f48: .word gSoundContext
.size func_02040e28, . - func_02040e28
