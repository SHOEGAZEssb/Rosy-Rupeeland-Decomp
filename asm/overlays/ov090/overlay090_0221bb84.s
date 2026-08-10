.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern data_ov090_0221cc88
.extern DisplayController_GetVerticalOffset
.extern UtilAnimationResource_UpdatePosition

.global func_ov090_0221bb84
func_ov090_0221bb84:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r0, [r1, #0x4]
    ldr ip, [r4, #0x14]
    mov r2, r0, asr #0xc
    mov r0, ip, asr #0xc
    ldr lr, [r4, #0x10]
    ldr r3, [r4, #0xc]
    ldr ip, [r1, #0x8]
    rsb lr, r0, lr, asr #0xc
    ldr r0, [r4, #0x4]
    rsb r1, r2, r3, asr #0xc
    str r1, [r0, #0x18]
    ldr r0, [r4, #0x4]
    sub r1, lr, ip, asr #0xc
    str r1, [r0, #0x1c]
    bl DisplayController_GetVerticalOffset
    ldr r3, .L_0221bc08
    mov r2, #0x0
    mvn r1, #0xbf
    sub ip, r1, r0
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str ip, [sp, #0x8]
    ldr r0, [r4, #0x4]
    add r1, sp, #0x0
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    str ip, [sp, #0x14]
    bl UtilAnimationResource_UpdatePosition
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0221bc08: .word data_ov090_0221cc88
.size func_ov090_0221bb84, . - func_ov090_0221bb84
