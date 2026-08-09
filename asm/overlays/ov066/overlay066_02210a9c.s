.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern func_020740a4
.extern func_ov066_02210550
.extern func_ov066_02210b20

.global func_ov066_02210a9c
func_ov066_02210a9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, #0x0
    mov r4, r0
    mov r5, r6
    b .L_02210adc
.L_02210ab0:
    mov r8, r5
    ldr r7, [r4, r6, lsl #0x2]
    b .L_02210ad0
.L_02210abc:
    ldr r2, [r4, r8, lsl #0x2]
    mov r0, r4
    mov r1, r7
    bl func_ov066_02210b20
    add r8, r8, #0x1
.L_02210ad0:
    cmp r8, r6
    blt .L_02210abc
    add r6, r6, #0x1
.L_02210adc:
    ldr r0, [r4, #0x190]
    cmp r6, r0
    blt .L_02210ab0
    mov r5, #0x0
    b .L_02210b08
.L_02210af0:
    ldr r0, [r4, r5, lsl #0x2]
    ldr r2, [r4, #0x1b8]
    ldr r3, [r4, #0x1b4]
    add r1, r4, #0x194
    bl func_ov066_02210550
    add r5, r5, #0x1
.L_02210b08:
    ldr r0, [r4, #0x190]
    cmp r5, r0
    blt .L_02210af0
    ldr r0, [r4, #0x1a4]
    bl func_020740a4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov066_02210a9c, . - func_ov066_02210a9c
