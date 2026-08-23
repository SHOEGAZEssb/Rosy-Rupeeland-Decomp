.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Actor_GetGravityAcceleration
.extern func_020befec

.global func_ov095_02217da8
func_ov095_02217da8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_GetGravityAcceleration
    ldrsh r1, [r4, #0xda]
    cmp r1, #0x7
    bne .L_02217dd0
    rsb r0, r0, r0, lsl #0x3
    mov r1, #0x5
    bl func_020befec
    ldmia sp!, {r4, pc}
.L_02217dd0:
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x44]
    cmp r1, #0x0
    ldmltia sp!, {r4, pc}
    add r0, r0, r0, lsl #0x2
    mov r1, #0x7
    bl func_020befec
    ldmia sp!, {r4, pc}
.size func_ov095_02217da8, . - func_ov095_02217da8
