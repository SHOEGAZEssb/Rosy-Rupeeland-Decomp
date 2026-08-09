.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern func_02005030
.extern func_ov050_0220d874

.global func_ov050_0220d824
func_ov050_0220d824:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov050_0220d874
    mov r0, #0x0
    str r0, [r7, #0x10]
    str r6, [r7, #0x14]
    str r5, [r7, #0x18]
    ldr r1, [sp, #0x18]
    add r0, r7, #0x20
    str r4, [r7, #0x1c]
    bl func_02005030
    mov r0, #0x1000
    str r0, [r7, #0x30]
    mov r1, #0x1
    mov r0, r7
    str r1, [r7, #0x34]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov050_0220d824, . - func_ov050_0220d824
