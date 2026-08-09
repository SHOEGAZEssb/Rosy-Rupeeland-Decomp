.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210178

.global func_ov059_02210c24
func_ov059_02210c24:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, #0x0
    mov r4, #0x70
    b .L_02210c50
.L_02210c3c:
    ldr r0, [r7, #0x0]
    mov r1, r6
    mla r0, r5, r4, r0
    bl func_ov059_02210178
    add r5, r5, #0x1
.L_02210c50:
    ldr r0, [r7, #0x4]
    cmp r5, r0
    blt .L_02210c3c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov059_02210c24, . - func_ov059_02210c24
