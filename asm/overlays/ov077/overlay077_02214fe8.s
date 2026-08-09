.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern func_ov077_02215494
.extern func_ov077_02215f34

.global func_ov077_02214fe8
func_ov077_02214fe8:
    stmdb sp!, {r3, lr}
    add r2, r0, #0x200
    ldrsb r2, [r2, #0xe4]
    mov r2, r2, lsl #0x1c
    movs r2, r2, asr #0x1c
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_02215014
    bl func_ov077_02215f34
    ldmia sp!, {r3, pc}
.L_02215014:
    bl func_ov077_02215494
    ldmia sp!, {r3, pc}
.size func_ov077_02214fe8, . - func_ov077_02214fe8
