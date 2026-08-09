.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern func_02074110

.global func_ov094_02217e94
func_ov094_02217e94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r1, #0x1
    moveq r1, #0x1
    streq r1, [r0, #0x20]
    ldreq r0, [r4, #0x10]
    streq r1, [r0, #0x20]
    ldmeqia sp!, {r4, pc}
    bl func_02074110
    ldr r0, [r4, #0x10]
    bl func_02074110
    ldmia sp!, {r4, pc}
.size func_ov094_02217e94, . - func_ov094_02217e94
