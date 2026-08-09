.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern func_02072bdc
.extern func_020bf1f8
.extern func_ov055_0220e518
.extern genrand_int32

.global func_ov055_0220e804
func_ov055_0220e804:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x40]
    subs r0, r0, #0x1
    str r0, [r5, #0x40]
    bpl .L_0220e854
    bl genrand_int32
    and r0, r0, #0x3
    add r0, r0, #0x6
    str r0, [r5, #0x40]
    mov r4, #0x3
.L_0220e830:
    bl genrand_int32
    mov r1, r4
    bl func_020bf1f8
    ldr r0, [r5, #0x34]
    ldrb r2, [r0, #0x39]
    cmp r1, r2
    beq .L_0220e830
    and r1, r1, #0xff
    bl func_02072bdc
.L_0220e854:
    ldr r0, [r5, #0x44]
    bl func_ov055_0220e518
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov055_0220e804, . - func_ov055_0220e804
