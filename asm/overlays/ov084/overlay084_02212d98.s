.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_020e7318
.extern data_ov084_02214108
.extern func_0205940c
.extern gSoundContext

.global func_ov084_02212d98
func_ov084_02212d98:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r1, #0x0
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
    ldrsh r1, [r0, #0x5a]
    mov r2, #0x0
    add r1, r1, #0x1
    strh r1, [r0, #0x5a]
    ldrsh r0, [r0, #0x5a]
    cmp r0, #0xa
    movgt r2, #0x1
    cmp r2, #0x0
    beq .L_02212e54
    add r0, r4, #0x200
    mov r2, #0x0
    strh r2, [r0, #0x5a]
    ldr r1, .L_02212e5c
    strh r2, [r0, #0x56]
    ldr r2, [r1, #0x30]
    ldr r0, [r1, #0x34]
    ldr r1, .L_02212e60
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r2, [r4, #0x260]
    ldr r0, .L_02212e64
    orr r2, r2, #0x4
    str r2, [r4, #0x260]
    ldrh r2, [r4, #0x4e]
    mov r2, r2, lsl #0x1
    ldrh r2, [r1, r2]
    cmp r2, r0
    beq .L_02212e54
    ldr r0, .L_02212e68
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_02212e54:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02212e5c: .word data_ov084_02214108
.L_02212e60: .word data_020e7318
.L_02212e64: .word 0xffff
.L_02212e68: .word gSoundContext
.size func_ov084_02212d98, . - func_ov084_02212d98
