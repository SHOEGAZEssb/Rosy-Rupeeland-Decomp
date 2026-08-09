.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern func_ov073_0220feb8

.global func_ov073_022106d0
func_ov073_022106d0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, #0x0
    b .L_02210700
.L_022106e8:
    ldr r0, [r7, #0x0]
    mov r1, r6
    ldr r0, [r0, r4, lsl #0x2]
    mov r2, r5
    bl func_ov073_0220feb8
    add r4, r4, #0x1
.L_02210700:
    ldr r0, [r7, #0x3c]
    cmp r4, r0
    blt .L_022106e8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov073_022106d0, . - func_ov073_022106d0
