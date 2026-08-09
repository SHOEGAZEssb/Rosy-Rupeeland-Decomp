.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_ov077_02216fc8

.global func_ov077_02215444
func_ov077_02215444:
    stmdb sp!, {r4, lr}
    ldrb r2, [r0, #0x2e4]
    add r1, r0, #0x200
    ldr r3, .L_02215490
    bic r2, r2, #0x70
    strb r2, [r0, #0x2e4]
    ldrh r4, [r1, #0xf2]
    mov ip, #0x0
    add r2, r0, #0x300
    bic r4, r4, #0x1
    strh r4, [r1, #0xf2]
    ldr r4, [r3, #0x18]
    ldr lr, [r3, #0x1c]
    mov r3, #0x1000
    str r4, [r0, #0x218]
    str lr, [r0, #0x21c]
    strh ip, [r1, #0xec]
    strh r3, [r2, #0x2]
    ldmia sp!, {r4, pc}
.L_02215490: .word data_ov077_02216fc8
.size func_ov077_02215444, . - func_ov077_02215444
