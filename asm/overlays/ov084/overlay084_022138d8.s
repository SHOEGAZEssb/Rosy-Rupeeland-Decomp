.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_02033f44
.extern func_02040234
.extern func_020536b8
.extern func_020537f0
.extern func_ov084_02213b2c

.global func_ov084_022138d8
func_ov084_022138d8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    bl func_02040234
    cmp r0, #0x0
    beq .L_02213948
    mov r0, r5
    bl func_020536b8
    movs r4, r0
    bne .L_0221390c
    mov r0, r5
    bl func_020537f0
    mov r4, r0
.L_0221390c:
    cmp r4, #0x0
    beq .L_02213948
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl func_02005030
    mov r0, r4
    bl func_02033f44
    str r0, [sp, #0xc]
    add r1, sp, #0x0
    mov r0, r5
    bl func_ov084_02213b2c
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
    b .L_0221394c
.L_02213948:
    mov r0, #0x0
.L_0221394c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_022138d8, . - func_ov084_022138d8
