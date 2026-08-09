.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern data_ov070_02212a70
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4

.global func_ov070_02210320
func_ov070_02210320:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_02004fe0
    ldr r1, [r4, #0xd4]
    ldr r0, .L_022103d4
    sub r1, r1, #0x80000
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x11c]
    ldr r2, [r4, #0xd8]
    ldr r0, [r0, r1, lsl #0x2]
    sub r0, r2, r0
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x11c]
    cmp r0, #0x0
    beq .L_022103b4
    ldr r2, [r4, #0xf0]
    mov r0, #0x46000
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, ip, #0x800
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mov r0, #0x46000
    cmp r1, #0x46000
    movgt r1, #0x3c000
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r1, r0, #0xa000
    ldr r0, [sp, #0x8]
    add r0, r0, r1
    str r0, [sp, #0x8]
.L_022103b4:
    ldr r0, [r4, #0x48]
    add r1, sp, #0x0
    add r0, r0, #0x19c
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_022103d4: .word data_ov070_02212a70
.size func_ov070_02210320, . - func_ov070_02210320
