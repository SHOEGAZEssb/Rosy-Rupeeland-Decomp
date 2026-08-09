.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern data_ov075_022172f8
.extern data_ov075_02217300

.global func_ov075_022154e8
func_ov075_022154e8:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02215568
    mov ip, #0x1
    ldr r3, [r0, #0x218]
    ldr r1, [r1, #0x68]
    mov lr, ip
    cmp r3, r1
    ldr r1, .L_0221556c
    bne .L_02215520
    ldr r2, [r0, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq lr, #0x0
.L_02215520:
    cmp lr, #0x0
    beq .L_02215560
    ldr r1, .L_02215568
    ldr r2, [r0, #0x220]
    ldr r1, [r1, #0x70]
    mov lr, #0x1
    cmp r2, r1
    ldr r3, .L_02215570
    bne .L_02215558
    ldr r1, [r0, #0x224]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq lr, #0x0
.L_02215558:
    cmp lr, #0x0
    movne ip, #0x0
.L_02215560:
    mov r0, ip
    ldmia sp!, {r3, pc}
.L_02215568: .word data_ov075_02217290
.L_0221556c: .word data_ov075_022172f8
.L_02215570: .word data_ov075_02217300
.size func_ov075_022154e8, . - func_ov075_022154e8
