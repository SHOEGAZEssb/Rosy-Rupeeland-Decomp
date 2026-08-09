.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_ov075_02212fd8

.global func_ov075_02213cc0
func_ov075_02213cc0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    add r4, r6, #0x200
    b .L_02213cec
.L_02213cd4:
    ldr r0, [r6, #0x2a4]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_02213ce8
    bl func_ov075_02212fd8
.L_02213ce8:
    add r5, r5, #0x1
.L_02213cec:
    ldrsh r0, [r4, #0xa8]
    cmp r5, r0
    blt .L_02213cd4
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov075_02213cc0, . - func_ov075_02213cc0
