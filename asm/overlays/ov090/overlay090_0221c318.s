.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern func_ov090_0221bb84

.global func_ov090_0221c318
func_ov090_0221c318:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
    b .L_0221c340
.L_0221c32c:
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r0, [r0, r4, lsl #0x2]
    bl func_ov090_0221bb84
    add r4, r4, #0x1
.L_0221c340:
    ldrsh r0, [r6, #0x8]
    cmp r4, r0
    blt .L_0221c32c
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov090_0221c318, . - func_ov090_0221c318
