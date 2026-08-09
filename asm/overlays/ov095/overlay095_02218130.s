.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern OS_Halt
.extern data_021052fc
.extern data_ov095_0221cba8
.extern func_020050a4
.extern func_020593dc
.extern func_ov095_02218404
.extern gSoundContext
.extern genrand_int32

.global func_ov095_02218130
func_ov095_02218130:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r5, r1
    bl genrand_int32
    add r0, r4, #0x200
    strh r5, [r0, #0xd4]
    mov r1, #0x0
    strh r1, [r0, #0x98]
    ldr r3, [r4, #0x54]
    mov r2, #0x100
    strh r2, [r3, #0x32]
    strh r2, [r3, #0x34]
    ldr r2, [r4, #0x14]
    bic r2, r2, #0x40
    str r2, [r4, #0x14]
    ldrsh r2, [r0, #0xd4]
    cmp r2, #0x4
    addls pc, pc, r2, lsl #0x2
    b .L_022183ec
.L_02218180:
    b .L_02218194
    b .L_0221823c
    b .L_022182c8
    b .L_022182c4
    b .L_0221834c
.L_02218194:
    ldr r0, .L_022183f8
    ldr r1, .L_022183fc
    ldr r3, [r0, #0x30]
    ldr r2, [r0, #0x34]
    add r0, r4, #0x2f0
    str r3, [r4, #0x2a4]
    str r2, [r4, #0x2a8]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    str r1, [r4, #0x228]
    add r1, r1, #0x18
    bl func_020050a4
    mov r1, #0x0
    ldr r0, [r4, #0x2fc]
    mov r2, r1
    add r0, r0, #0x20000
    str r0, [r4, #0x2fc]
    ldr r0, [r4, #0x14]
    mov r3, r1
    orr ip, r0, #0x40
    add r0, r4, #0x38
    str ip, [r4, #0x14]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov095_02218404
    bl genrand_int32
    and r1, r0, #0x1
    add r0, r4, #0x200
    strh r1, [r0, #0xa2]
    ldrsh r1, [r0, #0xde]
    add r1, r1, #0x1
    strh r1, [r0, #0xde]
    b .L_022183f0
.L_0221823c:
    ldr r0, .L_022183f8
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r1, [r4, #0x2a4]
    str r0, [r4, #0x2a8]
    bl genrand_int32
    mov r1, #0x0
    and r2, r0, #0x1
    add r0, r4, #0x200
    strh r2, [r0, #0xa2]
    ldr r2, .L_022183fc
    strh r1, [r0, #0xde]
    ldr r0, [r2, #0x0]
    mov r2, r1
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r3, r1
    str r0, [r4, #0x228]
    ldr ip, [r4, #0x14]
    add r0, r4, #0x38
    orr ip, ip, #0x40
    str ip, [r4, #0x14]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov095_02218404
    b .L_022183f0
.L_022182c4:
    strh r1, [r0, #0xde]
.L_022182c8:
    ldr r0, .L_022183f8
    ldr r1, [r0, #0x38]
    ldr r0, [r0, #0x3c]
    str r1, [r4, #0x2a4]
    str r0, [r4, #0x2a8]
    bl genrand_int32
    and r1, r0, #0x1
    add r0, r4, #0x200
    ldr r2, .L_022183fc
    strh r1, [r0, #0xa2]
    mov r1, #0x0
    ldr r0, [r2, #0x0]
    mov r2, r1
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r3, r1
    str r0, [r4, #0x228]
    ldr ip, [r4, #0x14]
    add r0, r4, #0x38
    orr ip, ip, #0x40
    str ip, [r4, #0x14]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov095_02218404
    b .L_022183f0
.L_0221834c:
    ldr r0, .L_022183f8
    mov r2, r1
    ldr ip, [r0, #0x40]
    ldr r0, [r0, #0x44]
    mov r3, r1
    str ip, [r4, #0x2a4]
    str r0, [r4, #0x2a8]
    ldr ip, [r4, #0x14]
    add r0, r4, #0x38
    orr ip, ip, #0x40
    str ip, [r4, #0x14]
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov095_02218404
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov095_02218404
    bl genrand_int32
    and r1, r0, #0x1
    add r0, r4, #0x200
    strh r1, [r0, #0xa2]
    mov r3, r4
    ldrsh r4, [r0, #0xde]
    mov r2, #0x0
    mov r1, #0x200
    add r4, r4, #0x1
    strh r4, [r0, #0xde]
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    sub r1, r1, #0x12
    ldr r0, .L_02218400
    mov r2, #0xb
    ldr r0, [r0, #0x0]
    bl func_020593dc
    b .L_022183f0
.L_022183ec:
    bl OS_Halt
.L_022183f0:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_022183f8: .word data_ov095_0221cba8
.L_022183fc: .word data_021052fc
.L_02218400: .word gSoundContext
.size func_ov095_02218130, . - func_ov095_02218130
