.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_020740a4
.extern func_ov055_0220e804
.extern func_ov055_0220eefc

.global func_ov055_0220eb68
func_ov055_0220eb68:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r1, #0x0
    mov r4, r0
    add r0, sp, #0x0
    mov r3, r1
    mov r2, #0x42000
    bl func_0200500c
    add r1, sp, #0x0
    add r0, r4, #0x8
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    mov r0, r4
    add r1, r4, #0x8
    bl func_ov055_0220eefc
    ldr r0, [r4, #0x24]
    bl func_ov055_0220e804
    ldr r0, [r4, #0x2c]
    ldr r1, [r4, #0x1c]
    cmp r0, #0x0
    mov r0, #0x0
    streq r0, [r1, #0x18]
    moveq r0, #0x60
    strne r0, [r1, #0x18]
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x1c]
    bl func_020740a4
    mov r0, #0x0
    mov r1, #0x5000000
    strh r0, [r1, #0x0]
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov055_0220eb68, . - func_ov055_0220eb68
