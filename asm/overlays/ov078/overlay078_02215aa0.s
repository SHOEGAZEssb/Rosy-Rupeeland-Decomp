.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_020c9670

.global func_ov078_02215aa0
func_ov078_02215aa0:
    add r0, r0, #0x200
    ldrh r3, [r0, #0xbc]
    ldr r2, .L_02215ad0
    ldrsh ip, [r1, #0x12]
    mov r1, r3, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r2, [r2, r1]
    add r1, r3, #0x200
    strh r1, [r0, #0xbc]
    add r1, ip, r2, asr #0x9
    mul r0, r1, r1
    bx lr
.L_02215ad0: .word data_020c9670
.size func_ov078_02215aa0, . - func_ov078_02215aa0
