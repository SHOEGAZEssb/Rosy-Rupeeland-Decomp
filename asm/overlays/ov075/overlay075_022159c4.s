.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_022175ec
.extern func_02004fe0
.extern func_02043de4

.global func_ov075_022159c4
func_ov075_022159c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02043de4
    ldr r0, .L_02215a20
    add r2, r4, #0x200
    str r0, [r4, #0x0]
    mov ip, #0x0
    strh ip, [r2, #0xa0]
    ldrh r3, [r2, #0xa2]
    ldr r1, .L_02215a24
    add r0, r4, #0x2ac
    bic r3, r3, #0x1
    strh r3, [r2, #0xa2]
    ldrh r3, [r2, #0xa2]
    orr r3, r3, #0x2
    and r1, r3, r1
    strh r1, [r2, #0xa2]
    strh ip, [r2, #0xa4]
    strh ip, [r2, #0xa6]
    str ip, [r4, #0x2a8]
    bl func_02004fe0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02215a20: .word data_ov075_022175ec
.L_02215a24: .word 0xffff0003
.size func_ov075_022159c4, . - func_ov075_022159c4
