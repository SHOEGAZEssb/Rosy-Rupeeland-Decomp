.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210508

.global func_ov059_02210db0
func_ov059_02210db0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    str r7, [r8, #0xc]
    str r6, [r8, #0x10]
    mov r5, #0x0
    mov r4, #0x70
    b .L_02210dec
.L_02210dd4:
    ldr r0, [r8, #0x0]
    mov r1, r7
    mla r0, r5, r4, r0
    mov r2, r6
    bl func_ov059_02210508
    add r5, r5, #0x1
.L_02210dec:
    ldr r0, [r8, #0x4]
    cmp r5, r0
    blt .L_02210dd4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov059_02210db0, . - func_ov059_02210db0
