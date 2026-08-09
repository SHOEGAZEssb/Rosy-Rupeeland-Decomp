.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern func_02003e38
.extern func_02005058

.global func_ov073_022102dc
func_ov073_022102dc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, #0x0
    b .L_0221030c
.L_022102ec:
    ldr r0, [r5, #0x0]
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_02210308
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210308:
    add r4, r4, #0x1
.L_0221030c:
    ldr r0, [r5, #0x3c]
    cmp r4, r0
    blt .L_022102ec
    ldr r0, [r5, #0x0]
    bl func_02003e38
    add r0, r5, #0x18
    bl func_02005058
    add r0, r5, #0x8
    bl func_02005058
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov073_022102dc, . - func_ov073_022102dc
