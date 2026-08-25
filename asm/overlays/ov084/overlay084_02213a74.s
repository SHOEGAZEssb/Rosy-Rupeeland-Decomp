.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern ActorExtendedType2_FindEligibleCandidateSlot2
.extern func_ov084_02213bc8

.global func_ov084_02213a74
func_ov084_02213a74:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r1, #0x7
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    strb r1, [r4, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xa8]
    cmp r0, #0x1
    beq .L_02213acc
    cmp r0, #0x2
    beq .L_02213ad8
    cmp r0, #0x3
    beq .L_02213af4
    b .L_02213b04
.L_02213acc:
    mov r0, r4
    bl func_ov084_02213bc8
    b .L_02213b04
.L_02213ad8:
    mov r0, r4
    bl ActorExtendedType2_FindEligibleCandidateSlot2
    cmp r0, #0x0
    bne .L_02213b04
    mov r0, r4
    bl func_ov084_02213bc8
    b .L_02213b04
.L_02213af4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
.L_02213b04:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov084_02213a74, . - func_ov084_02213a74
