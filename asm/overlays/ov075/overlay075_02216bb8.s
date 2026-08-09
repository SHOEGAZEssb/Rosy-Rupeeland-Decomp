.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290

.global func_ov075_02216bb8
func_ov075_02216bb8:
    ldr r2, [r0, #0x260]
    mov r1, #0x8
    bic r2, r2, #0x1
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    mov r1, #0x16
    strh r1, [r0, #0xd6]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0x5a]
    sub r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldrsh r1, [r1, #0x5a]
    cmp r1, #0x0
    bge .L_02216c14
    ldr r1, .L_02216c1c
    ldr r3, [r1, #0x88]
    ldr r2, [r1, #0x8c]
    str r3, [r0, #0x218]
    str r2, [r0, #0x21c]
    ldr r2, [r1, #0x80]
    ldr r1, [r1, #0x84]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
.L_02216c14:
    mov r0, #0x0
    bx lr
.L_02216c1c: .word data_ov075_02217290
.size func_ov075_02216bb8, . - func_ov075_02216bb8
