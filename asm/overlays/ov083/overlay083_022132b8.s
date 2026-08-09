.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_0204067c

.global func_ov083_022132b8
func_ov083_022132b8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0204067c
    movs r4, r0
    ldrne r0, [r5, #0x298]
    cmpne r0, #0x0
    beq .L_022132f4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x114]
    blx r1
    ldr r0, [r5, #0x298]
    mov r1, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_022132f4:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov083_022132b8, . - func_ov083_022132b8
