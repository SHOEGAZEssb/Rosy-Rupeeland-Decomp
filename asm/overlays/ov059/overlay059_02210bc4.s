.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210308

.global func_ov059_02210bc4
func_ov059_02210bc4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    mov r4, #0x70
    b .L_02210be8
.L_02210bd8:
    ldr r0, [r6, #0x0]
    mla r0, r5, r4, r0
    bl func_ov059_02210308
    add r5, r5, #0x1
.L_02210be8:
    ldr r0, [r6, #0x4]
    cmp r5, r0
    blt .L_02210bd8
    ldr r0, .L_02210c1c
    ldr r3, [r6, #0xc]
    ldr r2, [r6, #0x10]
    mov r1, r0, lsl #0x10
    and r3, r3, r0
    and r1, r1, r2, lsl #0x10
    ldr r0, .L_02210c20
    orr r1, r3, r1
    str r1, [r0, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.L_02210c1c: .word 0x1ff
.L_02210c20: .word 0x4001010
.size func_ov059_02210bc4, . - func_ov059_02210bc4
