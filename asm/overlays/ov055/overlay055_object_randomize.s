.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern func_02072b68
.extern func_020bf1f8
.extern genrand_int32

.global func_ov055_0220e518
func_ov055_0220e518:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x2
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    subs r0, r0, #0x1
    str r0, [r4, #0x4]
    ldmplia sp!, {r4, pc}
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    mov r0, #0xf0
    mul r0, r1, r0
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl func_02072b68
    ldr r1, [r4, #0x0]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.size func_ov055_0220e518, . - func_ov055_0220e518
