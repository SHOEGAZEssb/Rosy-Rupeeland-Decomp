.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221a4c8
.extern func_020593dc
.extern func_ov097_0221818c
.extern gSoundContext

.global func_ov097_022180bc
func_ov097_022180bc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    mov r3, r0
    ldr r1, [r3, #0x260]
    mov r0, #0x1a
    orr r1, r1, #0x21
    bic r1, r1, #0xa
    str r1, [r3, #0x260]
    strh r0, [r3, #0xd6]
    mov r0, #0x3
    strb r0, [r3, #0x24c]
    add r0, r3, #0x200
    ldrsh r0, [r0, #0xc2]
    cmp r0, #0x0
    add r0, r3, #0x200
    ldrsh r1, [r0, #0x98]
    moveq r2, #0x78
    movne r2, #0x1e
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r1, [r0, #0x98]
    cmp r1, r2
    bge .L_02218130
    mov r1, #0x0
    add r0, r3, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov097_0221818c
    b .L_0221817c
.L_02218130:
    ldr r1, .L_02218184
    mov r2, #0x0
    ldr ip, [r1, #0x30]
    ldr r1, [r1, #0x34]
    str ip, [r3, #0x2a4]
    str r1, [r3, #0x2a8]
    strh r2, [r0, #0x98]
    strh r2, [r0, #0x9c]
    strh r2, [r0, #0xc2]
    str r2, [r3, #0x2b4]
    str r2, [r3, #0x2b0]
    sub r0, r2, #0x100
    str r0, [sp, #0x0]
    mov r1, #0x100
    str r1, [sp, #0x4]
    ldr r0, .L_02218188
    mov r1, #0x61
    ldr r0, [r0, #0x0]
    bl func_020593dc
.L_0221817c:
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_02218184: .word data_ov097_0221a4c8
.L_02218188: .word gSoundContext
.size func_ov097_022180bc, . - func_ov097_022180bc
