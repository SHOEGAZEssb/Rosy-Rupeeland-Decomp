.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_02214aac
.extern func_020435f4

.global func_ov082_02214430
func_ov082_02214430:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    orr r1, r2, #0x3
    str r1, [r5, #0x260]
    ldr r1, [r5, #0x298]
    cmp r1, #0x0
    bne .L_02214468
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02214468:
    bl func_020435f4
    cmp r0, #0x0
    bne .L_0221447c
    mov r0, #0xb
    b .L_02214480
.L_0221447c:
    mov r0, #0x0
.L_02214480:
    strb r0, [r5, #0x24c]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_022144c4
    ldr r0, .L_022144e4
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_022144dc
.L_022144c4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r1, [r5, #0x298]
    ldr r2, [r2, #0xd0]
    add r1, r1, #0x18
    blx r2
.L_022144dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_022144e4: .word data_ov082_02214aac
.size func_ov082_02214430, . - func_ov082_02214430
