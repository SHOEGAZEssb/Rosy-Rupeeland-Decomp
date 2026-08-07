    .text
/* Exact fallback; see src/overlays/ov022/overlay022_selection_effect.c. */
    .extern data_020d7834
    .extern gGameWork

.global func_ov022_021fe94c
func_ov022_021fe94c:
    ldr r2, [r0, #0x2b4]
    ldr r1, L_021fe9e0
    ldr r3, [r2, #0x38]
    ldr r2, [r2, #0xc]
    ldr ip, [r1, #0x0]
    add r1, r3, r2, lsl #0x3
    ldr r1, [r1, #0x4]
    mov r2, #0x2
    add r1, ip, r1
    add r1, r1, #0x5000
    strb r2, [r1, #0xe94]
    ldr r2, [r0, #0x2b4]
    mov r1, #0x34
    ldr ip, [r2, #0x38]
    ldr r3, [r2, #0xc]
    ldr r2, L_021fe9e4
    ldr r3, [ip, r3, lsl #0x3]
    str r3, [r0, #0x360]
    ldrsh r3, [r3, #0x0]
    smulbb r1, r3, r1
    str r3, [r0, #0x358]
    ldr r1, [r2, r1]
    str r1, [r0, #0x364]
    b L_021fe9cc
L_021fe9ac:
    ldr r1, [r0, #0x360]
    ldrh r2, [r2, #0xa]
    ldrh r1, [r1, #0x1c]
    cmp r2, r1
    bxeq lr
    ldr r1, [r0, #0x364]
    add r1, r1, #0xc
    str r1, [r0, #0x364]
L_021fe9cc:
    ldr r2, [r0, #0x364]
    ldrsh r1, [r2, #0x0]
    cmp r1, #0x3
    bne L_021fe9ac
    bx lr
L_021fe9e0: .word gGameWork
L_021fe9e4: .word data_020d7834
.size func_ov022_021fe94c, . - func_ov022_021fe94c
