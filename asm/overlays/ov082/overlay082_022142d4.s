.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_0221483c

.global func_ov082_022142d4
func_ov082_022142d4:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x260]
    bic r1, r1, #0x3
    str r1, [r0, #0x260]
    ldrsh r1, [r0, #0xda]
    cmp r1, #0x0
    moveq r1, #0x1
    streqh r1, [r0, #0xda]
    beq .L_0221434c
    ldr r1, [r0, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0221434c
    ldr r1, .L_02214354
    mov r3, #0x0
    ldr lr, [r1, #0x38]
    ldr ip, [r1, #0x3c]
    mov r2, #0x4
    str lr, [r0, #0x218]
    str ip, [r0, #0x21c]
    ldr ip, [r1, #0x0]
    ldr r1, [r1, #0x4]
    str ip, [r0, #0x220]
    str r1, [r0, #0x224]
    strh r3, [r0, #0xda]
    str r3, [r0, #0xc8]
    strb r2, [r0, #0xd4]
    str r3, [r0, #0x228]
.L_0221434c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02214354: .word data_ov082_0221483c
.size func_ov082_022142d4, . - func_ov082_022142d4
