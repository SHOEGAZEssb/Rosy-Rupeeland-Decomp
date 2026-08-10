.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_ov084_02214108
.extern data_ov084_02214118
.extern data_ov084_02214140
.extern ActorExtendedType2_IsInteractionEligible

.global func_ov084_02213608
func_ov084_02213608:
    stmdb sp!, {r3, lr}
    ldr r2, .L_022136a4
    ldr ip, [r0, #0x218]
    ldr r2, [r2, #0x38]
    mov lr, #0x1
    cmp ip, r2
    ldr r2, .L_022136a8
    bne .L_0221363c
    ldr r3, [r0, #0x21c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq lr, #0x0
.L_0221363c:
    cmp lr, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    bne .L_02213694
    ldr r2, .L_022136a4
    ldr ip, [r0, #0x218]
    ldr r2, [r2, #0x10]
    mov lr, #0x1
    cmp ip, r2
    ldr r2, .L_022136ac
    bne .L_02213680
    ldr r3, [r0, #0x21c]
    ldr r2, [r2, #0x4]
    cmp r3, r2
    cmpne ip, #0x0
    moveq lr, #0x0
.L_02213680:
    cmp lr, #0x0
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_0221369c
.L_02213694:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0221369c:
    bl ActorExtendedType2_IsInteractionEligible
    ldmia sp!, {r3, pc}
.L_022136a4: .word data_ov084_02214108
.L_022136a8: .word data_ov084_02214140
.L_022136ac: .word data_ov084_02214118
.size func_ov084_02213608, . - func_ov084_02213608
