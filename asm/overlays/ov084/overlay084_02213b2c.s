.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_020050a4
.extern Actor_SaveAndForceFlags
.extern func_ov084_022131fc

.global func_ov084_02213b2c
func_ov084_02213b2c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    add r2, r4, #0x200
    mov r3, #0x1
    add r0, r4, #0x298
    add r1, r4, #0x18
    strh r3, [r2, #0xa8]
    bl func_020050a4
    mov r1, r5
    add r0, r4, #0xb0
    bl func_020050a4
    mov r0, r4
    bl Actor_SaveAndForceFlags
    mov r1, #0x0
    add r0, r4, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r4, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x18
    strh r1, [r4, #0xae]
    add r0, r4, #0x200
    strh r1, [r0, #0xaa]
    mov r0, #0x2
    strh r0, [r4, #0xac]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_02213b2c, . - func_ov084_02213b2c
