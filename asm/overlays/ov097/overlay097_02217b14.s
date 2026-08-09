.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02033f4c
.extern func_020befec

.global func_ov097_02217b14
func_ov097_02217b14:
    stmdb sp!, {r3, lr}
    ldrsh r1, [r0, #0xda]
    cmp r1, #0x0
    bne .L_02217b44
    ldr r1, [r0, #0x44]
    cmp r1, #0x0
    blt .L_02217b44
    bl func_02033f4c
    add r0, r0, r0, lsl #0x2
    mov r1, #0x7
    bl func_020befec
    ldmia sp!, {r3, pc}
.L_02217b44:
    bl func_02033f4c
    ldmia sp!, {r3, pc}
.size func_ov097_02217b14, . - func_ov097_02217b14
